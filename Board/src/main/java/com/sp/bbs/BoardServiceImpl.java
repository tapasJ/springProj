package com.sp.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("bbs.boardService")
public class BoardServiceImpl implements BoardService {

 @Autowired
 private CommonDAO dao;

@Override
public int insertBoard(Board dto) {
	int result=0;
	try {
		//최대값을 이용하여 게시물 번호를 작성하는 경우
		//int maxNum = dao.getIntValue("bbs.numMax")
		//dto.setNum(maxNum+1);		
		result=dao.insertData("bbs.insertBoard", dto);
	} catch (Exception e) {
		// TODO: handle exception
	}
	return result;
}

@Override
public List<Board> listBoard(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int dataCount(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public Board readBoard(int num) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int updateHitCount(int num) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public Board preReadBoard(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public Board nextReadBoard(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int updateBoard(Board dto) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int deleteBoard(int num) {
	// TODO Auto-generated method stub
	return 0;
}
	
}