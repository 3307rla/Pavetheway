package com.pavetheway.myapp.cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pavetheway.myapp.cart.dto.CartDto;

public interface CartService {
	
	public List<CartDto> getList(String id);
	public List<CartDto> cartMoney();
	public void update(int num);
	//장바구니 상품 insert
	public void insert(CartDto dto);
	//장바구니 상품 개별 delete
	public void delete(int num, HttpServletRequest request);
	//장바구니 상품 전체 delete
	public void deletAll(String id);
	//장바구니 총 합계
	public int sumMoney(String id);
	//장바구니 상품 갯수
	public int countCart(String id, int code);
	//장바구니 수정
	public void updateCart(CartDto dto);
	public void modifyCart(CartDto dto);
}
