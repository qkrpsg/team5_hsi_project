package com.kosmo.pickpic;

import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	@RequestMapping(value = "/PICKPIC/admin/home.pic")
	public String home(@RequestParam Map map) {
		map.put("admin", "HOME");
		return "admin/admin_home.admin";
	}
	
	@RequestMapping(value = "/PICKPIC/admin/users.pic")
	public String users(@RequestParam Map map) {
		map.put("admin", "회원관리");
		return "admin/admin_users.admin";
	}
	
	@RequestMapping(value = "/PICKPIC/admin/qna.pic")
	public String qna(@RequestParam Map map) {
		map.put("admin", "문의관리");
		return "admin/admin_qna.admin";
	}
	
	@RequestMapping(value = "/PICKPIC/admin/attraction.pic")
	public String attraction(@RequestParam Map map) {
		map.put("admin", "명소관리");
		return "admin/admin_attraction.admin";
	}
	
	@RequestMapping(value = "/PICKPIC/admin/post.pic")
	public String post(@RequestParam Map map) {
		map.put("admin", "게시글관리");
		return "admin/admin_post.admin";
	}
}