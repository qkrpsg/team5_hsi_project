package com.kosmo.pickpic.service.web;

import java.security.Principal;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;


@Controller
public class UserController {
	//서비스 주입
	@Resource(name="accountService")
	private PickpicAccountServiceImpl accountService;
	
	
	//로그인
	@RequestMapping("/user/Login.pic")
	public String login(HttpSession session,Model model) throws Exception{
		return "login/Login.tiles";
	}//login
	
	@RequestMapping("/user/loginProcess.pic")
	public String loginProcess(@RequestParam Map map,HttpSession session,Model model,Principal principal) throws Exception{
		System.out.println("dddd"+principal.getName());
		
		session.setAttribute("ppa_email", principal.getName());

		return "home.tiles";
	}//login
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/validator/signUpEmailCheck.do",produces="text/html; charset=UTF-8")
	public String emailCheck(@RequestParam Map map,Model model,Map map2) throws Exception{
										//맵에는 아이디 값만 담겨있다
		boolean flag = accountService.isEmail(map);//이걸 좀 바꿔줘야 한다
		System.out.println(flag);
		
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
	
	//회원가입 
	@RequestMapping("/user/sign_up.pic")
	public String sign_up() throws Exception{
		
		return "login/Sign_Up.tiles";
	}//login

	//회원가입 프로세스   
	@RequestMapping("/user/sign_process.pic")
	public String sign_up_process(@RequestParam Map map) throws Exception{
		accountService.accountInsert(map);
		accountService.securityInsert(map);
		/*
		7 먼저 회원가입 축하 메시지를 띄우고 로그인 페이지로 보냅시다!
		*/
		return "login/Login.tiles";
	}//sign_up_process
	
	@ResponseBody
	@RequestMapping("/va/id.do")
	public String check2(@RequestParam Map map,Model model) throws Exception{
										//맵에는 아이디 값만 담겨있다
		System.out.println("코치코치");
		JSONObject json=new JSONObject();
		//JSON객체의 put("키값","값")메소드로 저장하면
		//{"키값":"값"} JSON형태의 데이타로 저장됨.
		json.put("flag", "Y");
		return json.toJSONString();
	}
	
	//로그아웃 프로세스  
	@RequestMapping("/user/logout.pic")
	public String logoutProcess(HttpSession session,@RequestParam Map map) throws Exception{
		session.invalidate();
		
		return "home.tiles";
	}//logoutProcess
	
	
	//마이페이지
	@RequestMapping("/user/myPage.pic")
	public String myPage() throws Exception{
		return "login/MyPage.tiles";
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
