package com.project.auction.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.auction.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String NAME_SPACE = "com.project.auction.mappers.member";

	@Override
	public void insertMember(Member m) {
		sqlSession.insert(NAME_SPACE + ".insertMember", m);
	}
	
	@Override
	public void updateMember(Member m) {
		sqlSession.insert(NAME_SPACE + ".updateMember", m);
	}

	@Override
	public Member getMemberInfo(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMemberInfo", id);
	}
}
