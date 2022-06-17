package com.pavetheway.myapp.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ShopDto {
	private int num;//번호
	private int code;//상품번호
	private String name;//상품이름
	private int price;//상품가격
	private String category;//분류
	private String imagePath;//업로드 된 이미지 경로
	private String infoImagePath;//이미지 정보
	private int remainCount;//재고 갯수
	private String id;//주문자 아이디
	private String addr; //배송 주소
	private int startRowNum;//맨처음 글번호
	private int endRowNum;//맨끝 글번호
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	private MultipartFile image;//이미지 파일 업로드 처리를 위한 필드
	
	public ShopDto() {} //디폴트 생성자

	public ShopDto(int num, int code, String name, int price, String category, String imagePath, String infoImagePath,
			int remainCount, String id, String addr, int startRowNum, int endRowNum, int prevNum, int nextNum,
			MultipartFile image) {
		super();
		this.num = num;
		this.code = code;
		this.name = name;
		this.price = price;
		this.category = category;
		this.imagePath = imagePath;
		this.infoImagePath = infoImagePath;
		this.remainCount = remainCount;
		this.id = id;
		this.addr = addr;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.image = image;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getInfoImagePath() {
		return infoImagePath;
	}

	public void setInfoImagePath(String infoImagePath) {
		this.infoImagePath = infoImagePath;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	

	
}
