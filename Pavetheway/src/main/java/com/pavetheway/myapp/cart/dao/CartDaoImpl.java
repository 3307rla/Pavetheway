package com.pavetheway.myapp.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.cart.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CartDto> getList(String id) {
		
		return session.selectList("cart.getList", id);
	}

	@Override
	public List<CartDto> cartMoney() {
		
		return null;
	}

	@Override
	public void update(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(CartDto dto) {

		session.insert("cart.insert", dto);
	}

	@Override
	public void delete(int num) {
		
		session.delete("cart.delete", num);		
	}

	@Override
	public void deleteAll(String id) {
		
		session.delete("cart.deleteAll", id);
	}

	@Override
	public int sumMoney(String id) {
		
		return session.selectOne("cart.sumMoney", id);
	}

	@Override
	public int countCart(String id, int code) {
		
		return 0;
	}

	@Override
	public void updateCart(CartDto dto) {
		session.update("cart.sumCart", dto);
	}

	@Override
	public void modifyCart(CartDto dto) {
		session.update("cart.modify", dto);
		
	}

	@Override
	public CartDto getData(int num) {
		
		return null;
	}

}
