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

	
	@RequestMapping(value = "/board/read/callRplMax", method = RequestMethod.GET)
	public List<EplReplyDTO> callRplMax(@RequestParam("idx") int idx,
			@RequestParam("likeId") String likeId,
			@RequestParam("replyMaxCnt") int replyMaxCnt
			) {
		return rs.callRplMax(idx, likeId, replyMaxCnt);
	}

	@PostMapping("/board/read/reply/{idx}")
	public String insertReply(EplReplyDTO dto) {
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

	@RequestMapping(value="/board/read/reply/LikeDo/", method = RequestMethod.POST, consumes="application/json; charset=utf-8")
	public int replyLikeDo(@RequestBody EplReplyLikeDTO dto) {
		return rs.replyLikeDo(dto);
	}
	
	@RequestMapping(value="/board/read/reply/LikeUndo/", method = RequestMethod.POST, consumes="application/json; charset=utf-8")
	public int replyLikeUndo(@RequestBody EplReplyLikeDTO dto) {
		return rs.replyLikeUndo(dto);
	}
	
}