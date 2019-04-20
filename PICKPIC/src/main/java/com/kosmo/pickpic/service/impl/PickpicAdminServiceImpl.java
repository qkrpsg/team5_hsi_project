package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickpicAdminService;


//@Service("commentService")

public class PickpicAdminServiceImpl implements PickpicAdminService {

	//MemoCommentDAO주입]
	@Resource(name="pickpicAdminDAO")
	private PickpicPostDAO dao;

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}
	@Override
	public void insert(Map map) {
		dao.insert(map);
	}
	@Override
	public void delete(Map map) {
		dao.delete(map);		
	}
	@Override
	public void update(Map map) {
		dao.update(map);		
	}
	
}
