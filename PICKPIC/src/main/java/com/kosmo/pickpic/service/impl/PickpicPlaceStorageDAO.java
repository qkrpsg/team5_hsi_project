package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.kosmo.pickpic.service.web.PickpicPlaceStorageService;

public class PickpicPlaceStorageDAO implements PickpicPlaceStorageService {
	//SqlSessionTemplate객체 주입]
	    @Resource(name="template")
	    private SqlSessionTemplate template;

		@Override
		public List<Map> selectList(Map map) {
			return template.selectList("commentSelectList",map);
		}

		@Override
		public void delete(Map map) {
			template.delete("commentDelete",map);
		}//delete

		@Override
		public void insert(Map map) {
			template.insert("commentInsert",map);
		}//insert

		@Override
		public void update(Map map) {
			template.update("commentUpdate",map);
		}//update
	    
	    
}
