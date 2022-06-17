package com.pavetheway.myapp.inquiry.service;

import javax.servlet.http.HttpServletRequest;

import com.pavetheway.myapp.inquiry.dto.InquiryCommentDto;
import com.pavetheway.myapp.inquiry.dto.InquiryDto;

public interface InquiryService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(InquiryDto dto);
	public void updateContent(InquiryDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void saveComment(HttpServletRequest request);//댓글 저장 
	public void deleteComment(HttpServletRequest request);//댓글 삭제
	public void updateComment(InquiryCommentDto dto);//댓글 수정
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
}
