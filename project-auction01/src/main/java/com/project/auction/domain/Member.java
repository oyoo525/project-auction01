package com.project.auction.domain;

import java.sql.Timestamp;

public class Member {

	private String id;
	private String pass;
	private String name;
	private String phone;
	private String mail;
	private int zipcode;
	private String address1;
	private String address2;
	private String marketing;
	private Timestamp joinDate;
	private Timestamp modificationDate;
	private String type;
	
	
	public Member() {}
	public Member(String id, String pass, String name, String phone, String mail, int zipcode, String address1, String address2,
			String marketing, Timestamp joinDate, Timestamp modificationDate, String type) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.marketing = marketing;
		this.joinDate = joinDate;
		this.modificationDate = modificationDate;
		this.type = type;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMarketing() {
		return marketing;
	}
	public void setMarketing(String marketing) {
		this.marketing = marketing;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public Timestamp getModificationDate() {
		return modificationDate;
	}
	public void setModificationDate(Timestamp modificationDate) {
		this.modificationDate = modificationDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
