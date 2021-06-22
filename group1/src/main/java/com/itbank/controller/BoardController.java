package com.itbank.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.itbank.board.BoardDTO;
import com.itbank.member.MemberDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("/") // 전체 글 목록
	public ModelAndView list(@RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView("/board/list");
		List<BoardDTO> list = bs.selectAll(param);
		mav.addObject("list",list);
		return mav;
	}
	
	@GetMapping("/mylist/{writer}") //내 글 목록
	public ModelAndView mylist(@PathVariable String writer) {
		ModelAndView mav = new ModelAndView("/board/mylist");
		List<BoardDTO> mylist = bs.selectWriter(writer);
		mav.addObject("mylist",mylist);
		return mav;
	}
	
//	@GetMapping(value="/{idxBo}", produces="application/json; charset=utf-8")//최신순 
//	public ModelAndView newNumber(@RequestParam HashMap<String, String> param) throws JsonProcessingException {
//		// 전달받은 userid를 이용하여 service -> dao 형식으로 객체를 하나 불러온다
//		ModelAndView mav = new ModelAndView("/board/list");
//		List<BoardDTO> list = bs.selectAll(param);
//		return mav;
//	}
	
//	@GetMapping(value="/{viewCount}", produces="application/json; charset=utf-8")//조회순
//	public ModelAndView viewNumber(@RequestParam HashMap<String, String> param) throws JsonProcessingException {
//		// 전달받은 userid를 이용하여 service -> dao 형식으로 객체를 하나 불러온다
//		ModelAndView mav = new ModelAndView("/board/list");
//		List<BoardDTO> list = bs.selectView(param);
//		return mav;
//	}
//	
	
	@GetMapping("/read/{idxBo}")
	public ModelAndView read(@PathVariable int idxBo,boolean vc,String type,String search) {
		
//		System.out.println("read controller : " + idxBo);
		
//		System.out.println("vc :" + vc);
		if(vc) { //조회수 안들어먹음 같은 아이디로 로그인시 조회수 막아야함
			bs.updateViewCount(idxBo);
			try {
				search = URLEncoder.encode(search, "UTF-8");	
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String location = "redirect:/board/read/" + idxBo + "?type=" + type + "&search=" + search;
//			System.out.println("location : " + location);
			return new ModelAndView(location);
		}
		
		BoardDTO dto = bs.select(idxBo);
		ModelAndView mav = new ModelAndView("board/read");
		mav.addObject("dto",dto);
//		System.err.println("content : " + dto.getContent());
//		System.out.println("uploadFile :"+ dto.getUploadFile());
		return mav;
	}
	
	@GetMapping("/write") //글쓰기
	public void write() {
	}
	
	@PostMapping("/write") //글쓰기
	public String write(BoardDTO dto) {//HttpSession session 
//		String writer = (String)session.getAttribute("nickName");
//		dto.setWriter(writer);
		
		int row = bs.insert(dto);
		int idxBo = bs.selectMaxIdxBo();
		System.out.println("writer"+dto.getWriter());
		
		if(row==1) {
			return "redirect:/board/read/" + idxBo;
		}else {
			return "redirect:/board/";
		
		}
		
	}
	
	@GetMapping("/delete") // 리스트페이지 EPL말고 뭐라고 해야할지 모르겠음 
	public ModelAndView delete(int idxBo)  throws Exception{
		ModelAndView mav = new ModelAndView("msg");
		int row = 0;
		row = bs.delete(idxBo);
		System.out.println("row="+row);
		mav.addObject("msg",row ==1 ? "게시글이 삭제되었습니다" : "게시글이 삭제되지않았습니다");
		mav.addObject("url", row == 1 ? "/EPL/board/" : "");
		System.out.println("mav-"+mav);
		return mav;
		
	}
	
	@GetMapping("/modify/{idxBo}") //글 수정
	public ModelAndView modify(@PathVariable int idxBo) {
		ModelAndView mav = new ModelAndView("board/modify");
		BoardDTO dto = bs.selectOne(idxBo);
		mav.addObject("dto",dto);
		return mav;
	}
	
	@PostMapping("/modify/{idxBo}") //글 수정
	public String modify(BoardDTO dto) {
		
		int row = bs.modify(dto);
		
		return "redirect:/board/read/" + dto.getIdxBo();
	}
	
	@PostMapping("/read/boardLike/{idxBo}/") //좋아요
	@ResponseBody
	public String likeboard(@PathVariable String idxBo) {
//		System.out.println("Like : " + idxBo);
		int row = bs.likeUp(idxBo);
//		System.out.println("controller Like : " + row);
		return Integer.toString(row);
	}
	
	
}