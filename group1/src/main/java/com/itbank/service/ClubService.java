package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.club.ClubDAO;
import com.itbank.club.ClubDTO;

@Service
public class ClubService {

	@Autowired ClubDAO clubDAO;
	
	public List<ClubDTO> selectClubList() {
		return clubDAO.selectClubList();
	}

}
