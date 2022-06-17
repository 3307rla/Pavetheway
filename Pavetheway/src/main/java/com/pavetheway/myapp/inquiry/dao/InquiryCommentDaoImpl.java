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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(InquiryCommentDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getSequence() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(InquiryCommentDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public InquiryCommentDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(int ref_group) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
