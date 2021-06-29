package com.itbank.club;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;

public interface ClubDAO {

	@Select("select * from club")
	List<ClubDTO> selectClubList();

	@Select("select * from EPLBoard where clubName='Liverpool' order by idxBo desc")
	List<BoardDTO> selectliv();

	@Select("select * from EPLBoard where clubName='Manchester United' order by idxBo desc")
	List<BoardDTO> selectMu();
	
	@Select("select * from EPLBoard where clubName='Manchester City' order by idxBo desc")
	List<BoardDTO> selectMc();
	
	@Select("select * from EPLBoard where clubName='Chelsea' order by idxBo desc")
	List<BoardDTO> selectChelsea();
	
	@Select("select * from EPLBoard where clubName='Arsenal' order by idxBo desc")
	List<BoardDTO> selectArsenal();
	
	@Select("select * from club where clubName= #{clubName}")
	ClubDTO selectFanClub(String club);

	@Select("select * from club where clubName= #{clubName}")
	ClubDTO setColor(String clubName);


	@Select("select * from club where clubName= #{mav}")
	ClubDTO setColormav(ModelAndView mav);

	@Select("select * from club where clubName=#{clubName}")
	ClubDTO selectColor(String clubName);
}
