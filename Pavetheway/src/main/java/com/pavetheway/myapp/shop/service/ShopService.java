package com.pavetheway.myapp.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.dto.ShopDto;



public interface ShopService {
	//Shop_list의 list 가져오기
	public void getList(HttpServletRequest request);
    //detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView, int num);
	//Shop_list 에서 키워드를 활용한 상품 data 얻어오기
	public void getSearch(HttpServletRequest request);
    	
}
