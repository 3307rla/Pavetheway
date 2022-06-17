package com.pavetheway.myapp.inquiry.dao;

import java.util.List;

import com.pavetheway.myapp.inquiry.dto.InquiryCommentDto;

public interface InquiryCommentDao {
	//댓글 목록 얻어오기 
	public List<InquiryCommentDto> getList(InquiryCommentDto dto);
	//댓글 삭제 
	public void delete(int num);
	//댓글 추가 
	public void insert(InquiryCommentDto dto);
	//추가할 댓글의 글번호를 리턴하는 메소드 
	public int getSequence();
	//댓글 수정
	public void update(InquiryCommentDto dto);
	//댓글 하나의 정보를 리턴하는 메소드
	public InquiryCommentDto getData(int num);
	//댓글의 갯수를 리턴하는 메소드
	public int getCount(int ref_group);
}
