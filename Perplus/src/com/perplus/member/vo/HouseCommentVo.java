package com.perplus.member.vo;

import java.util.Date;

import com.perplus.house.vo.HouseVo;

public class HouseCommentVo {
	private int houseSerial;//하우스번호 번호
	private String memberEmail;//이메일
	private String commentContent;//내용
	private int commentRating;//별점
	private Date commentTime;//등록일자
	private MemberVo member;//
	
	
	public HouseCommentVo(int houseSerial, String memberEamil, String commentContent, int commentRating,
			Date commentTime) {
		this.houseSerial = houseSerial;
		this.memberEmail = memberEamil;
		this.commentContent = commentContent;
		this.commentRating = commentRating;
		this.commentTime = commentTime;
	}
	
	public HouseCommentVo() {}
	
	
	public int getHouseSerial() {
		return houseSerial;
	}
	public void setHouseSerial(int houseSerial) {
		this.houseSerial = houseSerial;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEamil) {
		this.memberEmail = memberEamil;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentRating() {
		return commentRating;
	}
	public void setCommentRating(int commentRating) {
		this.commentRating = commentRating;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	@Override
	public String toString() {
		return "HouseCommentVo [houseSerial=" + houseSerial + ", memberEamil=" + memberEmail + ", commentContent="
				+ commentContent + ", commentRating=" + commentRating + ", commentTime=" + commentTime + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentContent == null) ? 0 : commentContent.hashCode());
		result = prime * result + commentRating;
		result = prime * result + ((commentTime == null) ? 0 : commentTime.hashCode());
		result = prime * result + houseSerial;
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HouseCommentVo other = (HouseCommentVo) obj;
		if (commentContent == null) {
			if (other.commentContent != null)
				return false;
		} else if (!commentContent.equals(other.commentContent))
			return false;
		if (commentRating != other.commentRating)
			return false;
		if (commentTime == null) {
			if (other.commentTime != null)
				return false;
		} else if (!commentTime.equals(other.commentTime))
			return false;
		if (houseSerial != other.houseSerial)
			return false;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		return true;
	}
	
	
}
