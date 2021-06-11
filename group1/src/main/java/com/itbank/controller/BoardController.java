package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/board/list");
		List<BoardDTO> list = bs.selectAll();
		mav.addObject("list",list);
		return mav;
	}
	
	@GetMapping("/read/{idxBO}")
	public ModelAndView read(@PathVariable int idxBO) {
		ModelAndView mav = new ModelAndView("board/read");
		BoardDTO dto = bs.select(idxBO);
		mav.addObject("dto",dto);
		return mav;
	}
	
	@GetMapping("/write")
	public void write() {
		System.out.println("write GET");
	}
	
	@PostMapping("/write")
	public String write(BoardDTO dto) {//HttpSession session 
//		String writer = (String)session.getAttribute("nickName");
//		dto.setWriter(writer);
		System.out.println("write Post");
		
		dto.toString();
		
		System.out.println("writer : " + dto.getWriter());
		
		int row = bs.insert(dto);
		int idxBo = bs.selectMaxIdxBo();
		
		
		if(row==1) {
			return "redirect:/board/read/" + idxBo;
		}else {
			return "redirect:/board/";
		
		}
		
	}
}