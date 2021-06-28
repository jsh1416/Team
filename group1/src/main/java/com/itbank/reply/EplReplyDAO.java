package com.itbank.reply;

import java.util.HashMap;
import java.util.List;



public interface EplReplyDAO {


	
	int insertReply(EplReplyDTO dto);

	int deleteReply(int idx);
	
	int replyUpdate(EplReplyDTO dto);

	int updateReply(EplReplyDTO dto);

	int replyLikeDo(EplReplyLikeDTO dto);

	List<EplReplyDTO> replyList(HashMap<String, Object> map);

	int replyLikeUndo(EplReplyLikeDTO dto);

	List<EplReplyDTO> callRplMax(HashMap<String, Object> map);


}
