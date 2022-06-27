package com.pavetheway.myapp.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.dto.OrderDto;
import com.pavetheway.myapp.shop.dto.ShopCommentDto;
import com.pavetheway.myapp.shop.dto.ShopDto;



public interface ShopService {
	//Shop_list의 list 가져오기
	public void getList(HttpServletRequest request);
	//Shop_list에 사진 upload & DB 저장하기
	public void saveImage(ShopDto dto, HttpServletRequest request);
	//Shop_list에 사진 저장하기 - ajax
	public Map<String, Object> uploadAjaxImage(ShopDto dto, HttpServletRequest request);
	//Shop_list에 사진 저장하기 - db에만 저장(upload 작업은 이미 완료)
	public void insert(ShopDto dto, HttpServletRequest request);
	//detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView, int num);
	//Shop_list 에서 키워드를 활용한 상품 data 얻어오기
	public void getSearch(HttpServletRequest request);
	public void saveComment(HttpServletRequest request);//댓글 저장 
	public void deleteComment(HttpServletRequest request);//댓글 삭제
	public void updateComment(ShopCommentDto dto);//댓글 수정
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능

	public List<OrderDto> getList(String id);
	public List<OrderDto> cartMoney();
	public void update(int num);
	//장바구니 상품 insert
	public void insert(OrderDto dto);
	//장바구니 상품 개별 delete
	public void delete(int num, HttpServletRequest request);
	//장바구니 상품 전체 delete
	public void deleteAll(String id);
	//장바구니 총 합계
	public int sumMoney(String id);
	//장바구니 상품 갯수
	public int countCart(String id, int code);
	//장바구니 수정
	public void updateCart(OrderDto dto);
	public void modifyCart(OrderDto dto);
	
	public List<OrderDto> getCartList(String id);
	
}

