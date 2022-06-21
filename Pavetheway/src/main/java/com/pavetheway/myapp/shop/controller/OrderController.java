package com.pavetheway.myapp.shop.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.service.OrderService;

@Controller
public class OrderController {
    
	@Autowired
	private OrderService service;
    
	@RequestMapping("/shop/orderlist")
	public ModelAndView list(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("shop/orderlist");
		return mView;
	}
	
	@RequestMapping("/shop/buy")
	public ModelAndView authBuy(HttpServletRequest request,
			ModelAndView mView) {
		service.buy(request, mView);
		mView.setViewName("shop/buy");
		return mView;
	}
	
}
