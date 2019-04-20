package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface PickpicQnAService {
//
	//목록용]
	//레코드를 DTO가 아닌 맵에 담아보자
	List<Map> selectList(Map map);
	//입력/수정/삭제]
	void insert(Map map);
	void delete(Map map);
	void update(Map map);
}
