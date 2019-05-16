package com.kosmo.pickpic.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.AdminService;
import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.PickPlaceBoardDTO;
import com.kosmo.pickpic.service.PickRoadBoardDTO;
import com.kosmo.pickpic.service.PickpicAccountDTO;

@Repository
public class AdminDAO implements AdminService {
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public Map dashBoardTop() {
		Map map = new HashMap();
		map.put("adminNewPick", (Integer)template.selectOne("adminNewPick"));
		map.put("adminNewUser", (Integer)template.selectOne("adminNewUser"));
		map.put("adminNewQuestion", (Integer)template.selectOne("adminNewQuestion"));
		map.put("adminNewSale", (Integer)template.selectOne("adminNewSale"));
		
		return map;
	}

	@Override
	public List<PickpicAccountDTO> dashBoardUser() {
		return template.selectList("adminDashUser");
	}
	@Override
	public List<FilterDTO> dashBoardFilter() {
		return template.selectList("adminFilter");
	}
	@Override
	public List<PickPlaceBoardDTO> dashBoardPickPlace() {
		return template.selectList("adminPickPlace");
	}
	@Override
	public List<PickRoadBoardDTO> dashBoardPickRoad() {
		return template.selectList("adminPickRoad");
	}
	@Override
	public List<Map> dashBoardReport() {
		return template.selectList("adminDashReport");
	}
	@Override
	public List<Map> dashBoardRecycleBin() {
		return template.selectList("adminDashRecycleBin");
	}
}
