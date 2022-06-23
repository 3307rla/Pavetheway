package com.pavetheway.myapp.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {
	private int num; //리뷰글번호
	private String writer; //댓글 작성자의 아이디
	private String title; //제목
	private String content; //글내용
	private String orgImgName; //원본 사진명
	private String saveImgName; //서버에 실제로 저장된 사진명
	private long fileSize; //파일의 크기
	private String regdate; //작성일
	private int startRowNum;//맨처음 글번호
	private int endRowNum;//맨끝 글번호
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	private MultipartFile image;//이미지 파일 업로드 처리를 위한 필드
	
	public ReviewDto() {} //디폴트 생성자

	public ReviewDto(int num, String writer, String title, String content, String orgImgName, String saveImgName,
			long fileSize, String regdate, int startRowNum, int endRowNum, int prevNum, int nextNum,
			MultipartFile image) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.orgImgName = orgImgName;
		this.saveImgName = saveImgName;
		this.fileSize = fileSize;
		this.regdate = regdate;
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