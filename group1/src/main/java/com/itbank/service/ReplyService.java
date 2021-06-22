package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.reply.EplReplyDAO;
import com.itbank.reply.EplReplyDTO;


@Service
public class ReplyService {

	@Autowired private EplReplyDAO ERdao;

	public List<EplReplyDTO> replyList(int idx) {
		// TODO Auto-generated method stub
		return ERdao.replyList(idx);
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
	

}
