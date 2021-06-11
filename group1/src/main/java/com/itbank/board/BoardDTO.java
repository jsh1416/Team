package com.itbank.board;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int idxBO,viewCount,likeCount;					// 게시글번호, 조회수, 추천수
	private String title,writer,content,wdate,uploadFile; 	// 제목 , 작성자 , 글내용 , 날짜 , 업로드파일 
	private MultipartFile file;
	
	
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getIdxBO() {
		return idxBO;
	}
	public void setIdxBO(int idxBO) {
		this.idxBO = idxBO;
	}

	
}

