/* 회원정보 */
CREATE TABLE MEMBER (
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	MEMBER_PASSWORD VARCHAR2(100) NOT NULL, /* 비밀번호 */
	MEMBER_NAME VARCHAR2(20) NOT NULL, /* 이름 */
	MEMBER_BIRTHDAY VARCHAR2(30) NOT NULL, /* 생일 */
	MEMBER_GENDER VARCHAR2(3), /* 성별 */
	MEMBER_TEL VARCHAR2(30), /* 전화번호 */
	MEMBER_LOCATION VARCHAR2(20), /* 거주지역 */
	MEMBER_INTRODUCTION VARCHAR2(2000), /* 자기소개 */
	MEMBER_IDENTIFICATION NUMBER(1), /* 신분증 */
	MEMBER_PICTURE VARCHAR2(300) /* 프로필사진 */
);

COMMENT ON TABLE MEMBER IS '회원정보';

COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN MEMBER.MEMBER_PASSWORD IS '비밀번호';

COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '이름';

COMMENT ON COLUMN MEMBER.MEMBER_BIRTHDAY IS '생일';

COMMENT ON COLUMN MEMBER.MEMBER_GENDER IS '성별';

COMMENT ON COLUMN MEMBER.MEMBER_TEL IS '전화번호';

COMMENT ON COLUMN MEMBER.MEMBER_LOCATION IS '거주지역';

COMMENT ON COLUMN MEMBER.MEMBER_INTRODUCTION IS '자기소개';

COMMENT ON COLUMN MEMBER.MEMBER_IDENTIFICATION IS '신분증';

COMMENT ON COLUMN MEMBER.MEMBER_PICTURE IS '프로필사진';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		MEMBER_EMAIL ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			MEMBER_EMAIL
		);

/* 숙소 */
CREATE TABLE HOUSE (
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	HOUSE_REGISTER_STATUS NUMBER(1) NOT NULL, /* 숙소 등록 상태 */
	HOUSE_TITLE VARCHAR2(100) NOT NULL, /* 제목 */
	HOUSE_CONTENT VARCHAR2(3000) NOT NULL, /* 상세설명 */
	HOUSE_NECESSARY_CONDITION CLOB, /* 게스트필수조건 */
	HOUSE_RATING NUMBER, /* 별점 */
	HOUSE_MARKER_X NUMBER, /* x좌표 */
	HOUSE_MARKER_Y NUMBER, /* y좌표 */
	HOUSE_MARKER_CONSTANT NUMBER /* 마커 구분자 */
);

COMMENT ON TABLE HOUSE IS '숙소';

COMMENT ON COLUMN HOUSE.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN HOUSE.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN HOUSE.HOUSE_REGISTER_STATUS IS '숙소 등록 상태';

COMMENT ON COLUMN HOUSE.HOUSE_TITLE IS '제목';

COMMENT ON COLUMN HOUSE.HOUSE_CONTENT IS '상세설명';

COMMENT ON COLUMN HOUSE.HOUSE_NECESSARY_CONDITION IS '게스트필수조건';

COMMENT ON COLUMN HOUSE.HOUSE_RATING IS '별점';

COMMENT ON COLUMN HOUSE.HOUSE_MARKER_X IS 'x좌표';

COMMENT ON COLUMN HOUSE.HOUSE_MARKER_Y IS 'y좌표';

COMMENT ON COLUMN HOUSE.HOUSE_MARKER_CONSTANT IS '마커 구분자';

CREATE UNIQUE INDEX PK_HOUSE
	ON HOUSE (
		HOUSE_SERIAL ASC
	);

ALTER TABLE HOUSE
	ADD
		CONSTRAINT PK_HOUSE
		PRIMARY KEY (
			HOUSE_SERIAL
		);

/* 숙소찜 */
CREATE TABLE HOUSEZZIM (
	HOUSEZZIM_SERIAL NUMBER NOT NULL, /* 숙소찜 시리얼 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE HOUSEZZIM IS '숙소찜';

COMMENT ON COLUMN HOUSEZZIM.HOUSEZZIM_SERIAL IS '숙소찜 시리얼';

COMMENT ON COLUMN HOUSEZZIM.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN HOUSEZZIM.MEMBER_EMAIL IS '이메일';

CREATE UNIQUE INDEX PK_HOUSEZZIM
	ON HOUSEZZIM (
		HOUSEZZIM_SERIAL ASC
	);

ALTER TABLE HOUSEZZIM
	ADD
		CONSTRAINT PK_HOUSEZZIM
		PRIMARY KEY (
			HOUSEZZIM_SERIAL
		);

/* 명소리뷰 */
CREATE TABLE REVIEW (
	REVIEW_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	REVIEW_TITLE VARCHAR2(200) NOT NULL, /* 제목 */
	REVIEW_CONTENT VARCHAR(2000) NOT NULL, /* 내용 */
	REVIEW_RATING NUMBER NOT NULL, /* 별점 */
	REVIEW_TIME DATE NOT NULL, /* 시간 */
	REVIEW_MARKER_X NUMBER NOT NULL, /* 리뷰 X좌표 */
	REVIEW_MARKER_Y NUMBER NOT NULL, /* 리뷰 Y좌표 */
	REVIEW_MARKER_CONSTANT NUMBER NOT NULL /* 마커 식별 */
);

COMMENT ON TABLE REVIEW IS '명소리뷰';

COMMENT ON COLUMN REVIEW.REVIEW_SERIAL IS '시리얼';

COMMENT ON COLUMN REVIEW.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN REVIEW.REVIEW_TITLE IS '제목';

COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '내용';

COMMENT ON COLUMN REVIEW.REVIEW_RATING IS '별점';

COMMENT ON COLUMN REVIEW.REVIEW_TIME IS '시간';

COMMENT ON COLUMN REVIEW.REVIEW_MARKER_X IS '리뷰 X좌표';

COMMENT ON COLUMN REVIEW.REVIEW_MARKER_Y IS '리뷰 Y좌표';

COMMENT ON COLUMN REVIEW.REVIEW_MARKER_CONSTANT IS '마커 식별';

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		REVIEW_SERIAL ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			REVIEW_SERIAL
		);

/* 리뷰댓글 */
CREATE TABLE REVIEWCOMMENT (
	COMMENT_SERIAL NUMBER NOT NULL, /* 리뷰 시리얼 */
	REVIEW_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	COMMENT_CONTENT VARCHAR2(2000) NOT NULL, /* 내용 */
	COMMENT_RATING NUMBER NOT NULL, /* 별점 */
	COMMENT_TIME DATE NOT NULL /* 시간 */
);

COMMENT ON TABLE REVIEWCOMMENT IS '리뷰댓글';

COMMENT ON COLUMN REVIEWCOMMENT.COMMENT_SERIAL IS '리뷰 시리얼';

COMMENT ON COLUMN REVIEWCOMMENT.REVIEW_SERIAL IS '시리얼';

COMMENT ON COLUMN REVIEWCOMMENT.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN REVIEWCOMMENT.COMMENT_CONTENT IS '내용';

COMMENT ON COLUMN REVIEWCOMMENT.COMMENT_RATING IS '별점';

COMMENT ON COLUMN REVIEWCOMMENT.COMMENT_TIME IS '시간';

CREATE UNIQUE INDEX PK_REVIEWCOMMENT
	ON REVIEWCOMMENT (
		COMMENT_SERIAL ASC
	);

ALTER TABLE REVIEWCOMMENT
	ADD
		CONSTRAINT PK_REVIEWCOMMENT
		PRIMARY KEY (
			COMMENT_SERIAL
		);

/* 결제수단 */
CREATE TABLE PAYMENT (
	CARD_SERIAL NUMBER NOT NULL, /* 카드 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	PAYMENT_TYPE VARCHAR2(10) NOT NULL, /* 카드종류 */
	CARD_NUMBER NUMBER NOT NULL, /* 카드번호 */
	CARD_EXPIRATION DATE NOT NULL, /* 만료일 */
	CARD_NAME VARCHAR2(2000) NOT NULL, /* 이름 */
	CARD_CVC VARCHAR2(10) NOT NULL /* CVC */
);

COMMENT ON TABLE PAYMENT IS '결제수단';

COMMENT ON COLUMN PAYMENT.CARD_SERIAL IS '카드 시리얼';

COMMENT ON COLUMN PAYMENT.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN PAYMENT.PAYMENT_TYPE IS '카드종류';

COMMENT ON COLUMN PAYMENT.CARD_NUMBER IS '카드번호';

COMMENT ON COLUMN PAYMENT.CARD_EXPIRATION IS '만료일';

COMMENT ON COLUMN PAYMENT.CARD_NAME IS '이름';

COMMENT ON COLUMN PAYMENT.CARD_CVC IS 'CVC';

CREATE UNIQUE INDEX PK_PAYMENT
	ON PAYMENT (
		CARD_SERIAL ASC
	);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT
		PRIMARY KEY (
			CARD_SERIAL
		);

/* 숙소사진 */
CREATE TABLE HOUSEPICTURE (
	PICTURE_SERIAL NUMBER NOT NULL, /* 사진 시리얼 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	PICTURE_ORDER NUMBER NOT NULL, /* 식별자 */
	PICTURE_NAME VARCHAR2(300) NOT NULL /* 사진 */
);

COMMENT ON TABLE HOUSEPICTURE IS '숙소사진';

COMMENT ON COLUMN HOUSEPICTURE.PICTURE_SERIAL IS '사진 시리얼';

COMMENT ON COLUMN HOUSEPICTURE.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN HOUSEPICTURE.PICTURE_ORDER IS '식별자';

COMMENT ON COLUMN HOUSEPICTURE.PICTURE_NAME IS '사진';

CREATE UNIQUE INDEX PK_HOUSEPICTURE
	ON HOUSEPICTURE (
		PICTURE_SERIAL ASC
	);

ALTER TABLE HOUSEPICTURE
	ADD
		CONSTRAINT PK_HOUSEPICTURE
		PRIMARY KEY (
			PICTURE_SERIAL
		);

/* 채팅방 */
CREATE TABLE CHATTING (
	CHATTING_NUMBER NUMBER NOT NULL, /* 방번호 */
	CHATTING_PARTNER VARCHAR2(100) NOT NULL, /* 너 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE CHATTING IS '채팅방';

COMMENT ON COLUMN CHATTING.CHATTING_NUMBER IS '방번호';

COMMENT ON COLUMN CHATTING.CHATTING_PARTNER IS '너';

COMMENT ON COLUMN CHATTING.MEMBER_EMAIL IS '이메일';

CREATE UNIQUE INDEX PK_CHATTING
	ON CHATTING (
		CHATTING_NUMBER ASC
	);

ALTER TABLE CHATTING
	ADD
		CONSTRAINT PK_CHATTING
		PRIMARY KEY (
			CHATTING_NUMBER
		);

/* 채팅내용 */
CREATE TABLE CHATTINGLOG (
	CHATTING_NUMBER NUMBER NOT NULL, /* 방번호 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CHATTING_CONTENT VARCHAR2(3000) NOT NULL, /* 내용 */
	CHATTING_TIME DATE NOT NULL /* 일시 */
);

COMMENT ON TABLE CHATTINGLOG IS '채팅내용';

COMMENT ON COLUMN CHATTINGLOG.CHATTING_NUMBER IS '방번호';

COMMENT ON COLUMN CHATTINGLOG.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN CHATTINGLOG.CHATTING_CONTENT IS '내용';

COMMENT ON COLUMN CHATTINGLOG.CHATTING_TIME IS '일시';

/* 거부메세지 */
CREATE TABLE REJECT (
	REJECT_SERIAL NUMBER NOT NULL, /* 리젝트 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	MEMBER_PARTNER VARCHAR2(100) NOT NULL, /* 너 */
	REJECT_CONTENT VARCHAR2(2000) NOT NULL, /* 메시지 */
	TRAVEL_SERIAL NUMBER NOT NULL /* 여행시리얼 */
);

COMMENT ON TABLE REJECT IS '거부메세지';

COMMENT ON COLUMN REJECT.REJECT_SERIAL IS '리젝트 시리얼';

COMMENT ON COLUMN REJECT.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN REJECT.MEMBER_PARTNER IS '너';

COMMENT ON COLUMN REJECT.REJECT_CONTENT IS '메시지';

COMMENT ON COLUMN REJECT.TRAVEL_SERIAL IS '여행시리얼';

CREATE UNIQUE INDEX PK_REJECT
	ON REJECT (
		REJECT_SERIAL ASC
	);

ALTER TABLE REJECT
	ADD
		CONSTRAINT PK_REJECT
		PRIMARY KEY (
			REJECT_SERIAL
		);

/* 계좌 정보 */
CREATE TABLE HOWGETMONEY (
	ACCOUNT_SERIAL NUMBER NOT NULL, /* 계좌 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	HOWGETMONEY_HOLDER VARCHAR2(50) NOT NULL, /* 예금주 */
	HOWGETMONEY_BANK VARCHAR2(50) NOT NULL, /* 은행명 */
	HOWGETMONEY_NUMBER NUMBER NOT NULL /* 계좌번호 */
);

COMMENT ON TABLE HOWGETMONEY IS '계좌 정보';

COMMENT ON COLUMN HOWGETMONEY.ACCOUNT_SERIAL IS '계좌 시리얼';

COMMENT ON COLUMN HOWGETMONEY.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN HOWGETMONEY.HOWGETMONEY_HOLDER IS '예금주';

COMMENT ON COLUMN HOWGETMONEY.HOWGETMONEY_BANK IS '은행명';

COMMENT ON COLUMN HOWGETMONEY.HOWGETMONEY_NUMBER IS '계좌번호';

CREATE UNIQUE INDEX PK_HOWGETMONEY
	ON HOWGETMONEY (
		ACCOUNT_SERIAL ASC
	);

ALTER TABLE HOWGETMONEY
	ADD
		CONSTRAINT PK_HOWGETMONEY
		PRIMARY KEY (
			ACCOUNT_SERIAL
		);

/* 여행 예약 */
CREATE TABLE TRAVEL (
	TRAVEL_SERIAL NUMBER NOT NULL, /* 여행시리얼 */
	TRAVEL_CODE NUMBER NOT NULL, /* 상태코드 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	TRAVEL_START DATE NOT NULL, /* 시작일 */
	TRAVEL_END DATE NOT NULL, /* 종료일 */
	TRAVEL_NUMBER NUMBER NOT NULL, /* 인원 */
	TRAVEL_CHECKIN DATE NOT NULL, /* 체크인시간 */
	TRAVEL_COST NUMBER NOT NULL /* 비용 */
);

COMMENT ON TABLE TRAVEL IS '여행 예약';

COMMENT ON COLUMN TRAVEL.TRAVEL_SERIAL IS '여행시리얼';

COMMENT ON COLUMN TRAVEL.TRAVEL_CODE IS '상태코드';

COMMENT ON COLUMN TRAVEL.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN TRAVEL.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN TRAVEL.TRAVEL_START IS '시작일';

COMMENT ON COLUMN TRAVEL.TRAVEL_END IS '종료일';

COMMENT ON COLUMN TRAVEL.TRAVEL_NUMBER IS '인원';

COMMENT ON COLUMN TRAVEL.TRAVEL_CHECKIN IS '체크인시간';

COMMENT ON COLUMN TRAVEL.TRAVEL_COST IS '비용';

CREATE UNIQUE INDEX PK_TRAVEL
	ON TRAVEL (
		TRAVEL_SERIAL ASC
	);

ALTER TABLE TRAVEL
	ADD
		CONSTRAINT PK_TRAVEL
		PRIMARY KEY (
			TRAVEL_SERIAL
		);

/* 대금내역 */
CREATE TABLE SHOWMETHEMONEY (
	SHOWMETHEMONEY_SERIAL NUMBER NOT NULL, /* 결제내역 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	SHOWMETHEMONEY_STATUS NUMBER NOT NULL, /* 수령상태 */
	SHOWMETHEMONEY_DATE DATE NOT NULL, /* 결제날짜 */
	SHOWMETHEMONEY_KIND VARCHAR2(50) NOT NULL, /* 카드종류 */
	SHOWMETHEMONEY_CONTENT VARCHAR2(1000) NOT NULL, /* 상세정보 */
	SHOWMETHEMONEY_PAY_MONEY NUMBER NOT NULL, /* 결제금액 */
	SHOWMETHEMONEY_RECIVE_MONEY NUMBER NOT NULL, /* 수령완료금액 */
	SHOWMETHEMONEY_BANK VARCHAR2(50) NOT NULL /* 입금처 */
);

COMMENT ON TABLE SHOWMETHEMONEY IS '대금내역';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_SERIAL IS '결제내역 시리얼';

COMMENT ON COLUMN SHOWMETHEMONEY.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_STATUS IS '수령상태';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_DATE IS '결제날짜';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_KIND IS '카드종류';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_CONTENT IS '상세정보';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_PAY_MONEY IS '결제금액';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_RECIVE_MONEY IS '수령완료금액';

COMMENT ON COLUMN SHOWMETHEMONEY.SHOWMETHEMONEY_BANK IS '입금처';

CREATE UNIQUE INDEX PK_SHOWMETHEMONEY
	ON SHOWMETHEMONEY (
		SHOWMETHEMONEY_SERIAL ASC
	);

ALTER TABLE SHOWMETHEMONEY
	ADD
		CONSTRAINT PK_SHOWMETHEMONEY
		PRIMARY KEY (
			SHOWMETHEMONEY_SERIAL
		);

/* 제약 날짜 */
CREATE TABLE SHUTDOWN (
	SHUTDOWN_SERIAL NUMBER NOT NULL, /* 제약날짜 시리얼 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	SHUTDOWN_DATE DATE NOT NULL /* 날짜 */
);

COMMENT ON TABLE SHUTDOWN IS '제약 날짜';

COMMENT ON COLUMN SHUTDOWN.SHUTDOWN_SERIAL IS '제약날짜 시리얼';

COMMENT ON COLUMN SHUTDOWN.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN SHUTDOWN.SHUTDOWN_DATE IS '날짜';

CREATE UNIQUE INDEX PK_SHUTDOWN
	ON SHUTDOWN (
		SHUTDOWN_SERIAL ASC
	);

ALTER TABLE SHUTDOWN
	ADD
		CONSTRAINT PK_SHUTDOWN
		PRIMARY KEY (
			SHUTDOWN_SERIAL
		);

/* 하우스 필터 */
CREATE TABLE HOUSEFILTER (
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	HOUSEFILTER_RANGE VARCHAR2(50) NOT NULL, /* 제공범위 */
	HOUSEFILTER_GUEST_NUMBER NUMBER NOT NULL, /* 게스트수 */
	HOUSEFILTER_TYPE VARCHAR2(50) NOT NULL, /* 건물유형 */
	HOUSEFILTER_ROOM_NUMBER NUMBER NOT NULL, /* 방개수 */
	HOUSEFILTER_LOCATION VARCHAR2(200) NOT NULL, /* 숙소위치 */
	HOUSEFILTER_BEDROOM_NUMBER NUMBER, /* 침실수 */
	HOUSEFILTER_BATHROOM_NUMBER NUMBER, /* 침대수 */
	HOUSEFILTER_BED_NUMBER NUMBER, /* 욕실수 */
	HOUSEFILTER_CHECKIN_TERM NUMBER, /* 체크인텀 */
	HOUSEFILTER_CHECKIN_START DATE, /* 체크인시작시간 */
	HOUSEFILTER_CHECKIN_END DATE, /* 체크인종료시간 */
	HOUSEFILTER_RESERVATION_TERM NUMBER, /* 미래예약가능 */
	HOUSEFILTER_BAK_MIN NUMBER, /* 최소박 */
	HOUSEFILTER_BAK_MAX NUMBER, /* 최대박 */
	HOUSEFILTER_PRICE NUMBER /* 숙소 가격 */
);

COMMENT ON TABLE HOUSEFILTER IS '하우스 필터';

COMMENT ON COLUMN HOUSEFILTER.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_RANGE IS '제공범위';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_GUEST_NUMBER IS '게스트수';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_TYPE IS '건물유형';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_ROOM_NUMBER IS '방개수';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_LOCATION IS '숙소위치';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_BEDROOM_NUMBER IS '침실수';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_BATHROOM_NUMBER IS '침대수';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_BED_NUMBER IS '욕실수';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_CHECKIN_TERM IS '체크인텀';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_CHECKIN_START IS '체크인시작시간';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_CHECKIN_END IS '체크인종료시간';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_RESERVATION_TERM IS '미래예약가능';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_BAK_MIN IS '최소박';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_BAK_MAX IS '최대박';

COMMENT ON COLUMN HOUSEFILTER.HOUSEFILTER_PRICE IS '숙소 가격';

CREATE UNIQUE INDEX PK_HOUSEFILTER
	ON HOUSEFILTER (
		HOUSE_SERIAL ASC
	);

ALTER TABLE HOUSEFILTER
	ADD
		CONSTRAINT PK_HOUSEFILTER
		PRIMARY KEY (
			HOUSE_SERIAL
		);

/* 코드 테이블 */
CREATE TABLE CODETABLE (
	CODE_KIND NUMBER NOT NULL, /* 식별자 */
	VALUE VARCHAR2(500) NOT NULL /* 값 */
);

COMMENT ON TABLE CODETABLE IS '코드 테이블';

COMMENT ON COLUMN CODETABLE.CODE_KIND IS '식별자';

COMMENT ON COLUMN CODETABLE.VALUE IS '값';

/* 숙소후기 */
CREATE TABLE HOUSECOMMENT (
	COMMENT_SERIAL NUMBER NOT NULL, /* 후기 시리얼 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	COMMENT_CONTENT VARCHAR2(2000) NOT NULL, /* 내용 */
	COMMENT_RATING NUMBER NOT NULL, /* 별점 */
	COMMENT_TIME DATE NOT NULL /* 시간 */
);

COMMENT ON TABLE HOUSECOMMENT IS '숙소후기';

COMMENT ON COLUMN HOUSECOMMENT.COMMENT_SERIAL IS '후기 시리얼';

COMMENT ON COLUMN HOUSECOMMENT.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN HOUSECOMMENT.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN HOUSECOMMENT.COMMENT_CONTENT IS '내용';

COMMENT ON COLUMN HOUSECOMMENT.COMMENT_RATING IS '별점';

COMMENT ON COLUMN HOUSECOMMENT.COMMENT_TIME IS '시간';

CREATE UNIQUE INDEX PK_HOUSECOMMENT
	ON HOUSECOMMENT (
		COMMENT_SERIAL ASC
	);

ALTER TABLE HOUSECOMMENT
	ADD
		CONSTRAINT PK_HOUSECOMMENT
		PRIMARY KEY (
			COMMENT_SERIAL
		);

/* 명소사진 */
CREATE TABLE REVIEWPICTURE (
	PICTURE_SERIAL NUMBER NOT NULL, /* 사진 시리얼 */
	REVIEW_SERIAL NUMBER NOT NULL, /* 시리얼 */
	PICTURE_ORDER NUMBER NOT NULL, /* 식별자 */
	PICTURE_NAME VARCHAR2(300) NOT NULL /* 사진 */
);

COMMENT ON TABLE REVIEWPICTURE IS '명소사진';

COMMENT ON COLUMN REVIEWPICTURE.PICTURE_SERIAL IS '사진 시리얼';

COMMENT ON COLUMN REVIEWPICTURE.REVIEW_SERIAL IS '시리얼';

COMMENT ON COLUMN REVIEWPICTURE.PICTURE_ORDER IS '식별자';

COMMENT ON COLUMN REVIEWPICTURE.PICTURE_NAME IS '사진';

CREATE UNIQUE INDEX PK_REVIEWPICTURE
	ON REVIEWPICTURE (
		PICTURE_SERIAL ASC
	);

ALTER TABLE REVIEWPICTURE
	ADD
		CONSTRAINT PK_REVIEWPICTURE
		PRIMARY KEY (
			PICTURE_SERIAL
		);

/* 리뷰찜 */
CREATE TABLE REVIEWZZIM (
	REVIEWZZIM_SERIAL NUMBER NOT NULL, /* 리뷰찜 시리얼 */
	REVIEW_SERIAL NUMBER NOT NULL, /* 시리얼 */
	MEMBER_EMAIL VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE REVIEWZZIM IS '리뷰찜';

COMMENT ON COLUMN REVIEWZZIM.REVIEWZZIM_SERIAL IS '리뷰찜 시리얼';

COMMENT ON COLUMN REVIEWZZIM.REVIEW_SERIAL IS '시리얼';

COMMENT ON COLUMN REVIEWZZIM.MEMBER_EMAIL IS '이메일';

CREATE UNIQUE INDEX PK_REVIEWZZIM
	ON REVIEWZZIM (
		REVIEWZZIM_SERIAL ASC
	);

ALTER TABLE REVIEWZZIM
	ADD
		CONSTRAINT PK_REVIEWZZIM
		PRIMARY KEY (
			REVIEWZZIM_SERIAL
		);

/* 숙소체크박스 */
CREATE TABLE CHECKLIST (
	CHECKLIST_SERIAL NUMBER NOT NULL, /* 체크리스트 시리얼 */
	HOUSE_SERIAL NUMBER NOT NULL, /* 시리얼 */
	CODE_KIND NUMBER NOT NULL, /* 식별자 */
	VALUE VARCHAR2(500) NOT NULL /* 값 */
);

COMMENT ON TABLE CHECKLIST IS '숙소체크박스';

COMMENT ON COLUMN CHECKLIST.CHECKLIST_SERIAL IS '체크리스트 시리얼';

COMMENT ON COLUMN CHECKLIST.HOUSE_SERIAL IS '시리얼';

COMMENT ON COLUMN CHECKLIST.CODE_KIND IS '식별자';

COMMENT ON COLUMN CHECKLIST.VALUE IS '값';

CREATE UNIQUE INDEX PK_CHECKLIST
	ON CHECKLIST (
		CHECKLIST_SERIAL ASC
	);

ALTER TABLE CHECKLIST
	ADD
		CONSTRAINT PK_CHECKLIST
		PRIMARY KEY (
			CHECKLIST_SERIAL
		);

ALTER TABLE HOUSE
	ADD
		CONSTRAINT FK_MEMBER_TO_HOUSE
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE HOUSEZZIM
	ADD
		CONSTRAINT FK_MEMBER_TO_HOUSEZZIM
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE HOUSEZZIM
	ADD
		CONSTRAINT FK_HOUSE_TO_HOUSEZZIM
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSE (
			HOUSE_SERIAL
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE REVIEWCOMMENT
	ADD
		CONSTRAINT FK_REVIEW_TO_REVIEWCOMMENT
		FOREIGN KEY (
			REVIEW_SERIAL
		)
		REFERENCES REVIEW (
			REVIEW_SERIAL
		);

ALTER TABLE REVIEWCOMMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEWCOMMENT
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_PAYMENT
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE HOUSEPICTURE
	ADD
		CONSTRAINT FK_HOUSE_TO_HOUSEPICTURE
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSE (
			HOUSE_SERIAL
		);

ALTER TABLE CHATTING
	ADD
		CONSTRAINT FK_MEMBER_TO_CHATTING
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE CHATTINGLOG
	ADD
		CONSTRAINT FK_CHATTING_TO_CHATTINGLOG
		FOREIGN KEY (
			CHATTING_NUMBER
		)
		REFERENCES CHATTING (
			CHATTING_NUMBER
		);

ALTER TABLE REJECT
	ADD
		CONSTRAINT FK_MEMBER_TO_REJECT
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE REJECT
	ADD
		CONSTRAINT FK_TRAVEL_TO_REJECT
		FOREIGN KEY (
			TRAVEL_SERIAL
		)
		REFERENCES TRAVEL (
			TRAVEL_SERIAL
		);

ALTER TABLE HOWGETMONEY
	ADD
		CONSTRAINT FK_MEMBER_TO_HOWGETMONEY
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE TRAVEL
	ADD
		CONSTRAINT FK_MEMBER_TO_TRAVEL
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE TRAVEL
	ADD
		CONSTRAINT FK_HOUSE_TO_TRAVEL
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSE (
			HOUSE_SERIAL
		);

ALTER TABLE SHOWMETHEMONEY
	ADD
		CONSTRAINT FK_MEMBER_TO_SHOWMETHEMONEY
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE SHUTDOWN
	ADD
		CONSTRAINT FK_HOUSEFILTER_TO_SHUTDOWN
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSEFILTER (
			HOUSE_SERIAL
		);

ALTER TABLE HOUSEFILTER
	ADD
		CONSTRAINT FK_HOUSE_TO_HOUSEFILTER
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSE (
			HOUSE_SERIAL
		);

ALTER TABLE HOUSECOMMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_HOUSECOMMENT
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE HOUSECOMMENT
	ADD
		CONSTRAINT FK_HOUSE_TO_HOUSECOMMENT
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSE (
			HOUSE_SERIAL
		);

ALTER TABLE REVIEWPICTURE
	ADD
		CONSTRAINT FK_REVIEW_TO_REVIEWPICTURE
		FOREIGN KEY (
			REVIEW_SERIAL
		)
		REFERENCES REVIEW (
			REVIEW_SERIAL
		);

ALTER TABLE REVIEWZZIM
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEWZZIM
		FOREIGN KEY (
			MEMBER_EMAIL
		)
		REFERENCES MEMBER (
			MEMBER_EMAIL
		);

ALTER TABLE REVIEWZZIM
	ADD
		CONSTRAINT FK_REVIEW_TO_REVIEWZZIM
		FOREIGN KEY (
			REVIEW_SERIAL
		)
		REFERENCES REVIEW (
			REVIEW_SERIAL
		);

ALTER TABLE CHECKLIST
	ADD
		CONSTRAINT FK_HOUSEFILTER_TO_CHECKLIST
		FOREIGN KEY (
			HOUSE_SERIAL
		)
		REFERENCES HOUSEFILTER (
			HOUSE_SERIAL
		);