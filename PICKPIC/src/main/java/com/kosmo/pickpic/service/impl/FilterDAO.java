package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.FilterService;

@Repository
public class FilterDAO implements FilterService{
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<Map> albumDownFilterName(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("AlbumDownFilterName",map);
	}

	@Override
	public FilterDTO selectFilter_buy(Map map) {
		FilterDTO user =  template.selectOne("SelectFilter_buy",map);
		//FilterDTO dto = new FilterDTO();
		
		
		
		return user;
	}
	

}
