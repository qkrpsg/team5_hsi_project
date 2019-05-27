package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;


public interface PickPlaceBoardService {
//	List<PickPlaceBoardDTO> selectList(Map map);
//	PickPlaceBoardDTO selectOne(Map map);
//	int getTotalRecord(Map map);
	int insert(Map map);
	List<Map> selectList(Map map);
//	int delete(Map map);
//	int update(Map map);
	List<PickPlaceBoardDTO> ppbBestList();
	//이건 마이 페이지 픽 플레이스 게시판 가져오는 것!
	List<Map> ppbMyPageList(Map map);
	
	//상세보기 픽 플레이스
	Map ppbSelectOne(Map map);
}
