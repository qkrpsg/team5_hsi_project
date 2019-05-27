package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.TipBoardDTO;
import com.kosmo.pickpic.service.TipBoardService;

@Repository
public class TipBoardDAO implements TipBoardService {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
    //전체보기
	@Override
	public List<TipBoardDTO> selectList(Map map) {
		return template.selectList("TipSelectList",map);
	}
    //상세보기
	@Override
	public TipBoardDTO selectOne(Map map) {
		
		return template.selectOne("TipSelectOne",map);
	}
    //전체 글수 구하기
	@Override
	public int getTotalRecord(Map map) {
		
		return template.selectOne("TipGetTotalCount",map);
	}
    
	@Override
	public int insert(Map map) {
		
		return template.insert("TipInsert",map);
	}

	@Override
	public int delete(Map map) {
		
		return template.delete("TipDelete",map);
	}

	@Override
	public int update(Map map) {
		
		return template.update("TipUpdate",map);
	}

	@Override
	public int aqinsert(Map map) {
		
		return template.insert("TipAQInsert",map);
	}

	@Override
	public int aqupdate(Map map) {
		
		return template.update("TipAQUpdate",map);
	}

}