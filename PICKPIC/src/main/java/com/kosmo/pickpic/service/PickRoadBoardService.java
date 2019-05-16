package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface PickRoadBoardService {
	
	int pickRoadPlaceInsert(Map map);
	int pickroadBoardInsert(Map map);
	List<Map> pickRoadBoardSelectAll(Map map);
	//이건 업데이트 랑 셀렉트 1개 (상세보기에서 사용 할 거)
	int pickRoadBoardUpdate(Map map);
	
}
