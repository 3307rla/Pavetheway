package com.pavetheway.myapp.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.shop.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{
    @Autowired SqlSession session;
    
	@Override
	public List<OrderDto> getList() {
		return session.selectList("order.getList");
	
	}
    //재고 갯수 줄이기
	@Override
	public void minusCount(int num) {
		session.update("order.minusCount", num);		
	
	}
    //계좌 잔고 줄이기
	@Override
	public void minusMoney(OrderDto dto) {
		session.update("order.minusMoney", dto);
		
	}
	//상품 구입 가격의 10% 를 포인트로 적립하는 메소드 
	@Override
	public void plusPoint(OrderDto dto) {
		session.update("order.plusPoint", dto);
		
	}
	//상품 번호에 해당하는 상품의 가격을 리턴하는 메소드 
	@Override
	public int getPrice(int num) {
		return session.selectOne("order.getPrice", num);
	}
	//상품 주문 정보를 저장하는 메소드 
	@Override
	public void addOrder(OrderDto dto) {
		session.insert("shop.addOrder", dto);
		
	}
    
}
