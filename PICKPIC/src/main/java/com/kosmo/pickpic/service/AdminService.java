package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	Map dashBoardTop();
	List<PickpicAccountDTO> dashBoardUser();
	List<PickpicAccountDTO> pickPicAccountAll();
	List<FilterDTO> filterAll();
	List<PickPlaceBoardDTO> pickPlaceAll();
	List<PickRoadBoardDTO> pickRoadAll();
	List<Map> dashBoardReport();
	List<Map> dashBoardRecycleBin();
	
	PickpicAccountDTO oneUser(Map map);
}
