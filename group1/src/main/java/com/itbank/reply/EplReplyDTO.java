package com.itbank.reply;

public class EplReplyDTO {

//	create table EPLreply(
//			idxRe          number	     primary key,
//			content			varchar2(1000)	not null,
//			writer          varchar2(50)	not null,
//			idxBo          number          not null,
//			wdate			varchar2(50)	default to_char(sysdate, 'yyyy-MM-dd hh24:mi'),
//			likeCount		number		    default 0,
//		    idxParent       number          default 0
//		    );
	
	int idxRe, idxBo, idxParent, likeCount;
	String content, writer, wdate;
	

	public int getIdxRe() {
		return idxRe;
	}
	public void setIdxRe(int idxRe) {
		this.idxRe = idxRe;
	}
	public int getIdxBo() {
		return idxBo;
	}
	public void setIdxBo(int idxBo) {
		this.idxBo = idxBo;
	}
	public int getIdxParent() {
		return idxParent;
	}
	public void setIdxParent(int idxParent) {
		this.idxParent = idxParent;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
}
