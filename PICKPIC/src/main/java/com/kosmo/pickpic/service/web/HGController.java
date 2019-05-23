package com.kosmo.pickpic.service.web;

import java.security.Principal;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.pickpic.service.PaymentDTO;
import com.kosmo.pickpic.service.impl.FilterServiceImpl;

@Controller
public class HGController {

	@Resource(name="fService")
	private FilterServiceImpl fService;
	
	@RequestMapping(value="/LHG/pay.pic")
	public String pay(PaymentDTO dto,Principal principal) throws Exception {
		dto.setPpa_id(principal.getName());
		fService.addPayment(dto);
		return "friends/filter.tiles";
	}//pay
}//class 