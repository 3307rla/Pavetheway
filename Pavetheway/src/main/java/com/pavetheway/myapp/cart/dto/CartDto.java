package com.pavetheway.myapp.cart.dto;

public class CartDto {
	//필드
	private int num;
	private String id;
	private String name;
	private int code;
	private String productName;
	private int price;
	private int money;
	private int amount;
	
	public CartDto(int num, String id, String name, int code, String productName, int price, int money, int amount) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.code = code;
		this.productName = productName;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
