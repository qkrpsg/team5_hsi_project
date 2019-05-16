package com.kosmo.pickpic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.FilterService;

@Service("fService")
public class FilterServiceImpl implements FilterService{
	@Resource(name = "filterDAO")
	private FilterDAO dao;
}
