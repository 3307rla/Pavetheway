package com.pavetheway.myapp.shop.dao;

import java.util.List;
import com.pavetheway.myapp.shop.dto.OrderDto;

public interface OrderDao {
	//상품 목록을 리턴해주는 메소드
		public List<OrderDto> getList();
		//상품 재고를 감소 시키는 메소드
		public void minusCount(int num);
		//잔고 감소 시키는 메소드 
		public void minusMoney(OrderDto dto);
		//포인트를 증가 시키는 메소드
		public void plusPoint(OrderDto dto);
		//상품의 가격을 리턴해주는 메소드
		public int getPrice(int num);
		//배송 정보를 추가 하는 메소드
		public void addOrder(OrderDto dto);
}
