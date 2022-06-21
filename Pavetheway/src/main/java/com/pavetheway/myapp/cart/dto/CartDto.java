package com.pavetheway.myapp.cart.dto;

public class CartDto {
	//필드
	private int num; //장바구니 번호
	private String id; //사용자 아이디
	private String name; //상품이름
	private int code; //상품번호
	private int price;
	private int money;
	private int amount;
	
	public CartDto(int num, String id, String name, int code, int price, int money, int amount) {
		super();
		this.num = num;
		this.id = id;
		this.name = name; //상품이름
		this.code = code;
		this.price = price;
		this.money = money;
		this.amount = amount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
		
}
