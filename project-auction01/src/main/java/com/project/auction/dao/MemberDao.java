package com.project.auction.dao;

import com.project.auction.domain.Member;

public interface MemberDao {

	public abstract void insertMember(Member m);

	public abstract void updateMember(Member m);
	
	public abstract Member getMemberInfo(String id);
	
}
