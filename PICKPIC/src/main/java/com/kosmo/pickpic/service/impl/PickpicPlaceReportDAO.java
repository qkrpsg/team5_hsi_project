package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.kosmo.pickpic.service.PickpicPlaceReportService;

public class PickpicPlaceReportDAO implements PickpicPlaceReportService {

	//SqlSessionTemplate객체 주입]
    @Resource(name="template")
    private SqlSessionTemplate template;

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("ReportSelectList",map);
	}//selectList

	@Override
	public void insert(Map map) {
		template.insert("ReportInsert",map);
	}//insert

	@Override
	public void delete(Map map) {
		template.delete("ReportDelete",map);
	}//delete

	@Override
	public void update(Map map) {
		template.update("ReportUpdate",map);
	}//update
    
}
