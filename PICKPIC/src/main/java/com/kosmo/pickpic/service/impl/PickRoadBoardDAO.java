package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickRoadBoardDTO;
import com.kosmo.pickpic.service.PickRoadBoardService;

@Repository
public class PickRoadBoardDAO implements PickRoadBoardService{
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public int pickroadBoardInsert(Map map) {
		return template.insert("PickroadBoardInsert",map);
	}
	
	@Override
	public int pickRoadPlaceInsert(Map map) {
		
		return template.insert("PickRoadPlaceInsert",map);
	}

	@Override
	public List<Map> pickRoadBoardSelectAll(Map map) {
		
		return template.selectList("PickRoadBoardSelectAll",map);
	}

	@Override
	public int pickRoadBoardUpdate(Map map) {
		
		return template.update("PickRoadBoardUpdate",map);
	}

	
}
