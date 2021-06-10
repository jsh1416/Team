package com.itbank.controller;

import java.util.List;

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
		
	}
	
	@PostMapping("/write")
	public String write(BoardDTO dto) {
		int row = bs.insert(dto);
		return "redirect:/board/";
	}
}