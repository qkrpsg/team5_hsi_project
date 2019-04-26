package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.kosmo.pickpic.service.PickpicPlaceStorageService;

public class PickpicPlaceStorageServiceImpl implements PickpicPlaceStorageService {

	//OneMemoDAO객체 주입]
	  @Resource(name="pickpicPlaceStorageDAO")
	  private PickpicPlaceStorageDAO dao;

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public void delete(Map map) {
		dao.delete(map);
	}

	@Override
	public void insert(Map map) {
		dao.insert(map);
	}

	@Override
	public void update(Map map) {
		dao.update(map);
	}
	  
}
