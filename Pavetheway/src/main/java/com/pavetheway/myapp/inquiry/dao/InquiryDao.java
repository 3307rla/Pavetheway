package com.pavetheway.myapp.inquiry.dao;

import java.util.List;

import com.pavetheway.myapp.inquiry.dto.InquiryDto;

public interface InquiryDao {
	//글목록
	public List<InquiryDto> getList(InquiryDto dto);
	//글의 갯수
	public int getCount(InquiryDto dto);
	//글 추가
	public void insert(InquiryDto dto);
	//글정보 얻어오기
	public InquiryDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public InquiryDto getData(InquiryDto dto);
	//글 삭제
	public void delete(int num);
	
}
