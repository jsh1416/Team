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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.board.BoardDTO;
import com.itbank.board.BoardLikeDTO;
import com.itbank.member.MemberDTO;
import com.itbank.reply.EplReplyLikeDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	
	private ObjectMapper mapper = new ObjectMapper();
	
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
	
	@ResponseBody
	@GetMapping(value="/orderByNew/", produces="application/json; charset=utf-8")//최신순 
	public String newNumber(@RequestParam HashMap<String, String> param) throws JsonProcessingException {
		List<BoardDTO> list = bs.selectNew();
		System.out.println("view LIst  : " + list.size());
		System.out.println("컨트롤러진입");
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	
	@ResponseBody //ajax는 이거 붙여야함
	@GetMapping(value="/orderByView/" ,produces="application/json; charset=utf-8")//조회순
	public String viewNumber(@RequestParam HashMap<String, String> param) throws JsonProcessingException {
		List<BoardDTO> list = bs.selectView();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@ResponseBody
	@GetMapping(value="/orderByLike/" ,produces = "application/json; charset=utf-8")//좋아요순
	public String likeNumber(@RequestParam HashMap<String, String> param) throws JsonProcessingException {
		List<BoardDTO> list = bs.selectLike();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping("/read/{idxBo}")
	public ModelAndView read(@PathVariable int idxBo,boolean vc,String type,String search) {
		
		if(vc) { //조회수 
			bs.updateViewCount(idxBo);
			try {
				search = URLEncoder.encode(search, "UTF-8");	
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String location = "redirect:/board/read/" + idxBo + "?type=" + type + "&search=" + search;
			return new ModelAndView(location);
		}
		BoardDTO dto = bs.select(idxBo);
		ModelAndView mav = new ModelAndView("board/read");
		mav.addObject("dto",dto);
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
	@ResponseBody   //버튼을 누르면 로그인 닉네임과 게시글 번호를 받은뒤 
	public int likeboard(@PathVariable String idxBo ,HttpSession session) {
		System.out.println("idx : " +idxBo);
		int row = 0;
		int row2 = 0 ;
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		System.out.println("login : " + login.getNickName());
		
		
		BoardLikeDTO boardLike = new BoardLikeDTO();
		boardLike.setBoardIdx(Integer.parseInt(idxBo));
		boardLike.setLikeMember(login.getNickName());
		
		BoardLikeDTO Ldto = bs.selectLikeMember(boardLike);
		
		if(Ldto == null) {
			System.out.println("Ldto : " + Ldto);
			row2= bs.likeInsert(boardLike); // 인설트를 했을때
			System.out.println("row2 : " + row2);
			
			if(row2 !=0) {
				row = bs.likeUp(idxBo);
				System.out.println("row : " + row);
			}
			
			}
			else {
				row2=bs.likeDelete(Ldto);
				row=bs.likeDown(idxBo);
			}
		
		return row;
		
	}
	
}