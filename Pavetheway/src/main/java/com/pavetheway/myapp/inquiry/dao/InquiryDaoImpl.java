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
		
		return session.selectList("inquiry.getList", dto);
	}

	@Override
	public int getCount(InquiryDto dto) {
		
		return session.selectOne("inquiry.getCount", dto);
	}

	@Override
	public void insert(InquiryDto dto) {
		session.insert("inquiry.insert", dto);
		
	}

	@Override
	public InquiryDto getData(int num) {
		
		return session.selectOne("inquiry.getData", num);
	}

	@Override
	public InquiryDto getData(InquiryDto dto) {
		return session.selectOne("inquiry.getData2", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("inquiry.delete", num);
		
	}

}
