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
	
	
	//주영테스트1
	@RequestMapping("/test/place_create.pic")
	public String plaCreate(@RequestParam Map map, Model model,Principal principal) throws Exception {
		try {
		map.put("ppa_email",principal.getName());
		}catch(Exception e) {
			return "home.tiles";
		}
		
		List<Map> list_filter=dao_filter.albumDownFilterName(map);
		model.addAttribute("list_filter", list_filter);
		return "test/place_create.tiles";
	}//plaCreate
		
	// 주영테스트2
	@RequestMapping("/test/place_list.pic")
	public String plaList(@RequestParam Map map, Model model, Principal principal) throws Exception {
		//여기서 작업 시작
				map.put("ppa_email",principal.getName());				
				List<Map> list = ppb_service.selectList(map);
				model.addAttribute("list",list);
		return "test/place_list.tiles";
	}// plaList
	
	// 주영테스트3
	@RequestMapping("/test/place_view.pic")
	public String plaView() {
		//여기서 작업 시작
			
		return "test/place_view.tiles";
	}// plaView
	
}//StoryController
