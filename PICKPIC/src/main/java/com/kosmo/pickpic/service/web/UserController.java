package com.kosmo.pickpic.service.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.pickpic.service.FormCommand;
import com.kosmo.pickpic.service.PickpicUserDTO;
import com.kosmo.pickpic.service.impl.FormValidator;
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
	
	
	
	/**/
	//로그인 처리 로직
	@RequestMapping("/user/loginProcess.pic")
	public String loginProcess(HttpSession session,@RequestParam Map map,Model model) throws Exception{
		System.out.println("시도");
		
		boolean flag = userService.isMember(map);

		if(flag) {
			System.out.println("성공");
			session.setAttribute("ppu_id", map.get("ppu_id"));
		}
		else{
			model.addAttribute("errorMsg", "회원 정보가 일치하지 않습니다");
			//회원 정보가 일치하지 않는경우 로그인페이지로 재이동

			System.out.println("실패");
			return "login/Login";//.tiles
		}//비회원이거나 아이디가 틀린경우
		//로그인 성공시 메인화면으로 이동

		return "login/Login";//.tiles
		//return "home.tiles";
	}//loginProcess
	

	@ResponseBody
	@RequestMapping(value="/validator/id_check.do",produces="text/html; charset=UTF-8")
	public String check(@RequestParam Map map,Model model,Map map2) throws Exception{
										//맵에는 아이디 값만 담겨있다
		
		
		
		boolean flag = userService.isMember2(map);//이걸 좀 바꿔줘야 한다
		System.out.println(flag);
		
		
		JSONObject json=new JSONObject();
		if(map.get("ppu_id") == "") {
			json.put("error", "아이디를 입력해주세요");
			return json.toJSONString();
		}
		if(flag) {
			json.put("error", "아이디가 중복 됩니다.");
			return json.toJSONString();
		}
		json.put("error", "아이디 사용가능");
		return json.toJSONString();
	}
//	@ResponseBody
//	@RequestMapping(value="/validator/id_check.do",produces="text/html; charset=UTF-8")
//	public String check(@RequestParam Map map,Model model,Map map2) throws Exception{
//										//맵에는 아이디 값만 담겨있다
//		
//		System.out.println("::::::::::"+map.get("ppu_id"));
//		
//		boolean flag = userService.isMember2(map);//이걸 좀 바꿔줘야 한다
//		System.out.println(flag);
//		JSONObject json=new JSONObject();
//		if(flag) {
//			json.put("flag", flag ? "Y":"N");
//			return json.toJSONString();
//		}
//		json.put("error", "아이디가 중복 됩니다.");
//		//model.addAttribute("error","아이디가 중복 됩니다.");
//		map2.put("error","아이디가 중복 됩니다.");
//		System.out.println(map2.get("error"));
//		return json.toJSONString();
//	}
	
	
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
	

	
	/*//회원가입 프로세스   


	//회원가입 프로세스   

	@RequestMapping("/user/sign_process.pic")
	public String sign_up_process(@RequestParam Map map) throws Exception{
		userService.insert(map);
		
		7 먼저 회원가입 축하 메시지를 띄우고 로그인 페이지로 보냅시다!
		
		return "login/Login.tiles";
	}*/
	
	//회원가입 프로세스   
	@Resource(name="validator")
	private FormValidator validator;
	
	@RequestMapping("/user/sign_process.pic")
	public String execute(FormCommand cmd,BindingResult errors,Model model) throws Exception{
	
		//System.out.println("validator:"+validator);
		
		//validator.validate(cmd, errors);
		//System.out.println("validator22:"+validator);
		
		if(errors.hasErrors()) {
			//model.addAttribute("inters",cmd.getInters());//이건 체크박스
			//뷰정보반환]-다시 입력폼으로 이동
			return "/login/Sign_Up.tiles";
		}
		//model.addAttribute("cmd", cmd);
		
		
		return "login/Login.tiles";
	}
	
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
	
	
	//내정보
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
