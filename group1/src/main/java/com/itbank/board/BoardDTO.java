package com.itbank.board;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int idxBo,viewCount,likeCount;					// 게시글번호, 조회수, 추천수
	private String title,writer,content,wdate,uploadFile; 	// 제목 , 작성자 , 글내용 , 날짜 , 업로드파일 
	private MultipartFile file;
	private int likeidx,boardidx,likeCheck;
	private String likeMember;
	private String clubName;
	
	@Override
	public String toString() { //0615 파일 이름
		return String.format("%s, %s, %s, %s, %s, %s, %s, %s", 
				idxBo, title, writer, content, uploadFile, wdate, viewCount,likeCount );
	}
	
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
	public int getIdxBo() {
		return idxBo;
	}
	public void setIdxBO(int idxBo) {
		this.idxBo = idxBo;
	}

	public int getLikeidx() {
		return likeidx;
	}

	public void setLikeidx(int likeidx) {
		this.likeidx = likeidx;
	}

	public int getBoardidx() {
		return boardidx;
	}

	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	public String getLikeMember() {
		return likeMember;
	}

	public void setLikeMember(String likeMember) {
		this.likeMember = likeMember;
	}

	public void setIdxBo(int idxBo) {
		this.idxBo = idxBo;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	
}

