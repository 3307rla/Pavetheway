package com.pavetheway.myapp.inquiry.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.inquiry.dto.InquiryDto;
import com.pavetheway.myapp.inquiry.service.InquiryService;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "inquiry/list";
	}
	
	@RequestMapping("/inquiry/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("inquiry/insertform");
	}
	
	@RequestMapping("/inquiry/insert")
	public ModelAndView authInsert(InquiryDto dto, HttpSession session, HttpServletRequest request) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//InquiryDto 객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("inquiry/insert");
	}
	
	@RequestMapping("/inquiry/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "inquiry/detail";
	}
	
	@RequestMapping("/inquiry/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/inquiry/list.do");
	}
}
