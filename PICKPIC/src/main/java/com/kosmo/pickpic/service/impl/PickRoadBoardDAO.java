package com.kosmo.pickpic.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickRoadBoardService;

@Repository
public class PickRoadBoardDAO implements PickRoadBoardService{
	@Resource(name = "template")
	private SqlSessionTemplate template;
}
