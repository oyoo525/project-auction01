package com.project.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.auction.dao.MemberDao;
import com.project.auction.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public void insertMember(Member m) {
		m.setPass(passwordEncoder.encode(m.getPass()));
		memberDao.insertMember(m);
	}

	@Override
	public void updateMember(Member m) {
		m.setPass(passwordEncoder.encode(m.getPass()));
		memberDao.updateMember(m);
	}

	@Override
	public Member getMemberInfo(String id) {
		return memberDao.getMemberInfo(id);
	}
	
	@Override
	public boolean idCheck(String id) {
		Member m = memberDao.getMemberInfo(id);
		// 아이디가 있으면 false 반환
		if(m != null) return false;
		// 아이디가 없으면 true 반환
		return true;
	}

	@Override
	public boolean isLogin(String id, String pass) {
		Member m = memberDao.getMemberInfo(id);
		// 비밀번호가 일치하면 true 반환
		if(passwordEncoder.matches(pass, m.getPass())) return true;
		return false;
	}

	
	
	
	
	
	
	
	
	
}
