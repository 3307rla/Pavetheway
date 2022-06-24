package com.pavetheway.myapp.shop.dao;

import java.util.List;

import com.pavetheway.myapp.shop.dto.ShopDto;

public interface ShopDao {
    //상품 리스트 가져오기
	public List<ShopDto> getList(ShopDto dto);
	//상품 갯수
	public int getCount(ShopDto dto);
	//DB 에서 상품리스트 하나의 정보를 가져오기
	public ShopDto getDetail(int num);
	//키워드를 활용한 상품 data 얻어오기
	public ShopDto getData(ShopDto dto);
	//상품 등록하기
	public void insert(ShopDto dto);
}
