package com.kosmo.pickpic.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.FilterService;

@Repository
public class FilterDAO implements FilterService{
	@Resource(name = "template")
	private SqlSessionTemplate template;

}
