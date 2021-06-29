package com.itbank.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.club.ClubDTO;

public interface BoardDAO {

	
	@Select("select * from EPLBoard order by idxBo desc")
	List<BoardDTO> selectAll();

	@Select("select * from EPLBoard where idxBo = #{idxBo} ") //READ 글 클릭시 읽기모드
	BoardDTO select(int idxBO);
	
	@Select("select * from EPLBoard order by viewCount desc") //조회수순으로 정렬 
	List<BoardDTO> selectView(); 
	
	@Select("select * from EPLBoard where clubName='Liverpool' order by idxBo desc")//리버풀 페이지
	List<BoardDTO> selectLiv();
	
	@Select("select * from EPLBoard where clubName='Manchester United' order by idxBo desc")
	List<BoardDTO> selectMu();
	
	@Select("select * from EPLBoard where clubName='Manchester City' order by idxBo desc")
	List<BoardDTO> selectMc();
	
	@Select("select * from EPLBoard where clubName='Chelsea' order by idxBo desc")
	List<BoardDTO> selectChelsea();
	
	@Select("select * from EPLBoard where clubName='Arsenal' order by idxBo desc")
	List<BoardDTO> selectArsenal();
	
	@Insert("insert into EPLBoard (idxBo, title, writer,content,clubName ,uploadFile) values "
			+"(board_seq.nextval, "
			+"#{title}, "
			+"#{writer}, "
			+"#{content}, "
			+"#{clubName}, "
			+"'${uploadFile}' )")//#{uploadFile}
	int insert(BoardDTO dto);
	
	@Insert("insert into EPLBoard (idxBo, title, writer,content,clubName ) values"
			+ "(board_seq.nextval, "
			+ "#{title}, "
			+ "#{writer}, "
			+ "#{content},"
			+"#{clubName})")
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
    
    @Select("select * from EPLBoard order by likeCount desc")
	List<BoardDTO> selectLike();

    @Select("select * from EPLBoardLike where BoardIdx=#{boardIdx} and  LikeMember=#{likeMember}")
	BoardLikeDTO selectLikeMember(BoardLikeDTO boardLike);
    
    @Select("select * from EPLBoardHate where BoardIdx=#{boardIdx} and  HateMember=#{hateMember}")
    BoardHateDTO selectHateMember(BoardHateDTO boardHate);

    @Select("select * from EPLBoard order by wdate desc")
	List<BoardDTO> selectNew();

    @Insert("insert into eplboardlike (boardidx,likemember) values (#{boardIdx}, #{likeMember})")
	int likeInsert(BoardLikeDTO ldto);

    @Insert("insert into eplboardhate (boardidx,hatemember) values (#{boardIdx}, #{hateMember})")
    int hateInsert(BoardHateDTO hdto);
    
    @Update("update EPLBoard set likeCount = likeCount+1 where idxBo=#{idxBo}") //좋아요
	int likeUp(String idxBo);
    
    @Update("update EPLBoard set likeCount = likeCount-1 where idxBo=#{idxBo}")
	int likeDown(String idxBo);

    @Select("select * from Club where clubname= #{clubName}")
	ClubDTO clubColor(String clubName);

	

	


    


	
}
