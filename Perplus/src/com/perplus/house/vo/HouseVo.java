package com.perplus.house.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.perplus.member.vo.HouseZzimVo;

public class HouseVo implements Serializable{
	private int houseSerial;		//house 일련번호 -> houseFilter에서 최초 생성된다.(최초 DB 접근이 houseFilter에서 일어남, 1:1 관계)
	private String memberEmail;		//멤버 이메일
	private int houseRegisterStatus;//boolean이며 등록 완료하지 않고 나갔을때 이전 작성한 데이터를 불러오기 위해서 사용
	private String houseTitle;
	private String houseContent;
	private String houseNecessaryCondition; //String으로 제약조건 추가로 받으며 ,와 같은 구분자로 구분한다.
	private int houseRating;
	private double houseMarkerX;
	private double houseMarkerY;
	private double houseMarkerConstant;		//마커 종류의 식별자
	
	
	private HouseFilterVo houseFilter;
	private List<HouseZzimVo> houseZzimList;
	private List<HousePictureVo> housePicture;
	

	
	public HouseVo() {}

	public HouseVo(int houseSerial, String memberEmail, int houseRegisterStatus, String houseTitle,
			String houseContent) {
		super();
		this.houseSerial = houseSerial;
		this.memberEmail = memberEmail;
		this.houseRegisterStatus = houseRegisterStatus;
		this.houseTitle = houseTitle;
		this.houseContent = houseContent;
	}

	public HouseVo(int houseSerial, String memberEmail, int houseRegisterStatus, String houseTitle, String houseContent,
			String houseNecessaryCondition, int houseRating, double houseMarkerX, double houseMarkerY,
			double houseMarkerConstant, HouseFilterVo houseFilter, List<HouseZzimVo> houseZzimList) {
		super();
		this.houseSerial = houseSerial;
		this.memberEmail = memberEmail;
		this.houseRegisterStatus = houseRegisterStatus;
		this.houseTitle = houseTitle;
		this.houseContent = houseContent;
		this.houseNecessaryCondition = houseNecessaryCondition;
		this.houseRating = houseRating;
		this.houseMarkerX = houseMarkerX;
		this.houseMarkerY = houseMarkerY;
		this.houseMarkerConstant = houseMarkerConstant;
		this.houseFilter = houseFilter;
		this.houseZzimList = houseZzimList;
	}

	public HouseVo(int houseSerial, String memberEmail, int houseRegisterStatus, String houseTitle, String houseContent,
			String houseNecessaryCondition, int houseRating, double houseMarkerX, double houseMarkerY,
			double houseMarkerConstant, List<HousePictureVo> housePicture) {
		super();
		this.houseSerial = houseSerial;
		this.memberEmail = memberEmail;
		this.houseRegisterStatus = houseRegisterStatus;
		this.houseTitle = houseTitle;
		this.houseContent = houseContent;
		this.houseNecessaryCondition = houseNecessaryCondition;
		this.houseRating = houseRating;
		this.houseMarkerX = houseMarkerX;
		this.houseMarkerY = houseMarkerY;
		this.houseMarkerConstant = houseMarkerConstant;
		this.housePicture = housePicture;
	}

	public int getHouseSerial() {
		return houseSerial;
	}

	public void setHouseSerial(int houseSerial) {
		this.houseSerial = houseSerial;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getHouseRegisterStatus() {
		return houseRegisterStatus;
	}

	public void setHouseRegisterStatus(int houseRegisterStatus) {
		this.houseRegisterStatus = houseRegisterStatus;
	}

	public String getHouseTitle() {
		return houseTitle;
	}

	public void setHouseTitle(String houseTitle) {
		this.houseTitle = houseTitle;
	}

	public String getHouseContent() {
		return houseContent;
	}

	public void setHouseContent(String houseContent) {
		this.houseContent = houseContent;
	}

	public String getHouseNecessaryCondition() {
		return houseNecessaryCondition;
	}

	public void setHouseNecessaryCondition(String houseNecessaryCondition) {
		this.houseNecessaryCondition = houseNecessaryCondition;
	}

	public int getHouseRating() {
		return houseRating;
	}

	public void setHouseRating(int houseRating) {
		this.houseRating = houseRating;
	}

	public double getHouseMarkerX() {
		return houseMarkerX;
	}

	public void setHouseMarkerX(double houseMarkerX) {
		this.houseMarkerX = houseMarkerX;
	}

	public double getHouseMarkerY() {
		return houseMarkerY;
	}

	public void setHouseMarkerY(double houseMarkerY) {
		this.houseMarkerY = houseMarkerY;
	}

	public double getHouseMarkerConstant() {
		return houseMarkerConstant;
	}

	public void setHouseMarkerConstant(double houseMarkerConstant) {
		this.houseMarkerConstant = houseMarkerConstant;
	}

	public HouseFilterVo getHouseFilter() {
		return houseFilter;
	}

	public void setHouseFilter(HouseFilterVo houseFilter) {
		this.houseFilter = houseFilter;
	}

	public List<HouseZzimVo> getHouseZzimList() {
		return houseZzimList;
	}

	public void setHouseZzimList(List<HouseZzimVo> houseZzimList) {
		this.houseZzimList = houseZzimList;
	}

	public List<HousePictureVo> getHousePicture() {
		return housePicture;
	}

	public void setHousePicture(List<HousePictureVo> housePicture) {
		this.housePicture = housePicture;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((houseContent == null) ? 0 : houseContent.hashCode());
		result = prime * result + ((houseFilter == null) ? 0 : houseFilter.hashCode());
		long temp;
		temp = Double.doubleToLongBits(houseMarkerConstant);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(houseMarkerX);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(houseMarkerY);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((houseNecessaryCondition == null) ? 0 : houseNecessaryCondition.hashCode());
		result = prime * result + ((housePicture == null) ? 0 : housePicture.hashCode());
		result = prime * result + houseRating;
		result = prime * result + houseRegisterStatus;
		result = prime * result + houseSerial;
		result = prime * result + ((houseTitle == null) ? 0 : houseTitle.hashCode());
		result = prime * result + ((houseZzimList == null) ? 0 : houseZzimList.hashCode());
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
		HouseVo other = (HouseVo) obj;
		if (houseContent == null) {
			if (other.houseContent != null)
				return false;
		} else if (!houseContent.equals(other.houseContent))
			return false;
		if (houseFilter == null) {
			if (other.houseFilter != null)
				return false;
		} else if (!houseFilter.equals(other.houseFilter))
			return false;
		if (Double.doubleToLongBits(houseMarkerConstant) != Double.doubleToLongBits(other.houseMarkerConstant))
			return false;
		if (Double.doubleToLongBits(houseMarkerX) != Double.doubleToLongBits(other.houseMarkerX))
			return false;
		if (Double.doubleToLongBits(houseMarkerY) != Double.doubleToLongBits(other.houseMarkerY))
			return false;
		if (houseNecessaryCondition == null) {
			if (other.houseNecessaryCondition != null)
				return false;
		} else if (!houseNecessaryCondition.equals(other.houseNecessaryCondition))
			return false;
		if (housePicture == null) {
			if (other.housePicture != null)
				return false;
		} else if (!housePicture.equals(other.housePicture))
			return false;
		if (houseRating != other.houseRating)
			return false;
		if (houseRegisterStatus != other.houseRegisterStatus)
			return false;
		if (houseSerial != other.houseSerial)
			return false;
		if (houseTitle == null) {
			if (other.houseTitle != null)
				return false;
		} else if (!houseTitle.equals(other.houseTitle))
			return false;
		if (houseZzimList == null) {
			if (other.houseZzimList != null)
				return false;
		} else if (!houseZzimList.equals(other.houseZzimList))
			return false;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "HouseVo [houseSerial=" + houseSerial + ", memberEmail=" + memberEmail + ", houseRegisterStatus="
				+ houseRegisterStatus + ", houseTitle=" + houseTitle + ", houseContent=" + houseContent
				+ ", houseNecessaryCondition=" + houseNecessaryCondition + ", houseRating=" + houseRating
				+ ", houseMarkerX=" + houseMarkerX + ", houseMarkerY=" + houseMarkerY + ", houseMarkerConstant="
				+ houseMarkerConstant + ", houseFilter=" + houseFilter + ", houseZzimList=" + houseZzimList
				+ ", housePicture=" + housePicture + "]";
	}

	 

}
