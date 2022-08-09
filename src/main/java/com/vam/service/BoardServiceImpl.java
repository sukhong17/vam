package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.BoardMapper;
import com.vam.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Override
	public void enroll(BoardVO board) {

		mapper.enroll(board);

	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public BoardVO getPage(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

}
