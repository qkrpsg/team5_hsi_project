package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickPlaceBoardDTO;
import com.kosmo.pickpic.service.PickPlaceBoardService;

@Repository
public class PickPlaceBoardDAO implements PickPlaceBoardService {
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public int insert(Map map) {
		return template.insert("ppbinsert",map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("ppbselect",map);
	}

	@Override
	public List<PickPlaceBoardDTO> ppbBestList() {
		List<PickPlaceBoardDTO> list = template.selectList("ppbBestList");
		
		for(PickPlaceBoardDTO record : list) {
			record.setPpb_image_path("https://s3.ap-northeast-2.amazonaws.com/img.pickpic.com/pickpic/image" + record.getPpb_image_path());
		}
		
		
		return list;
	}

	@Override
	public List<Map> ppbMyPageList(Map map) {
		return template.selectList("ppbMyPageList",map);
	}

	@Override
	public Map ppbSelectOne(Map map) {
		return template.selectOne("PpbSelectOne",map);
	}

	@Override
	public int pickPlaceBoardUpdate(Map map) {
		// TODO Auto-generated method stub
		return template.update("pickPlaceBoardUpdate",map) ;
	}

	@Override
	public List<Map> pickPlaceBest(Map map) {
	
		return template.selectList("PickPlaceBest",map);
	}
 
	
}
