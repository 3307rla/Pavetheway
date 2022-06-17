package com.pavetheway.myapp.shop.dto;

public class ReviewDto {
	private int num; //리뷰글번호
	private String writer; //댓글 작성자의 아이디
	private String title; //제목
	private String content; //글내용
	private String orgImgName; //원본 사진명
	private String saveImgName; //서버에 실제로 저장된 사진명
	private long fileSize; //파일의 크기
	private String regdate; //작성일
	
	public ReviewDto() {} //디폴트 생성자

	public ReviewDto(int num, String writer, String title, String content, String orgImgName, String saveImgName,
			long fileSize, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.orgImgName = orgImgName;
		this.saveImgName = saveImgName;
		this.fileSize = fileSize;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOrgImgName() {
		return orgImgName;
	}

	public void setOrgImgName(String orgImgName) {
		this.orgImgName = orgImgName;
	}

	public String getSaveImgName() {
		return saveImgName;
	}

	public void setSaveImgName(String saveImgName) {
		this.saveImgName = saveImgName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}			