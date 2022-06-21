package com.pavetheway.myapp.cart.dao;

import java.util.List;

import com.pavetheway.myapp.cart.dto.CartDto;

public interface CartDao {
	//장바구니 상품목록 조회한 결과
	public List<CartDto> getList(String id);
	//상품별 금액
	public List<CartDto> cartMoney();
	public void update(int num);
	//장바구니 상품 insert
	public void insert(CartDto dto);
	//장바구니 상품 개별 delete
	public void delete(int num);
	//장바구니 상품 전체 delete
	public void deleteAll(String id);
	//장바구니 총 합계
	public int sumMoney(String id);
	//장바구니 상품 갯수
	public int countCart(String id, int code);
	//장바구니 수정
	public void updateCart(CartDto dto);
	public void modifyCart(CartDto dto);
	public CartDto getData(int num);
}
