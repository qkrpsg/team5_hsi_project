package com.kosmo.pickpic.service;

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
	
	//마이페이지 픽플레이스, 픽로드, 보유필터 데이터
	PickpicAccountDTO myPageInfo(Map map);
	
	//픽플레이스 상세보기
	PickpicAccountDTO placeView(Map map);
} 