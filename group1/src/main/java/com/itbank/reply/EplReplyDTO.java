package com.itbank.reply;

public class EplReplyDTO {

//	create table EPLreply(
//			idxRe          number	     primary key,
//			content			varchar2(1000)	not null,
//			writer          varchar2(50)	not null,
//			idxBo          number          not null,
//			wdate			varchar2(50)	default to_char(sysdate, 'yyyy-MM-dd hh24:mi'),
//			likeCount		number		    default 0,
//		    idxParent       number          default 0,
//
//			  constraints EPLreply_fk1 
//			        FOREIGN key(writer) 
//			        references EPLMember(id) 
//			        on delete cascade,
//			    
//			    constraints EPLreply_fk2 
//			    FOREIGN key(idxBO) 
//			    references EPLBoard(idxBO) 
//			    on delete cascade     
//			    );
	
	int idxRe, idxBo, idxParent, likeCount, replyCount, replyCheck;
	String content, writer, wdate, nickName;
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
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getReplyCheck() {
		return replyCheck;
	}
	public void setReplyCheck(int replyCheck) {
		this.replyCheck = replyCheck;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	
	
	
	
}
