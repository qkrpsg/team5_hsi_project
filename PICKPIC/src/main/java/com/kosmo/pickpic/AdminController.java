package com.kosmo.pickpic;

import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	//서비스 주입
	
	//HOME
	@RequestMapping(value = "/admin/home.pic")
	public String home(@RequestParam Map map) {
		map.put("admin", "HOME");
		return "admin/admin_home.admin";
	}//home
	
	//회원관리
	@RequestMapping(value = "/admin/users.pic")
	public String users(@RequestParam Map map) {
		map.put("admin", "회원관리");
		return "admin/admin_users.admin";
	}//users
	
	//픽플레이스관리
	@RequestMapping(value = "/admin/pickPlace.pic")
	public String attraction(@RequestParam Map map) {
		map.put("admin", "픽플레이스관리");
		return "admin/admin_pickPlace.admin";
	}//pickPlace
	
	//필터관리
	@RequestMapping(value = "/admin/filter.pic")
	public String filter(@RequestParam Map map) {
		map.put("admin", "필터관리");
		return "admin/admin_filter.admin";
	}//filter
	
	//픽로드관리
	@RequestMapping(value = "/admin/pickRoad.pic")
	public String route(@RequestParam Map map) {
		map.put("admin", "픽로드관리");
		return "admin/admin_pickRoad.admin";
	}//pickRoad
	
	//앨범다운관리
	@RequestMapping(value = "/admin/albumDown.pic")
	public String albumDown(@RequestParam Map map) {
		map.put("admin", "앨범다운관리");
		return "admin/admin_albumDown.admin";
	}//albumDown
	
	//문의 관리
	@RequestMapping(value = "/admin/qna.pic")
	public String qna(@RequestParam Map map) {
		map.put("admin", "문의관리");
		return "admin/admin_qna.admin";
	}//qna
	
	//신고함
	@RequestMapping(value = "/admin/report.pic")
	public String report(@RequestParam Map map) {
		map.put("admin", "게시물신고함");
		return "admin/admin_report.admin";
	}//report
	
	//ETC
	//휴지통
	@RequestMapping(value = "/admin/recyclebin.pic")
	public String recyclebin(@RequestParam Map map) {
		map.put("admin", "휴지통");
		return "admin/admin_recyclebin.admin";
	}//recyclebin
}//AdminController