package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.TipBoardDTO;
import com.kosmo.pickpic.service.TipBoardService;
@Service("TipBoardService")
public class TipBoardServiceImpl implements TipBoardService {

	@Resource(name="tipBoardDAO")
	private TipBoardDAO dao;
	
	
	@Override
	public List<TipBoardDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public TipBoardDTO selectOne(Map map) {
		
		return dao.selectOne(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		
		return dao.getTotalRecord(map);
	}

	@Override
	public int insert(Map map) {
		
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		
		return dao.update(map);
	}

	@Override
	public int aqinsert(Map map) {
		// TODO Auto-generated method stub
		return dao.aqinsert(map);
	}

	@Override
	public int aqupdate(Map map) {
		// TODO Auto-generated method stub
		return dao.aqupdate(map);
	}

	

}
