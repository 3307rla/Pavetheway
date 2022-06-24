package com.pavetheway.myapp.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.dto.ReviewDto;

public interface ReviewService {
	//글 목록 얻어오기 
	public void getList(HttpServletRequest request);
	//업로드된 글 저장하기 
	public void saveFile(ReviewDto dto, ModelAndView mView,
		HttpServletRequest request);
	//글 하나의 정보 얻어오기 
	public void getFileData(int num, ModelAndView mView);
	//글 삭제하기
	public void deleteFile(int num, HttpServletRequest request);
}
