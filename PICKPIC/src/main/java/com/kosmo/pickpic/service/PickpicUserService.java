package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

//
public interface PickpicUserService {
	//로그인 용]
		boolean isMember(Map map);
		boolean isMember2(Map map);
		//목록용]
		List<PickpicUserDTO> selectList(Map map);
		//전체 레코드 수]
		int getTotalRecord(Map map);
		//상세보기용]
		PickpicUserDTO selectOne(Map map);
		//입력/수정/삭제용]
		int delete(Map map);
		int insert(Map map);
		int update(Map map);
}
