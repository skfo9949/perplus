create sequence house_seq increment by 1;

drop sequence house_seq

insert into HOUSEFILTER values(1,'화장실',20,'다인실',2,'경기도 용인시 모현면');



insert into HOUSEZZIM values(1,25,'bbb')

insert into CHECKLIST values(1,25,'아앙1','앙아');
insert into CHECKLIST values(2,25,'아앙2','앙아');
insert into CHECKLIST values(3,25,'아앙3','앙아');
insert into CHECKLIST values(4,25,'아앙4','앙아');
insert into CHECKLIST values(5,26,'아앙4','앙아');
insert into CHECKLIST values(6,24,'아앙4','앙아');

insert into SHUTDOWN values(1,25,'2015-10-11');
insert into SHUTDOWN values(2,25,'2015-10-12');
insert into SHUTDOWN values(3,26,'2015-10-13');
insert into SHUTDOWN values(4,26,'2015-10-14');
insert into SHUTDOWN values(5,23,'2015-10-15');

update HOUSEFILTER 
set HOUSE_RANGE='집전체', HOUSE_GUEST_NUMBER=4, HOUSE_TYPE='초가집', HOUSE_ROOM_NUMBER=3, HOUSE_LOCATION='경기'
where HOUSE_SERIAL=1

insert into HOUSE values(1,'화장실',20,'다인실',2,'경기도 용인시 모현면');

insert into HOUSE values(HOUSE_SEQ.nextval,'bbb',0,'따뜻한 집','조흔 집입니다1','ㅇㅇㅇ',null,null,0,0,0,0,0);
insert into HOUSE values(HOUSE_SEQ.nextval,'bbb',0,'추운 즵','조흔 집입니다2','ㅇㅇㅇ',null,null,0,0,0,0,0);
insert into HOUSE values(HOUSE_SEQ.nextval,'bbb',0,'초가집','조흔 집입니다3','ㅇㅇㅇ',null,null,0,0,0,0,0);
insert into HOUSE values(HOUSE_SEQ.nextval,'bbb',0,'이글루','조흔 집입니다4','ㅇㅇㅇ',null,null,0,0,0,0,0);

delete from HOUSE where HOUSE_SERIAL = 1

     select r.review_serial, r.member_email,r.review_title,r.review_content,r.review_rating,r.review_time,r.review_marker_x,r.review_marker_y,r.review_marker_constant,
               c.review_serial,c.member_email,c.comment_content,c.comment_rating,c.comment_time,
               p.review_serial,p.picture_order,p.picture_name
      from review r, reviewcomment c, reviewpicture p
      where c.review_serial = r.review_serial
      and p.review_serial=c.review_serial 
      and r.review_serial=2
      
	insert into MEMBER values('aaa','wegwe','김아무개','199ㄷ-02-04','남',01023,'경기',null,0,null);
	insert into MEMBER values('bbb','dsgwe','아아무개','1993-02-04','남',01023,'경기',null,0,null);
	insert into MEMBER values('ccc','hfgwe','중아무개','199ㄹ-02-04','남',01023,'경기',null,0,null);
	insert into MEMBER values('ddd','xcgwe','이아무개','199ㅍ-02-04','남',01023,'경기',null,0,null);
      
 
	select SYSDATE from dual;

		select HOUSE_SERIAL,
		MEMBER_EMAIL,
		HOUSE_REGISTER_STATUS,
		HOUSE_TITLE,
		HOUSE_CONTENT,
		HOUSE_NECESSARY_CONDITION,
		HOUSE_CHECKIN_START,
		HOUSE_CHECKIN_END,
		HOUSE_RATING,
		HOUSE_MARKER_X,
		HOUSE_MARKER_Y,
		HOUSE_MARKER_CONSTANT
		from HOUSE
		where HOUSE_SERIAL = 2

				select HOUSE_SERIAL,
		MEMBER_EMAIL,
		HOUSE_REGISTER_STATUS,
		HOUSE_TITLE,
		HOUSE_CONTENT,
		HOUSE_NECESSARY_CONDITION,
		HOUSE_CHECKIN_START,
		HOUSE_CHECKIN_END,
		HOUSE_RATING,
		HOUSE_MARKER_X,
		HOUSE_MARKER_Y,
		HOUSE_MARKER_CONSTANT
		from HOUSE
		where MEMBER_EMAIL = 'bbb';
		
		insert into HOUSEFILTER values(1,'집전체',3,'초가집',3,'경기도',4,3,4,6,6,0,0,0,0	)
		
		select 
		HOUSE_SERIAL houseSerial,
		HOUSEFILTER_RANGE housefilterRange,
		HOUSEFILTER_GUEST_NUMBER housefilterGuestNumber,
		HOUSEFILTER_TYPE housefilterType,
		HOUSEFILTER_ROOM_NUMBER housefilterRoomNumber,
		HOUSEFILTER_LOCATION housefilterLocation,
		HOUSEFILTER_BEDROOM_NUMBER housefilterBedroomNumber,
		HOUSEFILTER_BATHROOM_NUMBER housefilterBathroomNumber,
		HOUSEFILTER_BED_NUMBER housefilterBedNumber,
		HOUSEFILTER_CHECKIN_TERM housefilterCheckinTerm,
		HOUSEFILTER_RESERVATION_TERM housefilterReservationTerm,
		HOUSEFILTER_BAK_MIN housefilterBakMin,
		HOUSEFILTER_BAK_MAX housefilterBakMax,
		HOUSEFILTER_MONEY_MIN housefilterMoneyMin,
		HOUSEFILTER_MONEY_MAX housefilterMoneyMax
		from HOUSEFILTER 
		
		select * from HOUSE where HOUSE_SERIAL = 25
		
		select (DATE'2008-03-23') - (DATE'2007-03-23') from dual;
		-- filter 시작
		
		insert into HOUSEFILTER values(26,'eee',234,'333',234,'3234',0,0,0,0,0,2,3,0,0);
		insert into HOUSEFILTER values(27,'eee',234,'333',234,'3234',0,0,0,0,0,6,7,0,0);
		insert into HOUSEFILTER values(28,'eee',234,'333',234,'3234',0,0,0,0,0,8,90,0,0);
		insert into HOUSEFILTER values(41,'eee',234,'333',234,'3234',0,0,0,0,0,5,8,0,0);
		insert into HOUSEFILTER values(42,'eee',234,'333',234,'3234',0,0,0,0,0,2,3,0,0);
		insert into HOUSEFILTER values(43,'eee',234,'333',234,'3234',0,0,0,0,0,9,14,0,0);
		insert into HOUSEFILTER values(44,'eee',234,'333',234,'3234',0,0,0,0,0,21,23,0,0);
		insert into HOUSEFILTER values(45,'eee',234,'333',234,'3234',0,0,0,0,0,3,10,0,0);
		
		--간단한 필터 사용 예
		select * from HOUSE where HOUSE_SERIAL IN 
		(
		select HOUSE_SERIAL from HOUSEFILTER
		--1 차적으로 house
		--<if test ="startDay != null and endDay != null">
--		<where>
			 where (10-3) >= HOUSEFILTER_BAK_MIN
			and (10-3) <= HOUSEFILTER_BAK_MAX
--		</where>
		--</if>
		);
		
		-- 이게 된다는걸 알았으면 끝났다!!
		select * from HOUSE where HOUSE_SERIAL = (select HOUSE_SERIAL from HOUSEFILTER where HOUSEFILTER_BAK_MIN = 21);

		
		
		
