package com.kosmo.pickpic.service.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
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
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.S3Util;
import com.kosmo.pickpic.util.UploadFileUtils;

import io.netty.handler.codec.http.multipart.FileUpload;

@Controller
public class UploadController {
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

//	@Inject
//	private ImageService service;
//	@Inject
//	private UserService userService;

	S3Util s3; 
	String bucketName = "img.pickpic.com";
	
	@ResponseBody
	@RequestMapping(value = "/user/uploadImage.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadImage (@RequestParam Map map, HttpServletRequest request) throws Exception{
		//S3를 이용한 이미지 업로드 절차

		System.out.println("map : " + map.toString());
		
		
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
		System.out.println("key : " + key.toString());
		System.out.println("ak : " + key.get("A_ACCESSKEY"));
		System.out.println("sk : " + key.get("A_SECRETKEY"));
		String accessKey = key.get("A_ACCESSKEY").toString();
		String secretKey = key.get("A_SECRETKEY").toString();
		s3 = new S3Util(accessKey, secretKey);
		
		//서버에 파일 업로드(폴더 경로, 파일 이름, 이미지 데이터, 액세스키, 비밀키)
		String uploadedFileName = UploadFileUtils.uploadFile(uploadpath, filenm, byteImg, accessKey, secretKey);//실제 저장되는 장소
		//S3 이미지 업로드 절차 끝
		
		
		
		
		//1. 회원가입
		//map에 저장된 파일이름 반환
		//파일 이름(ppa_profile_path)
//		String fileName = map.get("fileName").toString();
		
		//2. 픽플레이스 이미지
		//파일이름(ppb_image_path), 적용 필터(f_name)
		if(map.get("type").toString().equals("place")){
			//여기부터 진행하세욘
		}
		
		List<Map> user = new Vector<Map>();  
		map.put("img", uploadpath+filenm);
		System.out.println("img : " + map.get("img"));
		user.add(map);
		return JSONArray.toJSONString(user);
	}
	

	@ResponseBody
	@RequestMapping(value = "/user/downloadImage.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String downloadImage(@RequestParam Map map, HttpServletRequest request) throws Exception{
		//S3를 이용한 이미지 다운로드 절차
		s3.fileDownload(bucketName, "pickpic/image/2019/05/26/3bf4103a-15a8-4192-ba8c-ab637c509321_20190526_055059_testimg2.png");
		//S3를 이용한 이미지 다운로드 절차 끝
		
		List<Map> user = new Vector<Map>();  
//		map.put("img", img);
		
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
		String imgPath = "pickpic/image/2019/05/26/3bf4103a-15a8-4192-ba8c-ab637c509321_20190526_055059_testimg2.png";
		
		//디비에서 가져온 이미지 경로를 저장
		String img = "https://s3.ap-northeast-2.amazonaws.com/img.pickpic.com/" + imgPath;
		//S3를 이용한 이미지 가져오기 절차 끝
		
		List<Map> user = new Vector<Map>();  
		map.put("img", img);
		
		user.add(map);
		
		return JSONArray.toJSONString(user);
	}

	//자격증 & 신분증 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxCert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjaxCertificate(MultipartFile file) throws Exception {

		logger.info("자격증");
		logger.info("originalName: " + file.getOriginalFilename());
		String uploadpath = "almom/certificate";

		Map key = adminService.getAuthKey();
		String accessKey = key.get("a_accesskey").toString();
		String secretKey = key.get("a_secretkey").toString();
		s3 = new S3Util(accessKey, secretKey);
		ResponseEntity<String> img_path = new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes(), accessKey, secretKey),
				HttpStatus.CREATED);
		String certificatePath = (String) img_path.getBody();

		return certificatePath;
	}
	
	

	//커버이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxCover", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjaxCoverImg(MultipartFile file) throws Exception {

		logger.info("커버이미지");
		logger.info("originalName: " + file.getOriginalFilename());
		String uploadpath = "almom/coverImage";

		Map key = adminService.getAuthKey();
		String accessKey = key.get("a_accesskey").toString();
		String secretKey = key.get("a_secretkey").toString();
		s3 = new S3Util(accessKey, secretKey);
		ResponseEntity<String> img_path = new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes(), accessKey, secretKey),
				HttpStatus.CREATED);
		String coverImagePath = (String) img_path.getBody();

		return coverImagePath;
	}

	// 프로필 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxProfile.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		//프로필 이미지의 추가경로
		String uploadpath = "almom/profileImage";

		Map key = adminService.getAuthKey();
		String accessKey = key.get("a_accesskey").toString();
		String secretKey = key.get("a_secretkey").toString();
		s3 = new S3Util(accessKey, secretKey);
		ResponseEntity<String> img_path = new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes(), accessKey, secretKey),
				HttpStatus.CREATED);

		String user_imgPath = (String) img_path.getBody();

		logger.info(user_imgPath);

		//여기부터해야하는뭔지1도모르겠다
//		UserVO vo = new UserVO();
//		vo.setUser_profileImagePath(user_imgPath);
//		UserVO userSession = (UserVO) session.getAttribute("login");
//		vo.setUser_id(userSession.getUser_id());
		logger.info("file name : " + user_imgPath);

//		userService.uploadImg(vo);

//		userSession.setUser_profileImagePath(user_imgPath);
//		session.setAttribute("login", userSession);
		//여기까지
		logger.info(user_imgPath);
		return user_imgPath;
	}


	//프로필 이미지
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, String directory) throws Exception {
		logger.info(directory);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		logger.info("FILE NAME: " + fileName);

		String inputDirectory = null;
		if(directory.equals("profile")) {
			inputDirectory = "almom/profileImage";
		}
		else if(directory.equals("certificate")) {
			inputDirectory = "almom/certificate";
		}else {
			inputDirectory = "almom/coverImage";
		}



		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;
			try {
				url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				url = new URL(s3.getFileURL(bucketName, "default.jpg"));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, String directory)throws Exception {

		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("profile")) {
			inputDirectory = "almom/profileImage";
		}
		else if(directory.equals("certificate")) {
			inputDirectory = "almom/certificate";
		}else {
			inputDirectory = "almom/coverImage";
		}
		URL url;
		HttpURLConnection uCon = null;

		try {
			s3.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
//	s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}

		new File(inputDirectory + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFileDB", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFileDB(String fileName, String directory)throws Exception {

		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("profile")) {
			inputDirectory = "almom/profileImage";
		}
		else if(directory.equals("certificate")) {
			inputDirectory = "almom/certificate";
		}else {
			inputDirectory = "almom/coverImage";
		}
		URL url;
		HttpURLConnection uCon = null;

		try {
			s3.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
//		s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}
		//
//		service.deleteImage(fileName);//여기해야하는데뭔지모르겠습니다
		//
		new File(inputDirectory + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}


}
