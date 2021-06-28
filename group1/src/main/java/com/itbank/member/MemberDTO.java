package com.itbank.member;


//	id		varchar2(50)		primary key,	
//	pw		varchar2(2000)			not null,
//	name		varchar2(50)			not null,
//	nickName	varchar2(50)		unique	not null,
//	club		varchar2(50)			check(club in ('리버풀','맨유','맨시티','아스날','첼시')),
//	email		varchar2(50)			not null
	
// 06.09 bong 
public class MemberDTO {
	private String id, pw, name, nickName, club, email;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getClub() {
		return club;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
}
