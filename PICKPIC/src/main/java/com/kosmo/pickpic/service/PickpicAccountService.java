package com.kosmo.pickpic.service;

import java.util.Map;

public interface PickpicAccountService {
	//로그인 용]
	boolean isMember(Map map);
	boolean isEmail(Map map);
	
	void accountInsert(Map map);
	void securityInsert(Map map);
} 
