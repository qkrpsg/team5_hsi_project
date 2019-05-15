package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	Map dashBoardTop();
	List<PickpicAccountDTO> dashBoardUser();
	List<FilterDTO> dashBoardFilter();
	List<PickPlaceBoardDTO> dashBoardPickPlace();
	List<PickRoadBoardDTO> dashBoardPickRoad();
	List<Map> dashBoardReport();
	List<Map> dashBoardRecycleBin();
}
