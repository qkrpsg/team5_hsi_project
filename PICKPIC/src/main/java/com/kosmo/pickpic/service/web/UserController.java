package com.kosmo.pickpic.service.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.pickpic.service.impl.PickpicUserServiceImpl;


@Controller
public class UserController {
	//서비스 주입
	@Resource(name="userService")
	private PickpicUserServiceImpl userService;
	
	//로그인
	@RequestMapping("/user/Login.pic")
	public String login(HttpSession session,Model model) throws Exception{
		return "login/Login.tiles";
	}//login
	
	//로그인 처리 로직
	@RequestMapping("/user/loginProcess.pic")
	public String loginProcess(HttpSession session,@RequestParam Map map,Model model) throws Exception{
		boolean flag = userService.isMember(map);
		if(flag) {
			session.setAttribute("id", map.get("id"));
		}
		else{
			model.addAttribute("errorMsg", "회원 정보가 일치하지 않습니다");
			//회원 정보가 일치하지 않는경우 로그인페이지로 재이동
			return "login/Login.tiles";
		}//비회원이거나 아이디가 틀린경우
		//로그인 성공시 메인화면으로 이동
		return "home.tiles";
	}//loginProcess
	
	//home
	
	
	@RequestMapping("/user/home.pic")
	public String home() throws Exception{
		
		return "/home.tiles";
	}//login
	//회원가입 
	@RequestMapping("/user/sign_up.pic")
	public String sign_up() throws Exception{
		
		return "login/Sign_Up.tiles";
	}//login
	
	
	//회원가입 프로세스
	@RequestMapping("/user/sign_process.pic")
	public String sign_up_process(@RequestParam Map map) throws Exception{
		userService.insert(map);
		/*
		7 먼저 회원가입 축하 메시지를 띄우고 로그인 페이지로 보냅시다!
		*/
		return "login/Login.tiles";
	}
	
	
	//내정보
//	@RequestMapping("/user/myPage.pic")
//	public String myPage() throws Exception{
//		return "user/myPage.tiles";
//	}//myPage
	
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
