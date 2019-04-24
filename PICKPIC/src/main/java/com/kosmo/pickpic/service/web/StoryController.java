package com.kosmo.pickpic.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoryController {
	//서비스 주입
	
	//비전
	@RequestMapping("/PICKPIC/story/vision.pic")
	public String vision() {
		return "story/vision.tiles";
	}//vision

	//크루소개
	@RequestMapping("/PICKPIC/story/crewIntro.pic")
	public String crewIntro() {
		return "story/crewIntro.tiles";
	}//crewIntro

	//사용기술
	@RequestMapping("/PICKPIC/story/tech.pic")
	public String tech() {
		return "story/tech.tiles";
	}//tech

	//다운로드
	@RequestMapping("/PICKPIC/story/appDown.pic")
	public String appDown() {
		return "story/appDown.tiles";
	}//appDown
}//StoryController
