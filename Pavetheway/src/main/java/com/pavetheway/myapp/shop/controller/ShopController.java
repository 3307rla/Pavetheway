package com.pavetheway.myapp.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.cart.dto.CartDto;
import com.pavetheway.myapp.inquiry.dto.InquiryCommentDto;
import com.pavetheway.myapp.shop.dto.OrderDto;
import com.pavetheway.myapp.shop.dto.ShopCommentDto;
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
	@RequestMapping(value = "/shop/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//shop info 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("shop/detail");
		
		return mView;
	}
	
	//새로운 댓글 저장 요청 처리
	@RequestMapping("/shop/comment_insert")
	public ModelAndView authCommentInsert(HttpServletRequest request, 
			@RequestParam int ref_group) {
		
		service.saveComment(request);
	
		return new ModelAndView("redirect:/shop/detail.do?num="+ref_group);
	}
	
	//댓글 더보기 요청 처리
	@RequestMapping("/shop/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {
		
		service.moreCommentList(request);
		
		return "shop/ajax_comment_list";
	}
	//댓글 삭제 요청 처리
	@RequestMapping("/shop/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	
	//댓글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/shop/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(ShopCommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	
	@RequestMapping("/order/insert")
	public ModelAndView authInsert(OrderDto dto, HttpSession session, HttpServletRequest request) {
		
		String id=(String)session.getAttribute("id");		
	
		dto.setId(id);
		
		service.insert(dto);		
		return new ModelAndView("redirect:/order/list.do");
	}
	
	@RequestMapping("/order/list")
	public ModelAndView authGetList(HttpSession session, ModelAndView mview) {
	      
	    Map<String, Object> map=new HashMap<String, Object>();
	    String id=(String)session.getAttribute("id");
	    List<OrderDto> list=service.getList(id);
	    int sumMoney=service.sumMoney(id);
	    int fee=sumMoney >= 50000 ? 0 : 5000;
	      
	    map.put("sumMoney", sumMoney);
	    map.put("fee", fee);
	    map.put("sum", sumMoney+fee);
	    map.put("list", list);
	    map.put("count", list.size());
	      
	    mview.setViewName("order/list");  
	    mview.addObject("map", map);
	      
	    return mview;
	}
	
}
