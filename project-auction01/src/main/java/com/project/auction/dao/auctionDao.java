package com.project.auction.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import com.project.auction.domain.Auction;
import com.project.auction.domain.FindBoard;
import com.project.auction.domain.Reply;

public interface auctionDao {

	public abstract void insertAuction(Auction at);
	
	public abstract List<Auction> getAuctionList(String printType, String period, String keyword, int startPage, int num);
	
	public abstract Auction getAuction(int no);
	
	public abstract void updateEndPrice(int no, String buyer, int endPrice);
	
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
	
	public abstract List<Reply> getReplyList(int boardNo);
	
	public abstract List<Auction> getMyAuctionList(String id, String option);
	
	public abstract int getAuctionCount(String period, String keyword);
	
	public abstract List<Auction> getCommissionList(Date start, Date end);

}
