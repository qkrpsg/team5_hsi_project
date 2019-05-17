package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.FilterService;

@Service("fService")
public class FilterServiceImpl implements FilterService{
	@Resource(name = "filterDAO")
	private FilterDAO dao_filter;

	@Override
	public List<Map> albumDownFilterName(Map map) {
		// TODO Auto-generated method stub
		return dao_filter.albumDownFilterName(map);
	}
}
