package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickPlaceBoardDTO;
import com.kosmo.pickpic.service.PickPlaceBoardService;

@Repository
public class PickPlaceBoardDAO implements PickPlaceBoardService {
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public int insert(Map map) {
		return template.insert("ppbinsert",map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("ppbselect",map);
	}
	
}
