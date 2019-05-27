package com.kosmo.pickpic.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;

@Controller
public class AndroidController {
	@Resource(name = "accountService")
	private PickpicAccountServiceImpl accountService;

	@Resource(name = "adminService")
	private AdminServiceImpl adminService;

	@ResponseBody
	@RequestMapping(value = "/android/SignUp.do", produces = "application/json;charset=utf-8")
	public JSONObject json() {
		// json-simple 라이브러리 추가 필요(JSON 객체 생성)
		JSONObject jsonMain = new JSONObject(); // json 객체
		// {변수명:값, 변수명:값}
		// {sendData:[{변수명:값},{변수명:값},...]}
		List<PickpicAccountDTO> items = adminService.pickPicAccountAll();
		JSONArray jArray = new JSONArray(); // json배열

		for (int i = 0; i < items.size(); i++) {
			PickpicAccountDTO dto = items.get(i);
			JSONObject row = new JSONObject();
			// json객체.put("변수명",값)
			row.put("ppa_email", dto.getPpa_email());
			// 배열에 추가
			// json배열.add(인덱스,json객체)
			jArray.add(i, row);

//            private String ppa_id;
//        	private String ppa_email;
//        	private String ppa_password;
//        	private String ppa_nickname;
//        	private String ppa_join_date;
//        	private String ppa_type;
//        	private String ppa_token;
//        	private String ppa_profile_path;
//        	private String ppa_index;
		}
		// json객체에 배열을 넣음
		jsonMain.put("sendData", jArray);

		return jsonMain;
	}

	@RequestMapping(value = "/android/Login.and")
	@ResponseBody
	public boolean login(HttpServletRequest request) throws Exception {
		Map map = new HashMap<String, String>();
		map.put("ppa_email", request.getParameter("ppa_email"));
		map.put("ppa_password", request.getParameter("ppa_password"));
		return accountService.isMember(map);
	}

	@RequestMapping(value = "/android/LoginWeb.and")
	public String loginWeb(HttpServletRequest request) throws Exception {
		Map map = new HashMap<String, String>();
		map.put("ppa_email", request.getParameter("ppa_email"));
		map.put("ppa_password", request.getParameter("ppa_password"));

		// 시큐리티 강제 주입
		// 사용자의 아이디, 비밀번호, ROLE_ 로 시작 하는 권한 정보를 가지고 온다.
		Authentication authentication = new UsernamePasswordAuthenticationToken(request.getParameter("ppa_email"),
				request.getParameter("ppa_password"));

		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
		HttpSession session = request.getSession(true);

		accountService.isMember(map);
		// 로그인 정보 저장
		accountService.loginHistoryInsert(map);
		// 아이디와 닉네임을 세션에 저장
		PickpicAccountDTO user = accountService.oneUser(map);
		session.setAttribute("ppa_id", user.getPpa_id());
		System.out.println(user.getPpa_id());
		session.setAttribute("ppa_email", user.getPpa_email());
		System.out.println(user.getPpa_email());
		session.setAttribute("ppa_nickname", user.getPpa_nickname());
		System.out.println(user.getPpa_nickname());

		return "home.tiles";
	}
}
