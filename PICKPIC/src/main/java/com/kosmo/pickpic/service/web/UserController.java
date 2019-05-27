package com.kosmo.pickpic.service.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.FilterServiceImpl;
import com.kosmo.pickpic.service.impl.PickPlaceBoardServiceImpl;
import com.kosmo.pickpic.service.impl.PickRoadBoardServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.UploadFileUtils;


@Controller
public class UserController {
	//서비스 주입
	@Resource(name="accountService")
	private PickpicAccountServiceImpl accountService;

	@Resource(name = "fService")
	private FilterServiceImpl fService;
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	@Resource(name="ppbService")
	private PickPlaceBoardServiceImpl ppb_service;
	@Resource(name="prbService")
	private PickRoadBoardServiceImpl prb_service;
	
	
	//로그인
	@RequestMapping("/user/Login.pic")
	public String login() throws Exception{
		return "login/Login.tiles";
	}//login

	//로그인 성공시 프로세스
	@RequestMapping("/user/LoginProcess.pic")
	public String loginProcess(HttpSession session, @RequestParam Map map, Principal principal) throws Exception{
		//시큐리티를 통하여 저장된 이메일값 map에 저장
		
		map.put("ppa_email", principal.getName());
		//로그인 정보 저장
		accountService.loginHistoryInsert(map);
		//아이디와 닉네임을 세션에 저장
		PickpicAccountDTO user = accountService.oneUser(map);
		session.setAttribute("ppa_id", user.getPpa_id());
		session.setAttribute("ppa_email", user.getPpa_email());
		session.setAttribute("ppa_nickname", user.getPpa_nickname());
		
		return "home.tiles";
	}
	
	//로그인 실패시 프로세스
	@RequestMapping("/user/LoginProcessF.pic")
    public void loginProcessF(HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Exception error = (Exception) session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
    	System.out.println(error.getMessage());
        if (error != null) {
        	if(error.getMessage().equals("User is disabled"))
            	out.println("<script>alert('이메일 인증을 해주세요.'); history.go(-1);</script>");
        	else
        		out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
        }
        
        out.flush();
        out.close();
    }
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/validator/signUpEmailCheck.do",produces="text/html; charset=UTF-8")
	public String emailCheck(@RequestParam Map map) throws Exception{
										//맵에는 아이디 값만 담겨있다
//		System.out.println(map.get("ppa_email"));
		boolean flag = accountService.isEmail(map);//이걸 좀 바꿔줘야 한다
//		System.out.println(flag);
		
		JSONObject json=new JSONObject();
		if(map.get("ppa_email") == "") {
			json.put("error", "이메일를 입력해주세요");
			return json.toJSONString();
		}
		if(flag) {
			json.put("error", "사용 할 수 없는 이메일 입니다.");
			return json.toJSONString();
		}
		json.put("error", "사용 가능한 이메일 입니다.");
		return json.toJSONString();
	}//emailCheck
	
	//회원가입 페이지 이동
	@RequestMapping("/user/sign_up.pic")
	public String sign_up() throws Exception{
		
		return "login/Sign_Up.tiles";
	}//login

	//회원가입 프로세스   
	@RequestMapping("/user/sign_process.pic")
	public String sign_up_process(@RequestParam Map map, HttpServletResponse response, HttpServletRequest request) throws Exception{
		String strImg = map.get("ppa_profile_path").toString();
		System.out.println(map.toString());
		
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
		map.put("ppa_profile_path", uploadedFileName);
		
		if(accountService.accountInsert(map) == 1 ? true : false) {
			if(accountService.securityInsert(map) == 1 ? true : false) {
				accountService.loginHistoryInsert(map);
				
//				response.setContentType("text/html; charset=UTF-8");
//		        PrintWriter out = response.getWriter();
//		        out.println("<script>alert('가입 성공! 가입시 입력한 이메일을 통하여 이메일 인증해주세요!');</script>");
//		        out.flush();
//		        out.close();
//				return "/home";
			}//as테이블 insert 성공시 
		}//ppa테이블 insert 성공시
		return "home.tiles";
	}//sign_up_process
	
	//이메일 인증 프로세스
	@RequestMapping("/user/joinConfirm.pic")
	public String emailConfirm(@RequestParam Map map, HttpServletResponse response) throws Exception{
		map.put("as_enabled_flag", "1");
		accountService.securityUpdate(map);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		if(accountService.isAuthAbled(map)) {
	        out.println("<script>alert('이메일 인증이 완료되었습니다!'); location.href='http://localhost:8080/pickpic/';</script>");
	        out.flush();
	        out.close();
			return "/home";
		}
        out.println("<script>alert('이메일 인증에 실패하였습니다.'); location.href='http://localhost:8080/pickpic/';</script>");
        out.flush();
        out.close();
		
		return "/home";
	}
	
//	//로그아웃 프로세스  
//	@RequestMapping("/user/logout.pic")
//	public String logoutProcess(HttpSession session, Principal principal) throws Exception{
//		session.invalidate();
//		
//		
//		return "home.tiles";
//	}//logoutProcess
	
	
	//마이페이지
	@RequestMapping("/user/myPage.pic")
	public String myPage() throws Exception{
		
		return "login/my_page.tiles";
	}//myPage
	
	
	
	
	//주영테스트4 - 마이페이지 리스트
	@ResponseBody
	@RequestMapping(value="/user/myPage.do",produces="text/html; charset=UTF-8")
	public String myPage(@RequestParam Map map, Principal principal) throws Exception{
		
		System.out.println(map.toString());
		List<Map> list = new Vector<Map>();
		map.put("ppa_email", principal.getName());
		List<Map> list2 = new Vector<Map>();
		
		String type = map.get("id").toString();
		
		//내부 로직 처리
		//List<PickpicAccountDTO> list = userService.myPageList(map);
		//List<Map> list =  userService.myPageList(map);
		if(type.equals("myfilter")) {
//			List<filterStorageDTO> filterList =  userService.myPageList(map);
//			for(filterStorageDTO record : filterList) {
//				list.add(DTOUtil.convertDTOToMap(record));
//				}
			for(Map record : fService.albumDownFilterName(map)) {
				list.add(record);
			}//for
			
			
		}else if(type.equals("place")) {
			list = ppb_service.ppbMyPageList(map);
			for(Map list3:list) {
				list3.put("PPB_PICK", list3.get("PPB_PICK").toString());
				list3.put("PPB_INDEX", list3.get("PPB_INDEX").toString());
				list3.put("PPB_POST_DATE", list3.get("PPB_POST_DATE").toString().replace(":","_"));
				list3.put("PPB_IMAGE_PATH", "https://s3.ap-northeast-2.amazonaws.com/img.pickpic.com/pickpic/image" + list3.get("PPB_IMAGE_PATH").toString());
				list2.add(list3);
			}
			
			System.out.println(list.toString());
		}else if(type.equals("load")) {
			
			list =  prb_service.pickRoadMyPage(map);
			for(Map list3 : list) {
				//PRP_IMAGE_PATH
				//PRB_POST_DATE
				list3.put("PRB_POST_DATE", list3.get("PRB_POST_DATE").toString());
				list2.add(list3);
			}
			System.out.println("list:"+list.toString());
			
			System.out.println(JSONArray.toJSONString(list2));
		}
      
       return JSONArray.toJSONString(list2);
	}//myPage
	
	//정보수정
//	@RequestMapping("/user/changeInfo.pic")
//	public String changeInfo() throws Exception{
//		return "user/changeInfo.tiles";
//	}//changeInfo
	
	//탈퇴
//	@RequestMapping("/user/leaveMember.pic")
//	public String leaveMember() throws Exception{
//		return "user/leaveMember.tiles";
//	}//leaveMember
	
	//프로필 수정
//	@RequestMapping("/user/changeProfile.pic")
//	public String changeProfile() throws Exception{
//		return "user/changeProfile.tiles";
//	}//changeProfile
	
	//픽보관함
//	@RequestMapping("/user/pickStorage.pic")
//	public String pickStorage() throws Exception{
//		return "user/pickStorage.tiles";
//	}//pickStorage
	
	//마이픽플레이스
//	@RequestMapping("/user/myPlace.pic")
//	public String myPlace() throws Exception{
//		return "user/myPlace.tiles";
//	}//myPlace
	
	//마이픽로드
//	@RequestMapping("/user/myRoute.pic")
//	public String myRoute() throws Exception{
//		return "user/myRoute.tiles";
//	}//myRoute
	
	//보유필터
//	@RequestMapping("/user/haveFilter.pic")
//	public String haveFilter() throws Exception{
//		return "user/haveFilter.tiles";
//	}//haveFilter
}//userController
