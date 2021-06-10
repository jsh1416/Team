package com.itbank.board;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface BoardDAO {

	@Select("select * from EPLBoard order by idxBO desc") //리스트(팀) 클릭시 리스트
	List<BoardDTO> selectAll();

	@Select("select * from EPLBoard where idxBO = #{idxBO}") //READ 글 클릭시 읽기모드
	BoardDTO select(int idxBO);

	@Insert("insert into EPLBoard values "
			+ "(board_seq.nextval, "
			+ "#{title}, "
			+ "#{writer}, "
			+ "#{viewCount},"
			+ "#{likeCount},"
			+ "#{content},"
			+ "to_char(sysdate, 'yyyy-MM-dd'))"
			)
	int insert(BoardDTO dto);

	
}
