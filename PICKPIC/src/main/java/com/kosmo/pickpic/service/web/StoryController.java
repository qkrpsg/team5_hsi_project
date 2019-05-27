package com.kosmo.pickpic.service.web;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.pickpic.service.PaymentDTO;
import com.kosmo.pickpic.service.impl.FilterServiceImpl;
import com.kosmo.pickpic.service.impl.PickPlaceBoardServiceImpl;

@Controller
public class StoryController {
	//서비스 주입
	@Resource(name = "fService")
	private FilterServiceImpl dao_filter;
	
	@Resource(name="ppbService")
	private PickPlaceBoardServiceImpl ppb_service;
	
	
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
		return "story/tech.tiles";
	}//tech

	//다운로드
	@RequestMapping("/story/appDown.pic")
	public String appDown() {
		return "story/appDown.tiles";
	}//appDown
}//StoryController
