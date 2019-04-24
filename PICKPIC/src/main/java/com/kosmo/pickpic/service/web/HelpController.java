package com.kosmo.pickpic.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {
	//서비스 주입

	//픽크픽TIP
//	@RequestMapping("/help/tip.pic")
//	public String tip() throws Exception{
//		return "help/tip.tiles";
//	}//tip

	//공지사항
	@RequestMapping("/help/notice/List.pic")
	public String notice() throws Exception{
		return "help/notice/List.tiles";
	}//notice

	//문의사항
	@RequestMapping("/help/qna/List.pic")
	public String qna() throws Exception{
		return "help/qna/List.tiles";
	}//qna

	//초보자가이드
//	@RequestMapping("/help/guide.pic")
//	public String guide() throws Exception{
//		return "help/guide.tiles";
//	}//guide
}//helpController
