package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;

@Service
public class BoardService {

	@Autowired private BoardDAO dao;

	private final String uploadPath = "D:\\upload";
	
	public List<BoardDTO> selectAll() {
		return dao.selectAll();
	}

	public BoardDTO select(int idxBO) {
		return dao.select(idxBO);
	}

	public int insert(BoardDTO dto) {
		dto.setUploadFile("default.jsp"); 
		
		if(dto.getFile().getOriginalFilename().equals("")==false) {
			
			File target = new File(uploadPath, dto.getFile().getOriginalFilename());
			File dir = new File(uploadPath);
			dir.mkdirs();
			
			try {
				dto.getFile().transferTo(target);
			} catch (IllegalStateException |IOException e) {
				e.printStackTrace();
			}
			dto.setUploadFile(dto.getFile().getOriginalFilename());
			
		}
		
		return dao.insert(dto);
	}

}
