package com.itbank.club;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ClubDAO {

	@Select("select * from club")
	List<ClubDTO> selectClubList();

}
