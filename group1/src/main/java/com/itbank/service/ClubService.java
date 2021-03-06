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
	
	public List<BoardDTO> selectTottenham() {
		return clubDAO.selectTottenham();
	}

	public ClubDTO selectFanClub(String club) {
		return clubDAO.selectFanClub(club);
	}

	public ClubDTO selectColor(String clubName) {
		return clubDAO.selectColor(clubName);
	}
	
	// 0629 bcg
	public List<Integer> selectWinPoint(String seasonArr) {
		return clubDAO.selectWinPoint(seasonArr);
	}

	public List<String> selectClubNameList() {
		// TODO Auto-generated method stub
		return clubDAO.selectClubNameList();
	}

	// 0630 bcg
	public int selectLivMemberNum() {
		return clubDAO.selectLivMemberNum();
	}

	public int selectMuMemberNum() {
		// TODO Auto-generated method stub
		return clubDAO.selectMuMemberNum();
	}

	public int selectMcMemberNum() {
		// TODO Auto-generated method stub
		return clubDAO.selectMcMemberNum();
	}

	public int selectCheMemberNum() {
		// TODO Auto-generated method stub
		return clubDAO.selectCheMemberNum();
	}

	public int selectTtoMemberNum() {
		// TODO Auto-generated method stub
		return clubDAO.selectTtoMemberNum();
	}
	
	public int selectArsMemberNum() {
		// TODO Auto-generated method stub
		return clubDAO.selectArsMemberNum();
	}

	public int selectTotalMember() {
		// TODO Auto-generated method stub
		return clubDAO.selectTotalMember();
	}
	
	
	//0701 ksj
	public List<BoardDTO> selectNew(String clubName) {
		return clubDAO.selectNew(clubName);
	}

	public List<BoardDTO> selectlike(String clubName) {
		
		return clubDAO.selectlike(clubName);
	}

	public List<BoardDTO> selectview(String clubName) {
		return clubDAO.selectview(clubName);
	}

}
