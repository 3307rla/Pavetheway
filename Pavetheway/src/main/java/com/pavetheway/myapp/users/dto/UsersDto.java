package com.pavetheway.myapp.users.dto;

public class UsersDto {
	//필드
	private String id;
	private String pwd;
	private String email;
	private String postcode;
	private String roadAddr;
	private String detailAddr;
	private String extraAddr;
	private String regdate;
	private String newPwd;
	
	//디폴트 생성자 
	public UsersDto() {}

	public UsersDto(String id, String pwd, String email, String postcode, String roadAddr, String detailAddr,
			String extraAddr, String regdate, String newPwd) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.postcode = postcode;
		this.roadAddr = roadAddr;
		this.detailAddr = detailAddr;
		this.extraAddr = extraAddr;
		this.regdate = regdate;
		this.newPwd = newPwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getExtraAddr() {
		return extraAddr;
	}

	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

}