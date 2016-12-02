package com.perplus.member.dao;

import java.util.List;

import com.perplus.member.vo.ShowMeTheMoneyVo;

public interface ShowMeTheMoneyDao {
	
	/**
	 * 새로운 ShowMeTheMoney 객체 insert
	 * @param ShowMeTheMoney
	 * @return
	 */
	int insertShowmethemoney(ShowMeTheMoneyVo showmethemoney);
	
	/**
	 * ShowMeTheMoney 객체 update
	 * @param travel
	 * @return
	 */
	int updateShowmethemoney(ShowMeTheMoneyVo showmethemoney);
	
	/**
	 * ShowMeTheMoney 객체 시리얼로 삭제
	 * @param showmethemoney
	 * @return
	 */
	int deleteShowmethemoney(int showmethemoneySerial);
	
	/**
	 * memberEmail의 모든 ShowMeTheMoney 객체 select
	 * @return
	 */
	List<ShowMeTheMoneyVo> selectShowmethemoney(String memberEmail);
	
	/**
	 * 여행 시리얼로 ShowMeTheMoney 객체 select
	 * @return
	 */
	ShowMeTheMoneyVo selectShowmethemoneyByShowmethemoneySerial(int showmethemoneySerial);
	
}
