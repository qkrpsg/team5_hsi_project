package com.kosmo.pickpic.service.web;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;


@Controller
public class UserController {
	//서비스 주입
	@Resource(name="accountService")
	private PickpicAccountServiceImpl accountService;
	
	
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
    public void loginProcessF(HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
        out.flush();
        out.close();
    }
	
	//로그인에 성공했으나 이메일인증이 이루어지지 않은경우 프로세스
	@RequestMapping("/user/EmailProcessF.pic")
	public void emailProcessF(HttpSession session, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		session.invalidate();
        out.println("<script>alert('이메일 인증이 이루어지지 않았습니다.'); history.go(-1);</script>");
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
	public String sign_up_process(@RequestParam Map map, HttpServletResponse response) throws Exception{
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
