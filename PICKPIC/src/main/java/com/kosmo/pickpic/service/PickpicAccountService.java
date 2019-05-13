package com.kosmo.pickpic.service;

import java.util.Map;

public interface PickpicAccountService {
	//로그인 용]
	boolean isMember(Map map);
	boolean isEmail(Map map);
	
	int accountInsert(Map map);
	int securityInsert(Map map);
	
	int loginHistoryInsert(Map map);
} 
