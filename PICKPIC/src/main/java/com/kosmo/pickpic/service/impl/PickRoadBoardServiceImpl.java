package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickRoadBoardDTO;
import com.kosmo.pickpic.service.PickRoadBoardService;

@Service("prbService")
public class PickRoadBoardServiceImpl implements PickRoadBoardService{
	@Resource(name = "pickRoadBoardDAO")
	private PickRoadBoardDAO dao;

	
	@Override
	public int pickroadBoardInsert(Map map) {
		
		return dao.pickroadBoardInsert(map);
	}
	
	@Override
	public int pickRoadPlaceInsert(Map map) {
		 
		return dao.pickRoadPlaceInsert(map);
	}

	@Override
	public List<Map> pickRoadBoardSelectAll(Map map) {
		
		return dao.pickRoadBoardSelectAll(map);
	}

	@Override
	public int pickRoadBoardUpdate(Map map) {
		
		return dao.pickRoadBoardUpdate(map);
	}

	
}
