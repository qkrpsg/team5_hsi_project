package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.FilterService;
import com.kosmo.pickpic.service.PaymentDTO;
import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.util.DTOUtil;

@Repository
public class FilterDAO implements FilterService{
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<Map> albumDownFilterName(Map map) {
		return template.selectList("AlbumDownFilterName",map);
	}

	@Override
	public FilterDTO selectFilter_buy(Map map) {
		FilterDTO user =  template.selectOne("SelectFilter_buy",map);
		FilterDTO dto = template.selectOne("SelectFilter_buy2",map);
		user.setPpa_email(dto.getPpa_email());
		user.setPpa_nickname(dto.getPpa_nickname());
		user.setPpa_index(dto.getPpa_index());
		return user;
	}

	@Override
	public int addPayment(Map map) {
		int result = template.insert("addPayment", map);
		if(result == 0)
			return result;
		return template.insert("filter_storage", map);
	}//addPayment

	@Override
	public List<Map> filterList() {
		return template.selectList("FilterList");
	}

}
