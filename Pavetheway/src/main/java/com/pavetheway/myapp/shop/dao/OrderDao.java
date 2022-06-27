package com.pavetheway.myapp.shop.dao;

import java.util.List;

import com.pavetheway.myapp.shop.dto.OrderDto;

public interface OrderDao {
	//장바구니 상품목록 조회한 결과
	public List<OrderDto> getList(String id);
	//상품별 금액
	public List<OrderDto> cartMoney();
	public void update(int num);
	//장바구니 상품 insert
	public void insert(OrderDto dto);
	//장바구니 상품 개별 delete
	public void delete(int num);
	//장바구니 상품 전체 delete
	public void deleteAll(String id);
	//장바구니 총 합계
	public int sumMoney(String id);
	//장바구니 상품 갯수
	public int countCart(String id, int code);
	//장바구니 수정
	public void updateCart(OrderDto dto);
	public void modifyCart(OrderDto dto);
	//글 정보 얻어오기
	public OrderDto getData(int num);
}
