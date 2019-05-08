package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public void accountinsert(Map map) {
		dao.accountinsert(map);
	}

	@Override
	public void securityInsert(Map map) {
		dao.securityInsert(map);
	}
}
