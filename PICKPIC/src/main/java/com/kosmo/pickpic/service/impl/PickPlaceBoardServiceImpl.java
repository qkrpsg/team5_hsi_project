package com.kosmo.pickpic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickPlaceBoardService;

@Service("ppbService")
public class PickPlaceBoardServiceImpl implements PickPlaceBoardService {
	@Resource(name = "pickPlaceBoardDAO")
	private PickPlaceBoardDAO dao;
}
