package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface PickpicAccountService {
	boolean isMember(Map map);
	boolean isEmail(Map map);
	boolean isAuthAbled(Map map);
	PickpicAccountDTO oneUser(Map map);
	
	int accountInsert(Map map);
	int securityInsert(Map map);
	int securityUpdate(Map map);
	
	int loginHistoryInsert(Map map);
	//계정 생성시 기본 필터 제공
	int defaultFilterInsert(Map map);
	
	//마이페이지 픽플레이스, 픽로드, 보유필터 데이터
	PickpicAccountDTO myPageInfo(Map map);
	
	//픽플레이스 상세보기
	PickpicAccountDTO placeView(Map map);
	
	//픽로드 상세보기
	PickpicAccountDTO roadView(Map map);
	//픽로드 플레이스
	List<Map> roadplace(Map map);
	//픽로드 플레이스 1개
	PickRoadPlaceDTO roadOnePlace(Map map);
	
	int updateToken(Map map);
	Map selectToken(Map map);
	Map questionEmail(Map map);
} 