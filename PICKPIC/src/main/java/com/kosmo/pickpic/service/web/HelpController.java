package com.kosmo.pickpic.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;

@Controller
public class HelpController {
	//서비스 주입
	@Resource(name="adminService")
	private NoticeServiceImpl adminService;
	
	
	//픽크픽TIP
	@RequestMapping("/help/tip.pic")
	public String tip() throws Exception{
		return "help/tip.tiles";
	}//tip

	//공지사항
	@RequestMapping(value= "/help/notice/List.pic")
	public String notice(Model model, @RequestParam Map map) throws Exception{
		List<NoticeDTO> list= adminService.selectList(map);
		model.addAttribute("list", list);
		return "help/notice/List.tiles";
	}//notice
	
	//공지사항 상세 페이지
	@RequestMapping(value= "/help/notice/View.pic")
	public String notice_View(@RequestParam Map map,Model model) throws Exception{
		NoticeDTO list= adminService.selectOne(map);
		model.addAttribute("list", list);
		return "help/notice/View.tiles";
	}
	
	
	

	//문의사항
	@RequestMapping("/help/qna/List.pic")
	public String qna_list() throws Exception{
		
		
		return "help/qna/List.tiles";
	}//qna
	@RequestMapping("/help/qna/Write.pic")
	public String qna_write() throws Exception{
		return "help/qna/Write.tiles";
	}//qna

	//초보자가이드
	@RequestMapping("/help/guide.pic")
	public String guide() throws Exception{
		return "help/guide.tiles";
	}//guide
}//helpController
