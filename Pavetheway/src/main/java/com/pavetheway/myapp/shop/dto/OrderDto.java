package com.pavetheway.myapp.shop.dto;

public class OrderDto {
	private int num;//상품번호
	private String name;//상품명
	private int price;//가격
	private int remainCount;//재고 갯수
	private String id;//주문자 아이디
	private int onum;//주문 번호
    private int code; //상품코드
	private String addr; //배송 주소
	
	public OrderDto() {}

	public OrderDto(int num, String name, int price, int remainCount, String id, int onum, int code, String addr) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.remainCount = remainCount;
		this.id = id;
		this.onum = onum;
		this.code = code;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRemainCount() {
		return remainCount;
	}

	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
