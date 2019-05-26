package com.kosmo.pickpic.service.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.apigateway.model.Model;
import com.amazonaws.util.IOUtils;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.PickPlaceBoardServiceImpl;
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.S3Util;
import com.kosmo.pickpic.util.UploadFileUtils;

import io.netty.handler.codec.http.multipart.FileUpload;

@Controller
public class UploadController {
	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="ppbService")
	private PickPlaceBoardServiceImpl ppb_service;
	
	@ResponseBody
	@RequestMapping(value = "/user/uploadImage.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadImage (@RequestParam Map map, HttpServletRequest request,Principal principal) throws Exception{

		
		 
		
		
		String strImg = map.get("strImg").toString();
		
		//폴더 경로 지정
		String uploadpath = "pickpic/image";
		String folder = request.getServletContext().getRealPath("/") + uploadpath;
		//이미지 데이터 분류를 위한 split
		String[] strParts = strImg.split(",");
		String rstStrImg = strParts[1]; // ,로 구분하여 뒷 부분 이미지 데이터를 임시저장
		//파일명 앞에 현재 날짜를 저장 하기 위한 데이터 포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
		//서버에 저장될 파일 이름 지정
		String filenm = sdf.format(new Date()).toString() + "_pickImg.png";

		// base64 디코더를 이용하여 이미지 데이터를  byte 코드로 변환
		byte[] byteImg;
		byteImg = Base64.decodeBase64(rstStrImg); 
		//???
		ByteArrayInputStream bis = new ByteArrayInputStream(byteImg);
		BufferedImage image = null;
		// BufferedImage형식으로 변환후 저장
		image = ImageIO.read(bis); 
		bis.close();

		//서버에 저장될 파일 경로 +이름을 저장
		String fullpath = "";
		fullpath = folder + filenm;
		//서버에 저장될 경로로 설정한 File타입 객체 생성
		File folderObj = new File(folder);
		//디렉토리가 비어있는 경우 디렉토리 생성
		if (!folderObj.isDirectory())
			folderObj.mkdir();
		//파일 객체 생성
		File outputFile = new File(fullpath);
		//파일이 이미 존재하는경우 중복저장을 피하기 위해 생성된 파일 삭제
		if (outputFile.exists())
			outputFile.delete();

		//S3 연결을 위해 DB에서 Key값을 가져옴
		Map key = adminService.getAuthKey();
		String accessKey = key.get("A_ACCESSKEY").toString();
		String secretKey = key.get("A_SECRETKEY").toString();
		
		//서버에 파일 업로드(폴더 경로, 파일 이름, 이미지 데이터, 액세스키, 비밀키)
		String uploadedFileName = UploadFileUtils.uploadFile(uploadpath, filenm, byteImg, accessKey, secretKey);//실제 저장되는 장소
		//S3 이미지 업로드 절차 끝
		
		
		//서버에 저장된  파일 경로 디비에 저장
		map.put("ppb_image_path", uploadedFileName);
		map.put("ppa_email", principal.getName());
		System.out.println("map::::"+map.toString());
		int a = ppb_service.insert(map);
		/*if(a == 1) {
        	System.out.println("인설트 성공");
        }
		*/
		List<Map> user = new Vector<Map>();  
		user.add(map);
		return JSONArray.toJSONString(user);
	}
	

	@ResponseBody
	@RequestMapping(value = "/user/downloadImage.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String downloadImage(@RequestParam Map map, HttpServletRequest request) throws Exception{
		//S3를 이용한 이미지 다운로드 절차
		Map key = adminService.getAuthKey();
		String accessKey = key.get("A_ACCESSKEY").toString();
		String secretKey = key.get("A_SECRETKEY").toString();
		
		S3Util s3 = new S3Util(accessKey, secretKey); 
		String bucketName = "img.pickpic.com";
		
		s3.fileDownload(bucketName, "pickpic/image/2019/05/26/3bf4103a-15a8-4192-ba8c-ab637c509321_20190526_055059_testimg2.png");
		//S3를 이용한 이미지 다운로드 절차 끝
		
		List<Map> user = new Vector<Map>();  
		
		user.add(map);
		return JSONArray.toJSONString(user);
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/getImage.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String getImage(@RequestParam Map map, HttpServletRequest request) throws Exception{
		//S3를 이용한 이미지 가져오기 절차
		
		
		//1. 픽플레이스 리스트 페이지
		//이미지 경로(ppb_image_path)
		
		//2. 픽플레이스 상세보기 페이지
		//이미지 경로(ppb_image_path), 사용자 프로필(ppa_profile_image)
		
		//3. 마이페이지 
		//사용자 프로필(ppa_profile_image), 픽플레이스 이미지(ppb_image_path)
		
		
		
		//서버에 저장된 이미지 경로를 디비에서 추출
		String imgPath = "/2019/05/26/3bf4103a-15a8-4192-ba8c-ab637c509321_20190526_055059_testimg2.png";
		
		//디비에서 가져온 이미지 경로를 저장
		String img = "https://s3.ap-northeast-2.amazonaws.com/img.pickpic.com/pickpic/image" + imgPath;
		//S3를 이용한 이미지 가져오기 절차 끝  pickpic/image
		
		List<Map> user = new Vector<Map>();  
		map.put("img", img);
		
		user.add(map);
		
		return JSONArray.toJSONString(user);
	}
}
