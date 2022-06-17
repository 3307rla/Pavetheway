package com.pavetheway.myapp.cart.dao;

import java.util.List;

import com.pavetheway.myapp.cart.dto.CartDto;

public interface CartDao {
	//장바구니 상품목록 조회한 결과
	public List<CartDto> getList(CartDto dto);
	
	//장바구니 상품 insert
	public void insert(CartDto dto);
	//장바구니 상품 delete
	public void delete(int num); 
}
