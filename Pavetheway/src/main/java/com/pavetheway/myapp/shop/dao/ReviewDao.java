package com.pavetheway.myapp.shop.dao;

import java.util.List;

import com.pavetheway.myapp.shop.dto.ReviewDto;

public interface ReviewDao {
	public void insert(ReviewDto dto);
	public ReviewDto getData(int num);
	public void delete(int num);
	public List<ReviewDto> getList(ReviewDto dto);
	public int getCount(ReviewDto dto);
}
