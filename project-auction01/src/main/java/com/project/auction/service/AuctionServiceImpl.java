package com.project.auction.service;

import java.sql.Date;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CurrencyEditor;
import org.springframework.stereotype.Service;

import com.project.auction.dao.auctionDao;
import com.project.auction.domain.Auction;
import com.project.auction.domain.FindBoard;
import com.project.auction.domain.Reply;

@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private auctionDao auctionDao;
	
	private static final int PAGE_SIZE = 12;
	private static final int PAGE_GROUP = 10;
	

	@Override
	public void insertAuction(Auction at) {
		auctionDao.insertAuction(at);
	}

	@Override
	public Map<String, Object> getAuctionList(String printType, String period, 
						String keyword, int pageNum, int pageSize) {
		int currentPage = pageNum;
		int start = (currentPage -1) * pageSize;
		int listCount = auctionDao.getAuctionCount(period, keyword);
		// 페이지에 출력되는 리스트
		List<Auction> auctionList = auctionDao.getAuctionList(printType, period, keyword, start, pageSize);

		int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
		endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("atList", auctionList);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("period", period);
		modelMap.put("keyword", keyword);
		modelMap.put("pageNum", pageNum);
		modelMap.put("printType", printType);
		
		
		return modelMap;
	}

	@Override
	public Auction getAuction(int no) {
		return auctionDao.getAuction(no);
	}

	@Override
	public Auction bid(int no, String buyer, int endPrice) {
		// DB 업데이트
		auctionDao.updateEndPrice(no, buyer, endPrice);
		// 경매정보 가져오기
		return auctionDao.getAuction(no);
	}

	@Override
	public void updateAuction(Auction auction) {
		auctionDao.updateAuction(auction);
	}

	@Override
	public void deleteAuction(int no) {
		auctionDao.deleteAuction(no);
	}

	@Override
	public void insertBoard(FindBoard board) {
		auctionDao.insertBoard(board);
	}

	@Override
	public List<FindBoard> getBoardList(String id, String keyword) {
		return auctionDao.getBoardList(id, keyword);
	}

	@Override
	public FindBoard getBoard(int no) {
		return auctionDao.getBoard(no);
	}

	@Override
	public void updateBoard(FindBoard board) {
		auctionDao.updateBoard(board);
	}

	@Override
	public void deleteBoard(int no) {
		auctionDao.deleteBoard(no);
	}
	
	@Override
	public void insertReply(Reply re) {
		auctionDao.insertReply(re);
	};
	
	@Override
	public void updateReply(Reply re) {
		auctionDao.updateReply(re);
	};

	@Override
	public void deleteReply(int no) {
		auctionDao.deleteReply(no);
	};

	@Override
	public List<Reply> getReplyList(int boardNo) {
		return auctionDao.getReplyList(boardNo);
	}

	@Override
	public List<Auction> getMyAuctionList(String id, String option) {
		
		return auctionDao.getMyAuctionList(id, option);
	}

	@Override
	public List<Auction> getCommissionList(Date start, Date end) {
		return auctionDao.getCommissionList(start, end);
	}


}
