package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickpicNoticeService;


@Repository
public class PickpicNoticeDAO implements PickpicNoticeService {
	//
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	//현재 글번에 따른 모든 댓글 목록]
	@Override
	public List<Map> selectList(Map map) {	
		return template.selectList("commentSelectList", map);
	}//////////////////

	@Override
	public void insert(Map map) {
		template.insert("commentInsert",map);
	}

	@Override
	public void delete(Map map) {
		template.delete("commentDelete",map);
	}

	@Override
	public void update(Map map) {
		template.update("commentUpdate",map);
		
	}
	
}
