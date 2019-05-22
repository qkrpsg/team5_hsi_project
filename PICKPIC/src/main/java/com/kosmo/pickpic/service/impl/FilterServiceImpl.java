package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.FilterService;

@Service("fService")
public class FilterServiceImpl implements FilterService{
	@Resource(name = "filterDAO")
	private FilterDAO dao;

	@Override
	public List<Map> albumDownFilterName(Map map) {
		return dao.albumDownFilterName(map);
	}

	@Override
	public FilterDTO selectFilter_buy(Map map) {
		return dao.selectFilter_buy(map);
	}
	
}
