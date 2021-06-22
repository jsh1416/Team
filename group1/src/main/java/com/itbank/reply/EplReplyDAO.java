package com.itbank.reply;

import java.util.List;



public interface EplReplyDAO {


	List<EplReplyDTO> replyList(int idx);

	int insertReply(EplReplyDTO dto);

	int deleteReply(int idx);
	
	int replyUpdate(EplReplyDTO dto);

	int updateReply(EplReplyDTO dto);


}
