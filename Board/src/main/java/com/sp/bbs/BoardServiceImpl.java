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
			result=dao.insertData("bbs.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("bbs.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		try {
			list=dao.getListData("bbs.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Board readBoard(int num) {
		Board dto=null;
		try {
			dto=dao.getReadData("bbs.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("bbs.updateHitCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.getReadData("bbs.preReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.getReadData("bbs.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Board dto) {
		int result=0;
		try {
			result=dao.updateData("bbs.updateBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result=0;
		try {
			result=dao.deleteData("bbs.deleteBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
