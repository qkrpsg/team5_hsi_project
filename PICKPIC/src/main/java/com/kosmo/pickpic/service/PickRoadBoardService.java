package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface PickRoadBoardService {
	
	int pickRoadPlaceInsert(Map map);
	int pickroadBoardInsert(Map map);
	List<Map> pickRoadBoardSelectAll(Map map);
	//이건 업데이트 랑 셀렉트 1개 (상세보기에서 사용 할 거)
	int pickRoadBoardUpdate(Map map);
	
	//이 2개는 view 페이지에서 사용할거 컨트롤러도 view 검색시 찾기 가능
	List<Map> pickRoadBoardSelectOne(Map map);
	List<Map> pickRoadBoardSelectOne2(Map map);
}
