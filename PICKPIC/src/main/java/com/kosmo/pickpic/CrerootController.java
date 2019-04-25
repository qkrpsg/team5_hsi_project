package com.kosmo.pickpic;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CrerootController {

	// HOME
	@RequestMapping(value = "/creroute/route_create.pic")
	public String home() {
		
		return "creroute/home.creroute";
	}// home

}
