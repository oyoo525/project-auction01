package com.project.auction.domain;

import java.sql.Timestamp;

public class Reply {

	private int no;
	private String id;
	private String content;
	private Timestamp regDate;
	private int boardNo;
	
	
	public Reply() {}
	public Reply(int no, String id, String content, Timestamp regDate, int boardNo) {
		this.no = no;
		this.id = id;
		this.content = content;
		this.regDate = regDate;
		this.boardNo = boardNo;
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
	
}
