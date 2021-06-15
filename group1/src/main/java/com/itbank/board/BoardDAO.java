package com.itbank.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface BoardDAO {

	
	@Select("select * from EPLBoard order by idxBO desc") //리스트(팀) 클릭시 리스트
	List<BoardDTO> selectAll();

	@Select("select * from EPLBoard where idxBO = #{idxBO}") //READ 글 클릭시 읽기모드
	BoardDTO select(int idxBO);
	
	@Insert("insert into EPLBoard (idxBo, title, writer,content ,uploadFile) values "
			+"(board_seq.nextval, "
			+"#{title}, "
			+"#{writer}, "
			+"#{content}, "
			+"'${uploadFile}' )")//#{uploadFile}
	int insert(BoardDTO dto);
	
	@Insert("insert into EPLBoard (idxBo, title, writer,content ) values"
			+ "(board_seq.nextval, "
			+ "#{title}, "
			+ "#{writer}, "
			+ "#{content})")
	int withoutFileInsert(BoardDTO dto); //업로드파일이 없을경우

	@Select("select max(idxBo) from EPLBoard") 
	int selectMaxIdxBo();

	@Update("update EPLBoard set viewCount = viewCount + 1 where idxBO = #{idxBO}")
	int updateViewCount(int idxBO);

	@Delete("delete from EPLBoard where idxBO = #{idxBO}")
	int delete(int idxBO);
	
	

	
}
