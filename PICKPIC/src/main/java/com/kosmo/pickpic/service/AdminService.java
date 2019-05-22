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
	//관리자 게시판 픽로드 LYS가 작업
	List<Map> pickPicAccountRoadAll();
	//픽로드 관리자게시판 자식 테이블 삭제 후 부모 테이블 삭제
	
	int userTotal();
	List<PickpicAccountDTO> selectUser(Map map);
	
	void delete(Map map);
	void delete2(Map map);
	
	PickpicAccountDTO oneUser(Map map);
	
}
