package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface TipBoardService {

	List<TipBoardDTO> selectList(Map map);
	TipBoardDTO selectOne(Map map);
	int getTotalRecord(Map map);
	
	//입력/수정/삭제]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
}///TipBoardService
