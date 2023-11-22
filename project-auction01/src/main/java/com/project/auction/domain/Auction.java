package com.project.auction.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;

public class Auction {

	private int  no;
	private String id;
	private String name;
	private String content;
	private Timestamp regDate;
	private Date startDate;
	private Date endDate;
	private int startPrice;
	private int endPrice;
	private String img;
	private String buyer;
	private int count;
	private Map<String, Integer> bidder;
	private boolean depositStatus;
	private Date depositDate;
	private boolean deliveryStatus;
	private Date deliveryDate;
	private boolean remitStatus;
	private Date remitDate;
	
	public Auction() {}
	public Auction(int no, String id, String name, String content, Timestamp regDate, Date startDate, Date endDate,
			int startPrice, int endPrice, String img, String buyer, int count, Map<String, Integer> bidder,
			boolean depositStatus, Date depositDate, boolean deliveryStatus, Date deliveryDate,
			boolean remitStatus, Date remitDate) {
		this.no = no;
		this.id = id;
		this.name = name;
		this.content = content;
		this.regDate = regDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.img = img;
		this.buyer = buyer;
		this.count = count;
		this.bidder = bidder;
		this.depositStatus = depositStatus;
		this.depositDate = depositDate;
		this.deliveryStatus = deliveryStatus;
		this.deliveryDate = deliveryDate;
		this.remitStatus = remitStatus;
		this.remitDate = remitDate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(int endPrice) {
		this.endPrice = endPrice;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Map<String, Integer> getBidder() {
		return bidder;
	}
	public void setBidder(Map<String, Integer> bidder) {
		this.bidder = bidder;
	}
	public boolean isDepositStatus() {
		return depositStatus;
	}
	public void setDepositStatus(boolean depositStatus) {
		this.depositStatus = depositStatus;
	}
	public Date getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public boolean isDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(boolean deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public boolean isRemitStatus() {
		return remitStatus;
	}
	public void setRemitStatus(boolean remitStatus) {
		this.remitStatus = remitStatus;
	}
	public Date getRemitDate() {
		return remitDate;
	}
	public void setRemitDate(Date remitDate) {
		this.remitDate = remitDate;
	}




	
	
}
