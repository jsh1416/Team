package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;
import com.itbank.member.MemberDTO;

@Service
public class BoardService {

	@Autowired private BoardDAO dao;

	private final String uploadPath = "C:\\upload";
	
	public List<BoardDTO> selectAll(HashMap<String, String> param) { // 전체 검색
		boolean flag1 = false, flag2 = false;
		if(param != null) {
			flag1 = param.size() == 2;
//			flag2 = param.get("search").equals("") == false;
		}
		return (flag1 && param.get("search").equals("") == false) ? dao.selectSearch(param) : dao.selectAll();
	}
	public List<BoardDTO> selectView(HashMap<String, String> param) {
		return dao.selectView();
	}

	public BoardDTO select(int idxBo) { // 글 읽기
		return dao.select(idxBo);
	}

	public int insert(BoardDTO dto) { // 글 삽입
		int row = 0;
		
		if(dto.getFile().getOriginalFilename().equals("") == false) {
			
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");
			int beginIndex = dto.getFile().getOriginalFilename().indexOf(".");
			String extName = dto.getFile().getOriginalFilename().substring(beginIndex);
			fileName += extName;
			
			File f = new File(uploadPath, fileName);
			
			try {
				dto.getFile().transferTo(f);
				
			} catch (IllegalStateException | IOException e) {
				System.out.println("업로드 문제 발생 : " + e);
			}
//			dto.setUploadFile(dto.getFile().getOriginalFilename());
			dto.setUploadFile(fileName);
			row = dao.insert(dto);
			
		}else {
			row = dao.insert(dto);
		}
		
		if(row != 0) {
			
		}
		
		return row;
	}
	
	public int selectMaxIdxBo() { 
		System.out.println("select Max IDX " + dao.selectMaxIdxBo());
		return dao.selectMaxIdxBo();
	}

	public int updateViewCount(int idxBo) {
		return dao.updateViewCount(idxBo);
	}

	public int delete(int idxBo) throws Exception{
		
		int row = dao.delete(idxBo);
		return row;
	}

	
	public BoardDTO selectOne(int idxBo) {
		return dao.selectOne(idxBo);
	}

	public int modify(BoardDTO dto) {
		
		int row = 0;
		
		if(dto.getFile().getOriginalFilename().equals("") == false) {
			
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");
			int beginIndex = dto.getFile().getOriginalFilename().indexOf(".");
			String extName = dto.getFile().getOriginalFilename().substring(beginIndex);
			fileName += extName;
			
			File f = new File(uploadPath, fileName);
			
			try {
				dto.getFile().transferTo(f);
				
			} catch (IllegalStateException | IOException e) {
				System.out.println("업로드 문제 발생 : " + e);
			}
			dto.setUploadFile(fileName);
		}
		
		else {
		row = dao.modify(dto);
		}
		
		if(row != 0) {
		
		}
	
		
		return row;
}


	public List<BoardDTO> selectWriter(String writer) { // 내 글목록
		return dao.selectWriter(writer);
	}

	public int likeUp(String idxBo) {
		
		
		int row = dao.likeUp(idxBo);
		
		System.out.println("row : " + row);
		
		return row;
	}

	

//	public int likedown(String idxBo) {
//	int row = dao.likedown(idxBo);
//	
//	System.out.println("row : " + row);
//	
//	return row;
//}
//
//public int likecheck(String likeCheck) {
//	
//	int row1= dao.likeCheck(likeCheck);
//	if(row1==0) {
//		likeUp(likeCheck);
//	}
//	else {
//		
//	}
//	
//	return row1;
//		
//}
//	

	
	
}