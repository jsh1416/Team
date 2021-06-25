package com.itbank.member;


import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

	// 06. 10 봉찬균 MemberDAO 생성
//
public interface MemberDAO {

	@Select("select * from EPLmember where id=#{id} and pw = #{pw}")
	MemberDTO login(MemberDTO dto);

	int join(MemberDTO dto);
	
	@Select("select email from EPLmember where email = #{email}")
	String emailcheck(String email);

	@Select("select email from EPLmember where id = #{id}")
	String checkId(String id);

	@Select("select ID from EPLMEMBER where name = #{name} and email = #{email}")
	String helpId(MemberDTO member);

	@Update("update EPLmember set pw=#{pw} where name = #{name} and email = #{email}")
	int updatePw(MemberDTO member);

	@Select("select count(*) from EPLBOARD where writer = #{nickName}")
	int myBoardCount(MemberDTO login);

	@Select("select count(*) from EPLmember where pw = #{pw} and name = #{name} and email = #{email}")
	int currentPwCheck(MemberDTO member);

	
}
