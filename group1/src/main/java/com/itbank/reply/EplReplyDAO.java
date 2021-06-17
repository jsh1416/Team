package com.itbank.reply;

import java.util.List;



public interface EplReplyDAO {


	List<EplReplyDTO> replyList(int idx);

	int insertReply(EplReplyDTO dto);


}
