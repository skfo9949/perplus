package com.perplus.review.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perplus.review.dao.ReviewDao;
import com.perplus.review.vo.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertReview(ReviewVo review) {
		// 리뷰 등록하는 메소드
		return session.insert("review.insertReview", review);
	}

	@Override
	public ReviewVo selectReviewBySerial(int reviewSerial) {
		//serial로 리뷰 조회하기
		return session.selectOne("review.selectReviewBySerial",reviewSerial);
	}

	@Override
	public int updateReview(ReviewVo review) {
		System.out.println(review);
		return session.update("review.updateReview", review);
	}

	@Override
	public int deleteReview(int reviewSerial) {
		return session.delete("review.deleteReview",reviewSerial);
	}

	@Override
	public List<ReviewVo> selectReviewByEmail(String memberEmail) {
		return session.selectList("review.selectReviewByEmail",memberEmail);
	}

	@Override
	public List<ReviewVo> selectReviewList() {
		return session.selectList("review.selectAllReview");
	}

	@Override
	public List<ReviewVo> selectMarkerBySection(HashMap<String, Double> map) {
		return session.selectList("review.selectMarkerBySection",map);
	}

	@Override
	public ReviewVo selectReviewByMarker(HashMap<String, Double> map) {
		return session.selectOne("review.selectReviewByMarker",map);
	}


/*	@Override
	public List<ReviewVo> selectReviewWithCommentAndPicture(int reviewSerial) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReviewWithCommentAndPicture",reviewSerial);
	}
	*/
	
}
