package com.itbank.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.reply.EplReplyDTO;
import com.itbank.reply.EplReplyLikeDTO;
import com.itbank.service.ReplyService;

@RestController
public class RestBoardController {

	@Autowired private ReplyService rs;

	@RequestMapping(value = "/board/read/replyList", method = RequestMethod.GET)
	public List<EplReplyDTO> replyList(@RequestParam("idx") int idx,
										@RequestParam("likeId") String likeId) {
		return rs.replyList(idx, likeId);
	}

	@PostMapping("/board/read/{idx}")
	public String insertReply(EplReplyDTO dto) {
		System.out.println(dto);
		System.out.println(dto.getContent());
		int row = rs.insertReply(dto);
		return row + "";
	}
	
	
	@DeleteMapping("/board/read/replyDelete/{idx}")
	public int deleteReply(@PathVariable int idx) {
		return rs.deleteReply(idx);
	}
	
	@PutMapping(value="/board/read/updateReply/", consumes="application/json; charset=utf-8")
	public int updateReply(@RequestBody EplReplyDTO dto) {
		return rs.updateReply(dto);
	}

	@RequestMapping(value="/board/read/replyLikeDo/", method = RequestMethod.POST, consumes="application/json; charset=utf-8")
	public int replyLikeDo(@RequestBody EplReplyLikeDTO dto) {
		return rs.replyLikeDo(dto);
	}
	
	@RequestMapping(value="/board/read/replyLikeUndo/", method = RequestMethod.POST, consumes="application/json; charset=utf-8")
	public int replyLikeUndo(@RequestBody EplReplyLikeDTO dto) {
		return rs.replyLikeUndo(dto);
	}
	
}