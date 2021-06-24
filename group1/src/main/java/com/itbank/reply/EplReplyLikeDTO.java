package com.itbank.reply;

public class EplReplyLikeDTO {

//	create table EPLreplyLike(
//		    likeIdxRe number not null,
//		    likeId varchar2(50) not null,
//		    
//		    constraints EPLreplyLike_fk1
//		        FOREIGN key(likeIdxRe)
//		        references EPLreply(idxRe)
//		        on delete cascade,
//		        
//		    constraints EPLreplyLike_fk2
//		        FOREIGN key(likeId)
//		        references EPLMember(id)
//		        on delete cascade
//		        );

	int likeIdxRe;
	String likeId;
	
	
	public int getLikeIdxRe() {
		return likeIdxRe;
	}
	public void setLikeIdxRe(int likeIdxRe) {
		this.likeIdxRe = likeIdxRe;
	}
	public String getLikeId() {
		return likeId;
	}
	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}
	
}
