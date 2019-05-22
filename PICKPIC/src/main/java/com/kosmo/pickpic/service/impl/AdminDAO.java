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
import com.kosmo.pickpic.util.DTOUtil;

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
	public List<PickpicAccountDTO> pickPicAccountAll() {
		return template.selectList("adminUser");
	}
	@Override
	public List<FilterDTO> filterAll() {
		return template.selectList("adminFilter");
	}
	@Override
	public List<PickPlaceBoardDTO> pickPlaceAll() {
		return template.selectList("adminPickPlace");
	}
	@Override
	public List<PickRoadBoardDTO> pickRoadAll() {
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

	@Override
	public PickpicAccountDTO oneUser(Map map) {
		PickpicAccountDTO user = template.selectOne("adminOneUser", map);
		PickpicAccountDTO dto = new PickpicAccountDTO();
		
		
		try {
			dto = template.selectOne("adminUserPick", map);
			user.setTotalpick(dto.getTotalpick());
		} catch(Exception e) {
			user.setTotalpick("0");
		}
		try {
			dto = template.selectOne("adminUserPost", map);
			user.setTotalpost(dto.getTotalpost());
		} catch(Exception e) {
			user.setTotalpost("0");
		}
		try {
			dto = template.selectOne("adminUserFilter", map);
			user.setTotalfilter(dto.getTotalfilter());
		} catch(Exception e) {
			user.setTotalfilter("0");
		}
		try {
			dto = template.selectOne("adminUserQuestion", map);
			user.setTotalquestion(dto.getTotalquestion());
		} catch(Exception e) {
			user.setTotalquestion("0");
		}
		
		user.setAs_class(((PickpicAccountDTO)template.selectOne("adminUserClass", map)).getAs_class());
		return user;
	}
	@Override
	public List<Map> pickPicAccountRoadAll() {
		return template.selectList("adminPickAccountRoad");
	}
	@Override
	public void delete(Map map) {
		
		template.delete("adminPickAccountRoadDelete",map);
	}
	@Override
	public void delete2(Map map) {
		
		template.delete("adminPickAccountRoadDelete2",map);
	}
	@Override
	public int userTotal() {
		return template.selectOne("adminUserTotal");
	}
	@Override
	public List<PickpicAccountDTO> selectUser(Map map) {
		return template.selectList("adminSelectUser", map);
	}
	@Override
	public FilterDTO oneFilter(Map map) {
		FilterDTO filter = template.selectOne("adminOneFilter", map);
		try {
			filter.getTotalFilter().length();
		}catch(Exception e) {
			filter.setTotalFilter("0");
		}
		return filter;
	}
	@Override
	public Boolean filterChange(Map map) {
		return template.update("adminFilterChange", map) == 0 ? false : true ;
	}
}
