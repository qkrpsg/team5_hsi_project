package com.kosmo.pickpic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickRoadBoardService;

@Service("prbService")
public class PickRoadBoardServiceImpl implements PickRoadBoardService{
	@Resource(name = "pickRoadBoardDAO")
	private PickRoadBoardDAO dao;
}
