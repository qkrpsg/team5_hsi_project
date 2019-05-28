package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickPlaceBoardDTO;
import com.kosmo.pickpic.service.PickPlaceBoardService;

@Service("ppbService")
public class PickPlaceBoardServiceImpl implements PickPlaceBoardService {
	@Resource(name = "pickPlaceBoardDAO")
	private PickPlaceBoardDAO dao;

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public List<PickPlaceBoardDTO> ppbBestList() {
		return dao.ppbBestList();
	}

	@Override
	public List<Map> ppbMyPageList(Map map) {
		return dao.ppbMyPageList(map);
	}

	@Override
	public Map ppbSelectOne(Map map) {
		return dao.ppbSelectOne(map);
	}

	@Override
	public int pickPlaceBoardUpdate(Map map) {
		// TODO Auto-generated method stub
		return dao.pickPlaceBoardUpdate(map);
	}
}
