package com.kosmo.pickpic.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {
	//서비스 주입

	//픽크픽TIP
	@RequestMapping("/PICKPIC/help/tip.pic")
	public String tip() throws Exception{
		return "friends/tip.tiles";
	}//tip

	//공지사항
	@RequestMapping("/PICKPIC/help/notice.pic")
	public String notice() throws Exception{
		return "friends/notice.tiles";
	}//notice

	//문의사항
	@RequestMapping("/PICKPIC/help/qna.pic")
	public String qna() throws Exception{
		return "friends/qna.tiles";
	}//qna

	//초보자가이드
	@RequestMapping("/PICKPIC/help/guide.pic")
	public String guide() throws Exception{
		return "friends/guide.tiles";
	}//guide
}//helpController
