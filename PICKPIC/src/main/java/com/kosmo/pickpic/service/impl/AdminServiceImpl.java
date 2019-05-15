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
	public List<FilterDTO> dashBoardFilter() {
		return dao.dashBoardFilter();
	}

	@Override
	public List<PickPlaceBoardDTO> dashBoardPickPlace() {
		return dao.dashBoardPickPlace();
	}

	@Override
	public List<PickRoadBoardDTO> dashBoardPickRoad() {
		return dao.dashBoardPickRoad();
	}

	@Override
	public List<Map> dashBoardReport() {
		return dao.dashBoardReport();
	}

	@Override
	public List<Map> dashBoardRecycleBin() {
		return dao.dashBoardRecycleBin();
	}
}
