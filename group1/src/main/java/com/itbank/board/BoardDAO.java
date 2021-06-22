package com.itbank.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface BoardDAO {

	
	@Select("select * from EPLBoard order by idxBo desc") //리스트(팀) 클릭시 리스트
	List<BoardDTO> selectAll();

	@Select("select * from EPLBoard where idxBo = #{idxBo} ") //READ 글 클릭시 읽기모드
	BoardDTO select(int idxBO);
	
	@Select("select * from EPLBoard order by viewCount desc") //조회수순으로 정렬 
	List<BoardDTO> selectView(); 
	
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

	@Select("select max(idxBo) from EPLBoard") //게시글 
	int selectMaxIdxBo();

	@Update("update EPLBoard set viewCount = viewCount + 1 where idxBo = #{idxBo}") // 조회수
	int updateViewCount(int idxBo);

	@Delete("delete from EPLBoard where idxBo = #{idxBo}") //삭제
	int delete(int idxBO);
	
	@Select("select * from EPLBoard where idxBo = #{idxBo}") //리드
	BoardDTO selectOne(int idxBO);

	@Update("update EPLBoard set title = #{title}, content=#{content},uploadFile='${uploadFile}' where idxBo=#{idxBo}")//수정
	int modify(BoardDTO dto);
	
	
	@Select("select * from EPLBoard where writer = #{writer} order by idxBo desc") 
	List<BoardDTO> selectWriter(String writer);

	@Select("select * from EPLBoard where ${type} like '%${search}%' order by idxBo desc") //검색
	List<BoardDTO> selectSearch(HashMap<String, String> param);


    @Update("update EPLBoard set likeCount = likeCount+1 where idxBo=#{idxBo}") //좋아요
	int likeUp(String idxBo);
    
    

//    @Update("update EPLBoard set likeCount = likeCount-1 where idxBo=#{idxBo}") //싫어요
//	int likedown(String idxBo);

    @Select("select * from EPLlike where boardidx = #{boardidx} and likemember = #{likemember} and likecheck = 0 ")
	int likeCheck(String likeCheck);
    
    @Update("update EPLBoard set likeidx =likeidx+1 and likecheck = 1 where boardidx=#{boardidx} and likemember = #{likemember}") 
   	int likeCheckUp(String idxBo);

    


	
}
