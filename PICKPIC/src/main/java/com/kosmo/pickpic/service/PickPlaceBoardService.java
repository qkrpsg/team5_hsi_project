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
}
