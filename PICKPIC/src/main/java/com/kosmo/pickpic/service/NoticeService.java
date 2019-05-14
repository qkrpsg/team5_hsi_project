package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
//인터페이스
//형이 사용할 모든 메소드를 여기서 만들어주는 곳
//들어갈 수 있는 것 : 상수, 추상메소드
	
	//전체 목록용]
	List<NoticeDTO> selectList(Map map);

	//상세보기(글 하나 눌렀을 때)
	NoticeDTO selectOne(Map map);
	
	//전체 글 갯수를 구해주는 메소드
	int getTotalRecord(Map map);
	
	//입력/수정/삭제]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}
