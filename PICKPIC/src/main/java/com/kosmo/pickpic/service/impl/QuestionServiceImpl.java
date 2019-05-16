package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.QuestionService;
@Service("questionService")
public class QuestionServiceImpl implements QuestionService{

	@Resource(name="questionDAO")
	private QuestionDAO dao;
	
	
	
	@Override
	public List<QuestionDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public QuestionDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecord(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);		
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);	
	}
    
}
