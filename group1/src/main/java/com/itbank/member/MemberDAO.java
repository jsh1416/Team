package com.itbank.member;


import org.apache.ibatis.annotations.Select;

	// 06. 10 봉찬균 MemberDAO 생성
public interface MemberDAO {

	@Select("select * from EPLmember where id=#{id} and pw = #{pw}")
	MemberDTO login(MemberDTO dto);

	int join(MemberDTO dto);
	
	
}
