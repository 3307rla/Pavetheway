package com.pavetheway.myapp.shop.dao;

import java.util.List;

import com.pavetheway.myapp.shop.dto.ReviewDto;

public interface ReviewDao {
	//글 추가
	public void insert(ReviewDto dto);
	//글 정보 얻어오기
	public ReviewDto getData(int num);
	//글 삭제하기
	public void delete(int num);
	//글 목록
	public List<ReviewDto> getList(ReviewDto dto);
	//
	public int getCount(ReviewDto dto);
}
