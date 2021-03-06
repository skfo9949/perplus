package com.perplus.member.daoimpl;
//1
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perplus.member.dao.ChattingDao;
import com.perplus.member.vo.ChattingVo;

@Repository
public class ChattingDaoImpl implements ChattingDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override//채팅방 만들기
	public int creatChatting(ChattingVo chatting) {
		return session.insert("chatting.createChatting",chatting);
	}

	@Override//채팅방 삭제
	public int deleteChatting(int chattingNumber) {
		return session.delete("chatting.deleteChatting",chattingNumber);
	}

	@Override//내가 속해있는 채팅방 가져오기
	public List<ChattingVo> selectMyChatting(String memberEmail) {
		return session.selectList("chatting.selectMyChatting", memberEmail);
	}

	@Override//나의 아이디와 상대방의 아이디로 방 찾기
	public ChattingVo findByChattingNumber(Map<String, Object> map) {
		return session.selectOne("chatting.findByChattingNumber",map);
	}

	@Override//채팅방과 채팅로그 가져오기
	public List<ChattingVo> chattingJoin(String memberEmail) {
		return session.selectList("chatting.selectJoinChattingLog", memberEmail);
	}
	
}
