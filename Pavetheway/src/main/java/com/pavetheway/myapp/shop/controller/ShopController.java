package com.pavetheway.myapp.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.service.ShopService;

@Controller
public class ShopController {
    
	@Autowired
	private ShopService service;
	
	//shop list 페이지로 이동
	@RequestMapping(value = "/shop/list")
	public String getList(HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		
		return "shop/list";
	}
	
	//shop list 게시글의  num 이 parameter get 방식으로 넘어온다.
	//info 페이지
	@RequestMapping(value = "/shop/info", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//shop info 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("shop/info");
		
		return mView;
	}
	
}
