package com.pavetheway.myapp.inquiry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.inquiry.dto.InquiryCommentDto;

@Repository
public class InquiryCommentDaoImpl implements InquiryCommentDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<InquiryCommentDto> getList(InquiryCommentDto dto) {
		
		return session.selectList("inquiryComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		
		session.delete("inquiryComment.delete", num);
		
	}

	@Override
	public void insert(InquiryCommentDto dto) {
		
		session.insert("inquiryComment.insert", dto);
		
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("inquiryComment.getSequence");
	}

	@Override
	public void update(InquiryCommentDto dto) {
		
		session.update("inquiryComment.update", dto);
		
	}

	@Override
	public InquiryCommentDto getData(int num) {
		
		return session.selectOne("inquiryComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("inquiryComment.getCount", ref_group);
	}
	
	
}
