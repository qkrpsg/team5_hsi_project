package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.NoticeService;

@Service("adminService")
public class NoticeServiceImpl implements NoticeService {
//
	//MemoCommentDAO주입]
	@Resource(name="noticeDAO")
	private NoticeDAO dao;

	//게시판 뿌려주는 메소드
	@Override
	public List<NoticeDTO> selectList(Map map) {
		return dao.selectList(map);
	}
	
	//상세보기
	@Override
	public NoticeDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	//전체 글 갯수
	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
	
	//게시글 작성
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	
	
	
	
	//게시글 삭제
	@Override
	public int delete(Map map) {
		return dao.delete(map);		
	}
	
	//게시글 수정
	@Override
	public int update(Map map) {
		return dao.update(map);		
	}

	
	
}
