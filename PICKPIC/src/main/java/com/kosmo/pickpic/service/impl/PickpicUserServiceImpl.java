package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.PickpicUserDTO;
import com.kosmo.pickpic.service.PickpicUserService;

//
@Service("pickpicService")
public class PickpicUserServiceImpl implements PickpicUserService {

	//OneMemoDAO객체 주입]
		@Resource(name="pickpicUserDAO")
		private PickpicUserDAO dao;
		
		@Override
		public boolean isMember(Map map) {		
			return dao.isMember(map);
		}
		@Override
		public List<PickpicUserDTO> selectList(Map map) {		
			return dao.selectList(map);
		}

		@Override
		public int getTotalRecord(Map map) {		
			return dao.getTotalRecord(map);
		}
		@Override
		public PickpicUserDTO selectOne(Map map) {
			return dao.selectOne(map);
		}
		@Override
		public int delete(Map map) {		
			return dao.delete(map);
		}
		@Override
		public int insert(Map map) {		
			return dao.insert(map);
		}
		@Override
		public int update(Map map) {		
			return dao.update(map);
		}
	
}
