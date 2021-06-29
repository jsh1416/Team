package com.itbank.club;

//clubidx				number 				primary key,
//logo				varchar2(100)			not null, 
//clubname			varchar2(50)			not null,		
//clubnickName		varchar2(50)			not null


//06.09 bong 
public class ClubDTO {	
	private int clubIdx;
	private String logo, clubName, clubNickname, clubColor;
	
	
	public int getClubIdx() {
		return clubIdx;
	}
	public void setClubIdx(int clubIdx) {
		this.clubIdx = clubIdx;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubNickname() {
		return clubNickname;
	}
	public void setClubNickname(String clubNickname) {
		this.clubNickname = clubNickname;
	}
	public String getClubColor() {
		return clubColor;
	}
	public void setClubColor(String clubColor) {
		this.clubColor = clubColor;
	}
	
	
}
