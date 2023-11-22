package com.project.auction.service;

import com.project.auction.domain.Member;

public interface MemberService {

	public abstract void insertMember(Member m);
	
	public abstract void updateMember(Member m);
	
	public abstract Member getMemberInfo(String id);
	
	public abstract boolean idCheck(String id);
	
	public abstract boolean isLogin(String id, String pass);
	
}
