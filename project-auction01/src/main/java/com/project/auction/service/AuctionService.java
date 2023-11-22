package com.project.auction.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.project.auction.domain.Auction;
import com.project.auction.domain.FindBoard;
import com.project.auction.domain.Reply;

public interface AuctionService {
	
	public abstract void insertAuction(Auction at);
	
	public abstract Map<String, Object> getAuctionList(String printType, String period, String keyword, int pageNum, int pageSize);
	
	public abstract Auction getAuction(int no);
	
	public abstract Auction bid(int no, String buyer, int endPrice);
	
	public abstract void updateAuction(Auction auction);

	public abstract void deleteAuction(int no);
	
	public abstract void insertBoard(FindBoard board);
	
	public abstract List<FindBoard> getBoardList(String id, String keyword);

	public abstract FindBoard getBoard(int no);
	
	public abstract void updateBoard(FindBoard board);
	
	public abstract void deleteBoard(int no);
	
	public abstract void insertReply(Reply re);
	
	public abstract void updateReply(Reply re);

	public abstract void deleteReply(int no);
	
	public List<Reply> getReplyList(int boardNo);
	
	public List<Auction> getMyAuctionList(String id, String option);
	
	public List<Auction> getCommissionList(Date start, Date end);
	
	
}
