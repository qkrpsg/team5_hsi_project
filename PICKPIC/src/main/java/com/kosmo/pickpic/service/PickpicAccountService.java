package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface PickpicAccountService {
	//로그인 용]
	boolean isMember(Map map);
	boolean isEmail(Map map);
	
	int insert(Map map);
} 
