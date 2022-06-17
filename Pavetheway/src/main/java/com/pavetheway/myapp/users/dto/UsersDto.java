package com.pavetheway.myapp.users.dto;

public class UsersDto {
	//필드
	private String id;
	private String pwd;
	private String email;
	private String addr;
	private String regdate;
	private String newPwd;
	
	//디폴트 생성자 
	public UsersDto() {}

	public UsersDto(String id, String pwd, String email, String addr, String regdate, String newPwd) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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
