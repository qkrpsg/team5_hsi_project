package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickpicAccountService;
import com.kosmo.pickpic.service.PickpicUserDTO;
import com.kosmo.pickpic.service.PickpicUserService;

//

@Repository
public class PickpicAccountDAO implements PickpicAccountService {
	// SqlSessionTemplate객체 주입]
	@Resource(name = "template")
	private SqlSessionTemplate template;

	// 로그인 용]
	@Override
	public boolean isMember(Map map) {
		return (Integer) template.selectOne("PickpicAccountIsMember", map) == 0 ? false : true;
	}

	@Override
	public boolean isEmail(Map map) {
		return (Integer) template.selectOne("PickpicAccountIsEmail", map) == 0 ? false : true;
	}

	@Override
	public int insert(Map map) {
		return template.insert("PickpicAccountInsert", map);
	}
}
