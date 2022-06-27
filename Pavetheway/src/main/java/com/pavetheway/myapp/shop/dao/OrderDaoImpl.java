package com.pavetheway.myapp.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.shop.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<OrderDto> getList(String id) {
		return session.selectList("order.getList", id);
	}

	@Override
	public List<OrderDto> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(OrderDto dto) {
		session.insert("order.insert", dto);
		
	}

	@Override
	public int sumMoney(String id) {
		return session.selectOne("order.sumMoney", id);
	}

	@Override
	public int countCart(String id, int code) {
		return 0;
	}

	@Override
	public void updateCart(OrderDto dto) {
		session.update("order.sumCart", dto);
		
	}

	@Override
	public void modifyCart(OrderDto dto) {
		session.update("order.modify", dto);
		
	}

	@Override
	public OrderDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<OrderDto> getCartList(String id) {
		return session.selectList("order.getCartList", id);
	}
}
