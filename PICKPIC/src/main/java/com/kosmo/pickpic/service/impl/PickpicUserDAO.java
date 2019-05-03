package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.pickpic.service.PickpicUserDTO;
import com.kosmo.pickpic.service.PickpicUserService;

//

@Repository
public class PickpicUserDAO implements PickpicUserService {
	//SqlSessionTemplate객체 주입]
		@Resource(name="template")
		private SqlSessionTemplate template;
		//로그인 용]
		@Override
		public boolean isMember(Map map) {		
			return (Integer)template.selectOne("PickpicUserIsMember",map)==0?false:true;
		}
		@Override
		public boolean isMember2(Map map) {
			return (Integer)template.selectOne("PickpicUserIsMember2",map)==0?false:true;
		}
		
		//전체 목록용]
		@Override
		public List<PickpicUserDTO> selectList(Map map) {		
			return template.selectList("PickpicUserSelectList", map);
		}
		@Override
		public int getTotalRecord(Map map) {		
			return template.selectOne("PickpicUserTotalCount",map);
		}
		@Override
		public PickpicUserDTO selectOne(Map map) {		
			return template.selectOne("PickpicUserSelectOne",map);
		}
		
		@Override
		public int delete(Map map) {
			/*메모 삭제-프로그래밍적으로 혹은 
			   부모 삭제시 자동으로 해당 자식도 삭제하도록 FK설정
			  REFERENCES 부모테이블(PK컬럼) ON  DELETE CASCADE
			*/
			return template.delete("PickpicUserDelete",map);
		}

		@Override
		public int insert(Map map) {			
			return template.insert("PickpicUserInsert",map);
		}

		@Override
		public int update(Map map) {		
			return template.update("PickpicUserUpdate",map);
		}

}
