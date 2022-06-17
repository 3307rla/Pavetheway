package com.pavetheway.myapp.shop.controller;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.shop.dto.ShopDto;
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
	
	//shop 상품 업로드 form 페이지로 이동
	@RequestMapping(value = "/shop/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("shop/upload_form");
	}
	
	//shop 상품 업로드 & DB 저장
	@RequestMapping(value = "/shop/upload")
	public ModelAndView authUpload(ShopDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : infoimagePath, MultipartFile image 를 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		
		return new ModelAndView("shop/upload");
	}
	
	//gallery 사진 업로드 form - ajax form
	@RequestMapping(value = "/shop/ajax_form")
	public ModelAndView authAjaxForm(HttpServletRequest request) {
		
		return new ModelAndView("shop/ajax_form");
	}

	//상품 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/shop/ajax_upload")
	@ResponseBody
	public Map<String, Object> authAjaxUpload(ShopDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/Shop/insert")
	public ModelAndView authInsert(ShopDto dto, HttpServletRequest request) {
		//dto : infoimagePath, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		
		return new ModelAndView("shop/upload");
	}
	
	//shop list 게시글의  num 이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/shop/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//shop detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("shop/detail");
		
		return mView;
	}
	
}
