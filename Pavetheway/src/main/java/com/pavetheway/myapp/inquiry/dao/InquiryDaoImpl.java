package com.pavetheway.myapp.inquiry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.inquiry.dto.InquiryDto;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<InquiryDto> getList(InquiryDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(InquiryDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(InquiryDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public InquiryDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InquiryDto getData(InquiryDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

}
