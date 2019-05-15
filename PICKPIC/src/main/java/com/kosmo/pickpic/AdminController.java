package com.kosmo.pickpic;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scripting.config.LangNamespaceHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;
import com.kosmo.pickpic.service.web.PagingUtil;

@Controller
public class AdminController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	//HOME
	@RequestMapping(value = "/admin/home.pic")
	public String home(@RequestParam Map map, Model model) {
		model.addAllAttributes(adminService.dashBoardTop());
		model.addAttribute("user",adminService.dashBoardUser());
		model.addAttribute("filter",adminService.dashBoardFilter());
		model.addAttribute("place", adminService.dashBoardPickPlace());
		model.addAttribute("road", adminService.dashBoardPickRoad());
		return "admin/admin_home.admin";
	}//home
	
	//회원관리
	@RequestMapping(value = "/admin/users.pic")
	public String users(@RequestParam Map map) {
		return "admin/admin_users.admin";
	}//users
	
	//픽플레이스관리
	@RequestMapping(value = "/admin/pickPlace.pic")
	public String attraction(@RequestParam Map map) {
		return "admin/admin_pickPlace.admin";
	}//pickPlace
	
	//필터관리
	@RequestMapping(value = "/admin/filter.pic")
	public String filter(@RequestParam Map map) {
		return "admin/admin_filter.admin";
	}//filter
	
	//픽로드관리
	@RequestMapping(value = "/admin/pickRoad.pic")
	public String route(@RequestParam Map map) {
		return "admin/admin_pickRoad.admin";
	}//pickRoad
	
	//앨범다운관리
	@RequestMapping(value = "/admin/albumDown.pic")
	public String albumDown(@RequestParam Map map) {
		return "admin/admin_albumDown.admin";
	}//albumDown
	
	//문의 관리
	@RequestMapping(value = "/admin/qna.pic")
	public String qna(@RequestParam Map map) {
		return "admin/admin_qna.admin";
	}//qna
	
	//신고함
	@RequestMapping(value = "/admin/report.pic")
	public String report(@RequestParam Map map) {
		return "admin/admin_report.admin";
	}//report

	//공지사항 List폼 뿌려주기
	@RequestMapping(value = "/admin/notice.pic")
	public String list(Model model, @RequestParam Map map) throws Exception{
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드수
		//int totalRecordCount= adminService.getTotalRecord(map);		
		//전체 페이지수]
		//페이징을 위한 로직 끝]		
		List<NoticeDTO> list= noticeService.selectList(map);
		//페이징 문자열을 위한 로직 호출]
		
		
		
		//데이타 저장]
		model.addAttribute("list", list);
	//	model.addAttribute("nowPage", nowPage);
	
    	//model.addAttribute("totalRecordCount", totalRecordCount);		
	
		//뷰정보 반환]
		return "admin/admin_notice.admin";
	}///////////////list()
	
	@RequestMapping(value= "/admin/admin_notice.pic")
	public String notice_View(@RequestParam Map map,Model model) throws Exception{
		NoticeDTO list= noticeService.selectOne(map);
		model.addAttribute("list", list);
		return "/admin/admin_notice.admin";
	}
	
	@RequestMapping(value="/admin/admin_view.pic")
	public String notice_view(@RequestParam Map map,Model model) throws Exception{
		List<NoticeDTO> list = noticeService.selectList(map);
		model.addAttribute("list", list);
		NoticeDTO list2 = noticeService.selectOne(map);
		model.addAttribute("list2", list2);
		return "/admin/admin_notice.admin";
	}
	
	//등록처리
	@RequestMapping(value="/admin/admin_notice.pic",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session) throws Exception{
		
		//map.put("id",session.getAttribute("id"));
		noticeService.insert(map);
	
		return "forward:notice.pic";
	}
	
	//ETC
	//휴지통
	@RequestMapping(value = "/admin/recyclebin.pic")
	public String recyclebin(@RequestParam Map map) {
		return "admin/admin_recyclebin.admin";
	}//recyclebin

	
}//AdminController