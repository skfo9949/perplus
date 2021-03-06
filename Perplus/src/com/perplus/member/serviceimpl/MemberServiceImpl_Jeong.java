package com.perplus.member.serviceimpl;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl_Jeong {
//	
//	@Autowired
//	@Qualifier("paymentDaoImpl")
//	private PaymentDao paymentDao;
//	
//	@Autowired
//	@Qualifier("rejectDaoImpl")
//	private RejectDao rejectDao;
//	
//	@Autowired
//	@Qualifier("reviewZzimDaoImpl")
//	private ReviewZzimDao reviewZzimDao;
//	
//	@Autowired
//	@Qualifier("showmoneyDaoImpl")
//	private ShowmoneyDao showmoneyDao;
//	
//	@Qualifier("travelDaoImpl")
//	private TravelDao travelDao;
//	
//	
//	/**
//	 * Payment 관련 Service
//	 * @param payment
//	 * @throws Exception
//	 */
//	public void registerPayment(PaymentVo payment) throws Exception{
//	
//		// 1. 이메일로 사용자의 등록된 카드 전부 조회
//		String memberEmail = payment.getMemberEmail();
//		List<PaymentVo> paymentList = paymentDao.selectPayment(memberEmail);
//
//		// 2. 조회된 카드 객체 들에서 새로 입력된 카드 번호 비교
//		for(PaymentVo gunbygun : paymentList){
//			if(gunbygun.getCardNumber() == payment.getCardNumber()){
//		// 3. 같은 값이 있으면 Exception 발생
//				throw new Exception("입력하신 카드는 이미 등록된 카드 입니다.");
//			}
//		}
//		// 4. 등록처리
//		paymentDao.insertPayment(payment);
//	}
//	
//	public void removePayment(int cardSerial) throws Exception{
//		
//		PaymentVo payment = null;
//		// 1. 카드 시리얼로 객체 조회 조회
//		payment = paymentDao.selectPaymentByCardSerial(cardSerial);
//
//		// 2. 객체 조회 되었는지 확 인 후
//		if(payment!=null){
//			// 삭제 처리
//			paymentDao.deletePayment(cardSerial);
//		}else{ //null 이면 -> 검색 되지 않았으면
//			throw new Exception("해당 카드가 존재하지 않습니다.");
//		}
//	}
//	
//	public List<PaymentVo> getPayment(String memberEmail) throws Exception{
//		List<PaymentVo> paymentList = null;
//		paymentList = paymentDao.selectPayment(memberEmail);
//		if (paymentList == null){
//			throw new Exception("등록된 카드가 없습니다.");
//		}
//		return paymentList;
//	}
//	
//	public int getCardSerialSeq() {
//		return paymentDao.selectCardSerialSeq();
//	}
//	
//	/**
//	 * Reject 관련 Service
//	 * @param reject
//	 * @throws Exception
//	 */
//	public void registerReject(RejectVo reject) throws Exception{
//		// travelSerial로 테이블 검색
//		if(rejectDao.selectReject(reject.getTravelSerial()) != null){
//			throw new Exception("이미 거부 하셨습니다.");
//		}else{ // 존재하지 않으면 reject 등록 
//			rejectDao.insertReject(reject);
//		}
//	}
//
//	public RejectVo getReject(int travelSerial) throws Exception{
//		RejectVo reject = null;
//		reject = rejectDao.selectReject(travelSerial); // travel Serial 로 reject 검색 
//		if (reject == null){ // 해당하는 reject가 없으면
//			throw new Exception("거부되지 않았습니다.");
//		}else{ // 해당하는 reject가 잇으면 반환
//			return rejectDao.selectReject(travelSerial);			
//		}
//	}
//	
//	public void removeReject(int travelSerial) throws Exception {
//		if (getReject(travelSerial) != null){
//			rejectDao.deleteReject(travelSerial);			
//		}
//	}
//	
//	/**
//	 * reviewZzim 관련 Service
//	 * @param reviewZzim
//	 * @throws Exception
//	 */
//	public void registerReviewZzim(ReviewZzimVo reviewZzim) throws Exception{
//		
//		// 이메일로 검색해서 리뷰 리스트 조회
////		try{// 조회시 등록된 리뷰찜이 없는 경우 exception 발생
//			List<ReviewZzimVo> zzimList = searchReviewZzim(reviewZzim.getMemberEmail());
//			
//			for(ReviewZzimVo zzim : zzimList){
//				//매개변수로 받은 리뷰 시리얼과 같은 리뷰가 있는지 조회
//				if(zzim.getReviewSerial() == reviewZzim.getReviewSerial()){//있으면 Exception 
//					throw new Exception("이미 찜된 리뷰입니다.");				
//				}
//			}
////		}catch (Exception e) {
//			//  리뷰찜이 없는 경우 등록 처리
//			reviewZzimDao.insertReviewZzim(reviewZzim);
////		}
//	}
//
//	public List<ReviewZzimVo> searchReviewZzim(String memberEmail) throws Exception{
//		List<ReviewZzimVo> zzimList = null;
//		zzimList = reviewZzimDao.selectReviewZzimByMemberEmail(memberEmail);
//		if (zzimList != null){
//			return zzimList;
//		}else{
//			throw new Exception("등록된 리뷰 찜이 없습니다.");
//		}
//	}
//	
//	public void removeReviewZzim(ReviewZzimVo reviewZzim) throws Exception{
//		// 이메일로 검색해서 리뷰 리스트 조회
//		List<ReviewZzimVo> zzimList = searchReviewZzim(reviewZzim.getMemberEmail());
//		
//		for(ReviewZzimVo zzim : zzimList){
//			//매개변수로 받은 리뷰 시리얼과 같은 리뷰가 있는지 조회
//			if(zzim.getReviewSerial() == reviewZzim.getReviewSerial()){//있으면 Exception
//				reviewZzimDao.deleteReviewZzim(zzim.getReviewZzimSerial());			
//			}
//		}
//	}
//	
//	/**
//	 * showmoney 관련 Service
//	 * @param showmoney
//	 */
//	public void registerShowmethemoney(ShowmoneyVo showmoney){
//		try {
//			getShowmethemoneyBySerial(showmoney.getShowmethemoneySerial());
//		} catch (Exception e) {
//			showmoneyDao.insertShowmethemoney(showmoney);
//		}
//		
//	}
//	
//	public ShowmoneyVo getShowmethemoneyBySerial(int showmoneySerial) throws Exception{
//		ShowmoneyVo showmoney = null;
//		//Serial로 DB 조회
//		showmoney = showmoneyDao.selectShowmethemoneyByShowmethemoneySerial(showmoneySerial);
//		if (showmoney != null){ // 조회된 객체 return
//			return showmoneyDao.selectShowmethemoneyByShowmethemoneySerial(showmoneySerial);
//		}else{ // 조회된 객체가 없으면 exception 발생
//			throw new Exception("Serial로 검색한 대금 내역이 존재하지 않습니다.");
//		}
//		
//	}
//	
//	public List<ShowmoneyVo> getAllShowmethemoney(String memberEmail) throws Exception{
//		List<ShowmoneyVo> smtmList = null;
//		// Email로 객체 리스트 조회
//		smtmList = showmoneyDao.selectShowmethemoney(memberEmail);
//		if(smtmList !=null){ // 조회된 리스트가 있으면 리턴
//			return smtmList;
//		}else{ // 없으면 Exception 발생
//			throw new Exception("대금 내역이 없습니다.");
//		}
//	}
//	
//	public void removeShowmethemoney(int showmoneySerial) throws Exception{
//		ShowmoneyVo showmoney = null;
//		try {
//			showmoney = getShowmethemoneyBySerial(showmoneySerial);
//			showmoneyDao.deleteShowmethemoney(showmoney.getShowmethemoneySerial());
//		} catch (Exception e) {
//			throw new Exception("삭제할 내역이 없습니다.");
//		}
//	}
//	
//	/**
//	 * Travel  관련 Service
//	 * @param travel
//	 * @throws Exception
//	 */
//	public void registerTravel(TravelVo travel) throws Exception{
//		List<TravelVo> travelList = null;
//		try { // 이메일로 모든 Travel 객체 조회
//			travelList = getAllTravel(travel.getMemberEmail()); // 조회된 객체가 없으면 Exception 발생 후 잡아서 등록
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			travelDao.insertTravel(travel);
//		}
//		
//		for(TravelVo tmp : travelList){
//			//이전 여행을 제외한 모든 객체에서 같은 House Serial 이 존재하는지 조회
//			//한번 예약한 숙소는 여행이 끝나기 전까지 다시 예약 할 수 없음
//			if(tmp.getTravelCode() != Constants.TRAVEL_CODE_PREVIOUS){
//				if(tmp.getHouseSerial() == travel.getHouseSerial()){
//					throw new Exception("이미 예약된 숙소 입니다.");
//				}
//			}
//		}
//		travelDao.insertTravel(travel);	// 같은게 없으면 등록
//	}
//	
//	public TravelVo getTravelByTravelCode(int travelCode) throws Exception{
//		TravelVo travel = null; 
//		travel = travelDao.selectTravelByTravelCode(travelCode);
//		if(travel != null){ // 조회된 값이 있다면 객체 리턴
//			return travel;
//		}else{
//			throw new Exception("조회된 예약 내역이 없습니다.");
//		}
//	}
//	
//	public List<TravelVo> getAllTravel(String memberEmail) throws Exception{
//		List<TravelVo> travelList = null;
//		travelList = travelDao.selectTravel(memberEmail);
//		
//		if(travelList != null){ // 조회된 값이 있다면 객체 리턴
//			return travelList;
//		}else{
//			throw new Exception("조회된 예약 내역이 없습니다.");
//		}
//	}
//	
//	public TravelVo getTravelbyTravelSerial(int travelSerial) throws Exception{ // 시리얼로 조회
//		TravelVo travel = null;
//		travel = travelDao.selectTravelByTravelSerial(travelSerial);
//		if(travel != null){ // 조회된 값이 있다면 객체 리턴
//			return travel;
//		}else{
//			throw new Exception("조회된 예약 내역이 없습니다.");
//		}
//	}
//	
//	public void removeTravel(int travelSerial) throws Exception{
//		TravelVo travel = null;
//		
//		try {
//			travel = getTravelbyTravelSerial(travelSerial); // 시리얼로 여행 조회 후 없으면
//		} catch (Exception e) {
//			throw new Exception("해당 여행이 존재하지 않습니다.");
//		}
//		travelDao.deleteTravel(travel.getTravelSerial());
//		
//	}
	
}
