package com.project.auction.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.auction.domain.Auction;
import com.project.auction.domain.FindBoard;
import com.project.auction.domain.Reply;

@Repository
public class auctionDaoImpl implements auctionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.project.auction.mappers.auction";

	@Override
	public void insertAuction(Auction at) {
		sqlSession.insert(NAME_SPACE + ".insertAuction", at);
	}

	@Override
	public List<Auction> getAuctionList(String printType, String period, String keyword, 
						int startPage, int num) {
		Map<String, Object> params = new HashMap<>();
		params.put("printType", printType);
		params.put("period", period);
		params.put("keyword", keyword);
		params.put("startPage", startPage);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".getAuctionList", params);
	}

	@Override
	public Auction getAuction(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getAuction", no);
	}

	@Override
	public void updateEndPrice(int no, String buyer, int endPrice) {
		Map<String,Object> params = new HashMap<>();
		params.put("no", no);
		params.put("buyer", buyer);
		params.put("endPrice", endPrice);
		
		sqlSession.update(NAME_SPACE + ".updateEndPrice", params);
	}

	@Override
	public void updateAuction(Auction auction) {
		sqlSession.update(NAME_SPACE + ".updateAuction", auction);
	}

	@Override
	public void deleteAuction(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteAuction", no);
	}

	@Override
	public void insertBoard(FindBoard board) {
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}

	@Override
	public List<FindBoard> getBoardList(String id, String keyword) {
		Map<String, String> params = new HashMap<>();
		params.put("id", id);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".getBoardList",  id);
	}

	@Override
	public FindBoard getBoard(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getBoard",  no);
	}

	@Override
	public void updateBoard(FindBoard board) {
		sqlSession.update(NAME_SPACE + ".updateBoard", board);
	}

	@Override
	public void deleteBoard(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteBoard", no);
	}

	@Override
	public void insertReply(Reply re) {
		sqlSession.insert(NAME_SPACE + ".insertReply", re);
	}
	
	@Override
	public void updateReply(Reply re) {
		sqlSession.update(NAME_SPACE + ".updateReply", re);
	};

	@Override
	public void deleteReply(int  no) {
		sqlSession.update(NAME_SPACE + ".deleteReply", no);
	};

	@Override
	public List<Reply> getReplyList(int boardNo) {
		return sqlSession.selectList(NAME_SPACE + ".getReplyList", boardNo);
	}

	@Override
	public List<Auction> getMyAuctionList(String id, String option) {
		Map<String, String> params = new HashMap<>();
		params.put("id", id);
		params.put("option", option);
		
		return sqlSession.selectList(NAME_SPACE + ".getMyAuctionList", params);
	}

	@Override
	public int getAuctionCount(String period, String keyword) {
		Map<String, String> params = new HashMap<>();
		params.put("period", period);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getAuctionCount", params);
	}

	@Override
	public List<Auction> getCommissionList(Date start, Date end) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("end", end);
		
		return sqlSession.selectList(NAME_SPACE + ".getCommissionList", params);
	}






}
