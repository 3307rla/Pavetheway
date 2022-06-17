package com.pavetheway.myapp.cart.dto;

public class CartDto {
	//필드
	private int num;
	private int code;
	private String id;
	public CartDto(int num, int code, String id) {
		super();
		this.num = num;
		this.code = code;
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
