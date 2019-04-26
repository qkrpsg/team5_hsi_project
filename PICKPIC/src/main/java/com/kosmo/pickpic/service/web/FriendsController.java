package com.kosmo.pickpic.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FriendsController {
	// 서비스 주입

	// 픽플레이스
	@RequestMapping("/friends/place.pic")
	public String place() throws Exception {
		return "friends/place.tiles";
	}// place

	// 필터정보
	@RequestMapping("/friends/filter.pic")
	public String filter() throws Exception {
		return "friends/filter.tiles";
	}//filter
	
	//Pay test
	@RequestMapping("/pay/pay.pic")
	public String pay() throws Exception{
		return "test/Pay.tiles";
	}//pay
	
	//픽로드
	@RequestMapping("/friends/route.pic")
	public String route() throws Exception {
		return "friends/route.tiles";
	}// route

	// 앨범다운
	@RequestMapping("/friends/albumDown.pic")
	public String albumDown() throws Exception {
		return "friends/albumDown.tiles";
	}
}//FriendsController
