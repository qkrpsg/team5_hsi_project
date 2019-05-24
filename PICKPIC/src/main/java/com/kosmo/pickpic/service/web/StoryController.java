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

@Controller
public class StoryController {
	//서비스 주입
	@Resource(name = "fService")
	private FilterServiceImpl dao_filter;
	
	
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
	
	
	//주영테스트1
			@RequestMapping("/test/place_create.pic")
			public String plaCreate(@RequestParam Map map, Model model,Principal principal) throws Exception {
				map.put("ppa_email",principal.getName());
				List<Map> list_filter=dao_filter.albumDownFilterName(map);
				model.addAttribute("list_filter", list_filter);
				return "test/place_create.tiles";
			}//plaCreate
	
}//StoryController
