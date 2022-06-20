package com.pavetheway.myapp.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.dto.ReviewDto;
import com.pavetheway.myapp.shop.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping("/shop/reviewlist")
	public String list(HttpServletRequest request) {
		
		service.getList(request);
		
		return "shop/reviewlist";
	}
	
	@RequestMapping("/shop/ajax_rupload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("shop/ajax_rupload_form");
	}
	
	//파일 업로드 요청처리
	@RequestMapping("/shop/ajax_rupload")
	public ModelAndView authUpload(ReviewDto dto, ModelAndView mView,
			HttpServletRequest request) {
		
		service.saveFile(dto, mView, request);
		mView.setViewName("shop/ajax_rupload");
		
		return mView;
	}
	
	//파일 삭제 요청 처리
	@RequestMapping("/shop/ajax_rdelete")
	public ModelAndView authDelete(@RequestParam int num,
			ModelAndView mView, HttpServletRequest request) {
		
		service.deleteFile(num, request);
		
		mView.setViewName("redirect:/shop/reviewlist.do");
			return mView;
		
	}

}
