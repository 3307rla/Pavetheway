package com.pavetheway.myapp.inquiry.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.inquiry.dto.InquiryCommentDto;
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
	
	//새로운 댓글 저장 요청 처리
	@RequestMapping("/inquiry/comment_insert")
	public ModelAndView authCommentInsert(HttpServletRequest request, 
			@RequestParam int ref_group) {
		
		service.saveComment(request);
	
		return new ModelAndView("redirect:/inquiry/detail.do?num="+ref_group);
	}
	
	//댓글 더보기 요청 처리
	@RequestMapping("/inquiry/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {
		
		service.moreCommentList(request);
		
		return "inquiry/ajax_comment_list";
	}
	//댓글 삭제 요청 처리
	@RequestMapping("/inquiry/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	
	//댓글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/inquiry/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(InquiryCommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}	
	
}
