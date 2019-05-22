package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.AdminService;
import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.PickPlaceBoardDTO;
import com.kosmo.pickpic.service.PickRoadBoardDTO;
import com.kosmo.pickpic.service.PickpicAccountDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name = "adminDAO")
	private AdminDAO dao;

	@Override
	public Map dashBoardTop() {
		return dao.dashBoardTop();
	}
	@Override
	public List<PickpicAccountDTO> dashBoardUser() {
		return dao.dashBoardUser();
	}
	@Override
	public List<PickpicAccountDTO> pickPicAccountAll() {
		return dao.pickPicAccountAll();
	}
	@Override
	public List<FilterDTO> filterAll() {
		return dao.filterAll();
	}
	@Override
	public List<PickPlaceBoardDTO> pickPlaceAll() {
		return dao.pickPlaceAll();
	}
	@Override
	public List<PickRoadBoardDTO> pickRoadAll() {
		return dao.pickRoadAll();
	}
	@Override
	public List<Map> dashBoardReport() {
		return dao.dashBoardReport();
	}
	@Override
	public List<Map> dashBoardRecycleBin() {
		return dao.dashBoardRecycleBin();
	}

	@Override
	public PickpicAccountDTO oneUser(Map map) {
		return dao.oneUser(map);
	}
	@Override
	public List<Map> pickPicAccountRoadAll() {
		return dao.pickPicAccountRoadAll();
	}
	@Override
	public void delete(Map map) {
		dao.delete(map);
	}
	@Override
	public void delete2(Map map) {
		
		dao.delete2(map);
	}
	@Override
	public int userTotal() {
		return dao.userTotal();
	}
	@Override
	public List<PickpicAccountDTO> selectUser(Map map) {
		return dao.selectUser(map);
	}
	@Override
	public FilterDTO oneFilter(Map map) {
		return dao.oneFilter(map);
	}
}
