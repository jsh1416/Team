package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.reply.EplReplyDAO;
import com.itbank.reply.EplReplyDTO;
import com.itbank.reply.EplReplyLikeDTO;


@Service
public class ReplyService {

	@Autowired private EplReplyDAO ERdao;

	public List<EplReplyDTO> replyList(int idx, String likeId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("likeId", likeId);
		return ERdao.replyList(map);
	}

	public List<EplReplyDTO> callRplMax(int idx, String likeId, int replyMaxCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("likeId", likeId);
		map.put("replyMaxCnt", replyMaxCnt);
		map.put("listCnt", "1");
		return ERdao.replyList(map);
	}
	
	public int insertReply(EplReplyDTO dto) {
		// TODO Auto-generated method stub
		return ERdao.insertReply(dto);
	}

	public int deleteReply(int idx) {
		// TODO Auto-generated method stub
		return ERdao.deleteReply(idx);
	}



	public int replyUpdate(EplReplyDTO dto) {
		return ERdao.replyUpdate(dto);
	}

	public int updateReply(EplReplyDTO dto) {
		// TODO Auto-generated method stub
		return ERdao.updateReply(dto);
	}

	public int replyLikeDo(EplReplyLikeDTO dto) {
		// TODO Auto-generated method stub
		return ERdao.replyLikeDo(dto);
	}

	public int replyLikeUndo(EplReplyLikeDTO dto) {
		// TODO Auto-generated method stub
		return ERdao.replyLikeUndo(dto);
	}


}
