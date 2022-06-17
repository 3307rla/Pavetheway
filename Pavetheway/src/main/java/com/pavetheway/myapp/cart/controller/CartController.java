package com.pavetheway.myapp.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.cart.dto.CartDto;
import com.pavetheway.myapp.cart.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping(value = "/cart/insert")
	public ModelAndView authInsert(CartDto dto, HttpServletRequest request) {

		service.insert(dto);
		
		return new ModelAndView("cart/upload");
	}
}
