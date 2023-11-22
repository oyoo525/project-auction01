package com.project.auction.domain;

import java.sql.Timestamp;

public class FindBoard {

	private int no;
	private String id;
	private String title;
	private String content;
	private Timestamp regDate;
	
	public FindBoard() {}
	public FindBoard(int no, String id, String title, String content, Timestamp regDate) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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


	
	
	
	
	
}
