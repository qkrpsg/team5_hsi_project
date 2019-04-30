package com.kosmo.pickpic.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoryController {
	//서비스 주입
	
	//비전
	@RequestMapping("/story/vision.pic")
	public String vision() {
		return "story/vision.tiles";
	}//vision

	//크루소개
	@RequestMapping("/story/crewIntro.pic")
	public String crewIntro() {
		return "story/crewIntro.tiles";
	}//crewIntro

	//사용기술
	@RequestMapping("/story/tech.pic")
	public String tech() {
		return "story/tech";
	}//tech

	//다운로드
	@RequestMapping("/story/appDown.pic")
	public String appDown() {
		return "story/appDown.tiles";
	}//appDown
}//StoryController
