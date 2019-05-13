package com.kosmo.pickpic.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickRoadBoardService;

@Service("prbService")
public class PickRoadBoardServiceImpl implements PickRoadBoardService{
	@Resource(name = "pickRoadBoardDAO")
	private PickRoadBoardDAO dao;

	@Override
	public int pickRoadPlaceInsert(Map map) {
		 
		return dao.pickRoadPlaceInsert(map);
	}

	@Override
	public int pickroadBoardInsert(Map map) {
		
		return dao.pickroadBoardInsert(map);
	}
}
