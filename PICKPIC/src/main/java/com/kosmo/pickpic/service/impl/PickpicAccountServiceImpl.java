package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.PickpicAccountService;

//
@Service("accountService")
public class PickpicAccountServiceImpl implements PickpicAccountService {
	// OneMemoDAO객체 주입]
	@Resource(name = "pickpicAccountDAO")
	private PickpicAccountDAO dao;

	@Override
	public boolean isMember(Map map) {
		return dao.isMember(map);
	}

	@Override
	public boolean isEmail(Map map) {
		return dao.isEmail(map);
	}

	@Override
	public boolean isAuthAbled(Map map) {
		return dao.isAuthAbled(map);
	}

	@Override
	public PickpicAccountDTO oneUser(Map map) {
		return dao.oneUser(map);
	}

	@Override
	public int accountInsert(Map map) {
		return dao.accountInsert(map);
	}

	@Override
	public int securityInsert(Map map) {
		return dao.securityInsert(map);
	}

	@Override
	public int securityUpdate(Map map) {
		return dao.securityUpdate(map);
	}

	@Override
	public int loginHistoryInsert(Map map) {
		return dao.loginHistoryInsert(map);
	}

	@Override
	public PickpicAccountDTO myPageInfo(Map map) {
		return dao.myPageInfo(map);
	}
}
