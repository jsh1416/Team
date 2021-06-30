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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.board.BoardDTO;
import com.itbank.board.BoardHateDTO;
import com.itbank.board.BoardLikeDTO;
import com.itbank.club.ClubDTO;
import com.itbank.member.MemberDTO;
import com.itbank.reply.EplReplyLikeDTO;
import com.itbank.service.BoardService;
import com.itbank.service.ClubService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	@Autowired private ClubService clubService;
	
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
	public ModelAndView read(@PathVariable int idxBo,boolean vc,String type,String search, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
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
		String clubName = dto.getClubName();
		ModelAndView mav = new ModelAndView("board/read");
		mav.addObject("dto",dto);
		List<ClubDTO> clubList = clubService.selectClubList();
		
		
		ClubDTO selectedClub = bs.clubColor(clubName);
		
		mav.addObject("clubColor", selectedClub.getClubColor());
		mav.addObject("clubList", clubList);
		return mav;
	}
	
	@GetMapping("/write") //글쓰기
	public ModelAndView write(HttpSession session) {
		
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String clubName = login.getClub();
		ModelAndView mav = new ModelAndView("board/write");
		
		ClubDTO selectedClub = bs.clubColor(clubName);
		
		mav.addObject("clubColor", selectedClub.getClubColor());
		return mav;
	}
	
	@PostMapping("/write") //글쓰기
	public String write(BoardDTO dto) throws Exception {//HttpSession session 
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
		mav.addObject("msg",row ==1 ? "게시글이 삭제되었습니다" : "게시글이 삭제되지않았습니다");
		mav.addObject("url", row == 1 ? "/EPL/board/" : "");
		return mav;
		
	}
	
	@GetMapping("/modify/{idxBo}") //글 수정
	public ModelAndView modify(@PathVariable int idxBo ,HttpSession session) {
		ModelAndView mav = new ModelAndView("board/modify");
		BoardDTO dto = bs.selectOne(idxBo);
		mav.addObject("dto",dto);
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String clubName = login.getClub();
		ClubDTO selectedClub = bs.clubColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());
		
		System.out.println("dto.content"+dto.getContent());
		
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
		int row = 0;
		int row2 = 0 ;
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		
		
		BoardLikeDTO boardLike = new BoardLikeDTO();
		boardLike.setBoardIdx(Integer.parseInt(idxBo));
		boardLike.setLikeMember(login.getNickName());
		
		BoardLikeDTO Ldto = bs.selectLikeMember(boardLike);
		
		BoardHateDTO boardHate = new BoardHateDTO();
		boardHate.setBoardIdx(Integer.parseInt(idxBo));
		boardHate.setHateMember(login.getNickName());
		
		BoardHateDTO Hdto = bs.selectHateMember(boardHate);
		
		if(Ldto == null && Hdto == null) {
			row2= bs.likeInsert(boardLike); // 인설트를 했을때
			
			if(row2 !=0) {
				row = bs.likeUp(idxBo);
			}
			
			}
			else {
				System.out.println("이미 추천을 누르셨습니다");
			}
		
		return row;
		
	}
	
	@PostMapping("/read/boardHate/{idxBo}/") //좋아요
	@ResponseBody   //버튼을 누르면 로그인 닉네임과 게시글 번호를 받은뒤 
	public int hateboard(@PathVariable String idxBo ,HttpSession session) {
		int row = 0;
		int row2 = 0;
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		
		BoardLikeDTO boardLike = new BoardLikeDTO();
		boardLike.setBoardIdx(Integer.parseInt(idxBo));
		boardLike.setLikeMember(login.getNickName());
		
		BoardLikeDTO Ldto = bs.selectLikeMember(boardLike);
		
		BoardHateDTO boardHate = new BoardHateDTO();
		boardHate.setBoardIdx(Integer.parseInt(idxBo));
		boardHate.setHateMember(login.getNickName());
		
		BoardHateDTO Hdto = bs.selectHateMember(boardHate); //셀렉트로 찾은다음
		
		if(Hdto == null && Ldto == null) {
			row2= bs.hateInsert(boardHate); // 인설트를 했을때
			}
			if(row2 !=0) {
				row=bs.likeDown(idxBo);
			}
		
		return row;
		
	}
	
	
	
	
	
}