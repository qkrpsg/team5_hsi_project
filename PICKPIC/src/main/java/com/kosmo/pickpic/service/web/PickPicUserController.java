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

//
@Controller
public class PickPicUserController {
//	//서비스 주입]
	@Resource(name="pickpicService")
	private PickpicUserServiceImpl pickpicService;
	
	
	//로그인 폼으로 이동]
	@RequestMapping("/PickPic/login/Login.bbs")
	public String login(HttpSession session,Model model) throws Exception{
		
		
		
		return "login/Login.tiles";
	}//login()
	
	@RequestMapping("/PickPic/login/Login2.bbs")
	public String login2() throws Exception{
		return "login/Test";
	}
	
	/**/
	@RequestMapping("/PickPic/login/loginProcess.bbs")
	public String loginProcess(HttpSession session,@RequestParam Map map,Model model) throws Exception{
		//서비스 호출]
		
		boolean flag = pickpicService.isMember(map);
		
				if(true) {//회원flag
				//세션 영역에 데이타 저장
					session.setAttribute("id", map.get("id"));
						
				}else//비회원이거나 아이디가 틀린경우
					model.addAttribute("errorMsg", "아뒤와 비번이 틀려요");
				
				
				//return "forward:/WEB-INF/views/login/LoginTest.jsp";
		
				return "login/Login.tiles";
	}
	
	@RequestMapping("/PickPic/friends/Place.bbs")
	public String Place() throws Exception{
		return "friends/Place.tiles";
	}
	
	
}
