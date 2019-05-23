package com.kosmo.pickpic.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kosmo.pickpic.service.TipBoardService;

@Repository
public class TipBoardDAO implements TipBoardService {

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public int insert(Map map) {
		
		return 0;
	}

	@Override
	public int delete(Map map) {
		
		return 0;
	}

	@Override
	public int update(Map map) {
		
		return 0;
	}

}
