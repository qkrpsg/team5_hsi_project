package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.kosmo.pickpic.service.PickpicPlaceBoardService;

public class PickpicPlaceBoardDAO implements PickpicPlaceBoardService {

	//SqlSessionTemplate객체 주입]
    @Resource(name="template")
    private SqlSessionTemplate template;
    //현재 글번에 따른 모든 댓글 목록]

	@Override
	public List<Map> selectList(Map map) {
	    return template.selectList("PlaceSelectList",map); 
	}

	@Override
	public void insert(Map map) {
		template.insert("PlaceInsert",map);
	}//insert

	@Override
	public void delete(Map map) {
		template.delete("PlaceDelete",map);
	}//delete

	@Override
	public void update(Map map) {
		template.update("PlaceUpdate",map);
	}//update
    
   
}
