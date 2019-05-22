package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.QuestionService;

@Repository
public class QuestionDAO implements QuestionService{

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	@Override
	public List<QuestionDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("questionSelectList", map);
	}

	@Override
	public QuestionDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("questionSelectOne",map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("questionGetTotalCount",map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return template.insert("questionInsert",map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return template.delete("questionDelete",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return template.update("questionUpdate",map);
	}

	@Override
	public int aqinsert(Map map) {
		// TODO Auto-generated method stub
		return template.insert("questionaqInsert",map);
	}

	@Override
	public int aqupdate(Map map) {
		// TODO Auto-generated method stub
		return template.update("questionaqUpdate",map);
	}
	

}
