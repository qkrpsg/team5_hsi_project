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
	@RequestMapping("/PICKPIC/user/Login.pic")
	public String login(HttpSession session,Model model) throws Exception{
		return "login/Login.tiles";
	}//login
	
	//로그인 처리 로직
	@RequestMapping("/PICKPIC/user/loginProcess.pic")
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
	
	//내정보
	@RequestMapping("/PICKPIC/user/myPage.pic")
	public String myPage() throws Exception{
		return "friends/myPage.tiles";
	}//myPage
	
	//정보수정
	@RequestMapping("/PICKPIC/user/changeInfo.pic")
	public String changeInfo() throws Exception{
		return "friends/changeInfo.tiles";
	}//changeInfo
	
	//탈퇴
	@RequestMapping("/PICKPIC/user/leaveMember.pic")
	public String leaveMember() throws Exception{
		return "friends/leaveMember.tiles";
	}//leaveMember
	
	//프로필 수정
	@RequestMapping("/PICKPIC/user/changeProfile.pic")
	public String changeProfile() throws Exception{
		return "friends/changeProfile.tiles";
	}//changeProfile
	
	//픽보관함
	@RequestMapping("/PICKPIC/user/pickStorage.pic")
	public String pickStorage() throws Exception{
		return "friends/pickStorage.tiles";
	}//pickStorage
	
	//마이픽플레이스
	@RequestMapping("/PICKPIC/user/myPlace.pic")
	public String myPlace() throws Exception{
		return "friends/myPlace.tiles";
	}//myPlace
	
	//마이픽로드
	@RequestMapping("/PICKPIC/user/myRoute.pic")
	public String myRoute() throws Exception{
		return "friends/myRoute.tiles";
	}//myRoute
	
	//보유필터
	@RequestMapping("/PICKPIC/user/haveFilter.pic")
	public String haveFilter() throws Exception{
		return "friends/haveFilter.tiles";
	}//haveFilter
}//userController
