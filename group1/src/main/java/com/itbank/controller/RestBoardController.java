package com.itbank.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.reply.EplReplyDTO;
import com.itbank.service.ReplyService;

@RestController
public class RestBoardController {

	@Autowired private ReplyService rs;

	@RequestMapping(value = "/board/read/replyList", method = RequestMethod.GET)
	public List<EplReplyDTO> replyList(@RequestParam("idx") int idx) throws Exception {
		return rs.replyList(idx);
	}
	@RequestMapping(value = "/board/read/replyWrite", method = RequestMethod.POST)
	public String insertReply(EplReplyDTO dto) {
		int row = rs.insertReply(dto);
		return row + "";
	}
	
//	@RequestMapping(value = "/board/read/{idxBo}", method = RequestMethod.POST)
//	public Map<String, Object> insertReply(EplReplyDTO dto) throws Exception {
//		Map<String, Object> result = new HashMap<>();
//		try {
//			rs.insertReply(dto);
//			result.put("status", "OK");
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.put("status", "False");
//		}
//		return result;
//	}


}