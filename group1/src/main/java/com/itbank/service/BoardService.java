package com.itbank.service;

import java.io.File;
import java.io.IOException;
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
	
	public List<BoardDTO> selectAll() {
		return dao.selectAll();
	}

	public BoardDTO select(int idxBO) {
		return dao.select(idxBO);
	}

	public int insert(BoardDTO dto) {
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
			dto.setUploadFile(dto.getFile().getOriginalFilename());
			row = dao.insert(dto);
			
			dto.setUploadFile(fileName);
			
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

}
