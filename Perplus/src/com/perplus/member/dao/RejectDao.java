package com.perplus.member.dao;
//1
import org.apache.ibatis.session.SqlSession;

import com.perplus.member.vo.RejectVo;

public interface RejectDao {

	/**
	 * 새로운 RejectVo 객체 insert
	 * @param session
	 * @param RejectVo
	 * @return
	 */
	int insertReject(RejectVo reject);
	
	/**
	 * RejectVo 객체 delete - memberPartner(House - hostEmail)에 해당하는 값 조회 후 삭제
	 * @param session
	 * @param memberPartner
	 * @return
	 */
	int deleteReject(int travelSerial);
	
	/**
	 * memberPartner(House - hostEmail)에 해당하는 RejectVo 객체 select
	 * @return
	 */
	RejectVo selectReject(int travelSerial);
}
