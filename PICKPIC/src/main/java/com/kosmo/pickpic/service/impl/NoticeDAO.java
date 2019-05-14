package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.NoticeService;


@Repository
public class NoticeDAO implements NoticeService {
	//
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	//현재 글번에 따른 모든 댓글 목록]
	@Override
	public List<NoticeDTO> selectList(Map map) {	
		return template.selectList("commentSelectList", map);
	}//////////////////
	
	
	
	

	@Override
	public int insert(Map map) {
		return template.insert("commentInsert",map);
	}

	@Override
	public int delete(Map map) {
		return template.delete("commentDelete",map);
	}

	@Override
	public int update(Map map) {
		return template.update("commentUpdate",map);
		
	}

	@Override
	public NoticeDTO selectOne(Map map) {
		return template.selectOne("commentSelectOne",map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("commentGetTotalCount",map);
	}
	
}
