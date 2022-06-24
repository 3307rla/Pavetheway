package com.pavetheway.myapp.cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pavetheway.myapp.cart.dao.CartDao;
import com.pavetheway.myapp.cart.dto.CartDto;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	@Override
	public List<CartDto> getList(String id) {
		
		return cartDao.getList(id);
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
		
		cartDao.insert(dto); 
		
	}

	@Override
	public void delete(int num, HttpServletRequest request) {
		 
		cartDao.delete(num);
		
	}

	@Override
	public void deletAll(String id) {
		
		cartDao.deleteAll(id);
		
	}

	@Override
	public int sumMoney(String id) {
		
		return cartDao.sumMoney(id);
	}

	@Override
	public int countCart(String id, int code) {
		
		return 0;
	}

	@Override
	public void updateCart(CartDto dto) {
		
		cartDao.updateCart(dto);
	}

	@Override
	public void modifyCart(CartDto dto) {
		
		cartDao.modifyCart(dto);
	}
	
	


}
