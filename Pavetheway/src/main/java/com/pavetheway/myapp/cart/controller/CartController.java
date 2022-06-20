package com.pavetheway.myapp.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.cart.dto.CartDto;
import com.pavetheway.myapp.cart.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/insert")
	public ModelAndView authInsert(CartDto dto, HttpSession session, HttpServletRequest request) {
		
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		
		service.insert(dto);
		
		return new ModelAndView("shop/upload");
	}
	
	@RequestMapping("/cart/list")
	public ModelAndView authGetList(HttpSession session, ModelAndView mview) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		String id=(String)session.getAttribute("id");
		List<CartDto> list=service.getList(id);
		int sumMoney=service.sumMoney(id);
		int fee=sumMoney >= 20000 ? 0 : 2000;
		
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("sum", sumMoney+fee);
		map.put("list", list);
		map.put("count", list.size());
		
		mview.setViewName("cart/list");
		mview.addObject("map", map);
		
		return mview;
	}
		
	@RequestMapping("/cart/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
			
		service.delete(num);
			
		return new ModelAndView("redirect:/inquiry/list.do");
	}
	


}
