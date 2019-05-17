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
} 