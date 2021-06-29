package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.club.ClubDAO;
import com.itbank.club.ClubDTO;

@Service
public class ClubService {

	@Autowired ClubDAO clubDAO;
	
	public List<ClubDTO> selectClubList() {
		return clubDAO.selectClubList();
	}

	public List<BoardDTO> selectliv() {
		return clubDAO.selectliv();
	}

	public List<BoardDTO> selectMu() {
		return clubDAO.selectMu();
	}
	
	public List<BoardDTO> selectMc() {
		return clubDAO.selectMc();
	}
	
	public List<BoardDTO> selectChelsea() {
		return clubDAO.selectChelsea();
	}
	
	public List<BoardDTO> selectArsenal() {
		return clubDAO.selectArsenal();
	}

	public ClubDTO selectFanClub(String club) {
		return clubDAO.selectFanClub(club);
	}

	public ClubDTO selectColor(String clubName) {
		return clubDAO.selectColor(clubName);
	}

}
