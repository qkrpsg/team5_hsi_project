package com.kosmo.pickpic.service.web;

import java.util.List;
import java.util.Map;

public interface PickpicPlaceStorageService {
    
	//목록용]
	List<Map> selectList(Map map);
	//입력/수정/삭제용]
	void delete(Map map);
	void insert(Map map);
	void update(Map map);
	
}
