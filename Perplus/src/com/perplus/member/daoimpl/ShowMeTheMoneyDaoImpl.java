package com.perplus.member.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perplus.member.dao.ShowMeTheMoneyDao;
import com.perplus.member.vo.ShowMeTheMoneyVo;

@Repository
public class ShowMeTheMoneyDaoImpl implements ShowMeTheMoneyDao{

	@Autowired
	private SqlSessionTemplate session;
	private String makeSql(){
		String sql = new Throwable().getStackTrace()[1].getMethodName();   //이전메소드(caller) 이름 가져오기
		return "showmethemoney." + sql;
	}
	
	@Override
	public int insertShowmethemoney(ShowMeTheMoneyVo showmethemoney) {
		// TODO Auto-generated method stub
		return session.insert(makeSql(), showmethemoney);
	}
	@Override
	public int updateShowmethemoney(ShowMeTheMoneyVo showmethemoney) {
		// TODO Auto-generated method stub
		return session.update(makeSql(), showmethemoney);
	}
	@Override
	public int deleteShowmethemoney(int showmethemoneySerial) {
		// TODO Auto-generated method stub
		return session.delete(makeSql(), showmethemoneySerial);
	}
	@Override
	public List<ShowMeTheMoneyVo> selectShowmethemoney(String memberEmail) {
		// TODO Auto-generated method stub
		return session.selectList(makeSql(), memberEmail);
	}
	@Override
	public ShowMeTheMoneyVo selectShowmethemoneyByShowmethemoneySerial(int showmethemoneySerial) {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql(), showmethemoneySerial);
	}

	@Override
	public int selectShowmethemoneySerialSeq() {
		// TODO Auto-generated method stub
		System.out.println("실행"+makeSql());
		return session.selectOne(makeSql());
	}

	@Override
	public List<ShowMeTheMoneyVo> selectShowmethemoneyByShowmethemoneyStatus(String memberEmail,
			int showmethemoneyStatus) {
		HashMap showmethemoneyParam = new HashMap();
		showmethemoneyParam.put("memberEmail", memberEmail);
		showmethemoneyParam.put("showmethemoneyStatus", showmethemoneyStatus);	
		return session.selectList(makeSql(), showmethemoneyParam);
	}
	
	
}
