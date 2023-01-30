DROP SEQUENCE myclassmain_seq;
 CREATE SEQUENCE myclassmain_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
DROP TABLE myclassmain;
CREATE TABLE myclassmain(
	mym_no NUMBER(5)
        CONSTRAINT MYM_NO_PK PRIMARY KEY, 	    -- 관리번호
    mym_mid VARCHAR2(18 CHAR) 
        CONSTRAINT MYM_MID_FK REFERENCES member(m_id) 
        CONSTRAINT MYM_MID_NN NOT NULL,			-- 회원id
    mym_code VARCHAR2(8 CHAR)
        CONSTRAINT MYM_CODE_FK REFERENCES classmain(cm_code)
        CONSTRAINT MYM_CODE_NN NOT NULL,		-- 강의코드
    mym_title VARCHAR2(100 CHAR) 
        CONSTRAINT MYM_TITLE_NN NOT NULL,		-- 강의명
    mym_name VARCHAR2(100 CHAR) 
        CONSTRAINT MYM_NAME_NN NOT NULL,		-- 사람이름
    mym_period NUMBER(5) 
        CONSTRAINT MYM_PERIOD_NN NOT NULL,		 -- 수강기간
    mym_price NUMBER(8) 
        CONSTRAINT MYM_PRICE_NN NOT NULL,	     -- 가격
    mym_sdate TIMESTAMP DEFAULT sysdate
        CONSTRAINT MYM_SDATE_NN NOT NULL,		-- 시작일
    mym_edate TIMESTAMP 
        CONSTRAINT MYM_EDATE_NN NOT NULL, 		-- 종료일   
    mym_done CHAR(1) CHECK (mym_done IN('Y', 'N')) 
        CONSTRAINT MYM_DONE_NN NOT NULL,        -- 수강완료 여부
    mym_yn CHAR(1) CHECK (mym_yn IN('Y', 'N'))
        CONSTRAINT MYM_YN_NN NOT NULL            -- 삭제유무
);  

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JA01', '자바 기초 프로그래밍 강좌', '동빈나', 4, 200000, '2023-01-01', ADD_MONTHS('2023-01-01', 4), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩', 5, 250000, '2023-01-08', ADD_MONTHS('2023-01-08', 5), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JA03', '자바(JAVA)강의','홍드로이드', 6, 180000, '2023-01-10', ADD_MONTHS('2023-01-10', 6), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처', 3, 150000, '2023-01-04', ADD_MONTHS('2023-01-04', 3), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어', 4, 240000, '2023-01-05', ADD_MONTHS('2023-01-05', 4), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마', 4, 260000, '2023-01-07',ADD_MONTHS('2023-01-07', 4), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JS02', 'JavaScript 입문수업', '생활코딩', 3, 150000,'2023-01-08',ADD_MONTHS('2023-01-08', 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'SP02', 'Springboot 강좌 - 개념정리','메타코딩', 10, 220000, '2023-01-15',ADD_MONTHS('2023-01-15', 10), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'SP03', '스프링 부트 게시판 무작정 따라하기', '한코딩', 6, 110000, '2023-01-17', ADD_MONTHS('2023-01-17', 6), 'Y', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌', 2, 100000, '2023-01-18', ADD_MONTHS('2023-01-18', 2), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'BS02', 'bootstrap','생활코딩', 8, 220000, '2023-01-18', ADD_MONTHS('2023-01-18', 8), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'KT02', '안드로이드(Android Kotlin)','홍드로이드', 5, 250000,'2023-01-19', ADD_MONTHS('2023-01-19', 5), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'KT03', '[Do it! 깡샘의 안드로이드 앱 프로그래밍 with 코틀린] 동영상 강의','깡샘', 6, 120000, '2023-01-20', ADD_MONTHS('2023-01-20', 6), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'HL01', '입문자를 위한 HTML 기초강의','유노코딩', 2, 100000, '2023-01-21', ADD_MONTHS('2023-01-21', 2), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)   
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'HL03', 'HTML/CSS강의','짐코딩의 CODING GYM', 3, 120000, '2023-01-25', ADD_MONTHS('2023-01-25', 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'JQ03', '예제로 배우는 jQuery강의','소스놀이터', 10, 100000, '2023-01-28', ADD_MONTHS('2023-01-28', 10), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn)  
VALUES (myclassmain_seq.NEXTVAL, 'cosengcosa', 'AJ02', 'AJAX 다뤄보기', '코딩레시피', 6, 240000,'2023-01-30', ADD_MONTHS('2023-01-30', 6), 'N', 'Y');

commit;


SELECT mym_no, mym_mid, mym_code, mym_title, mym_name, mym_sdate, mym_edate, mym_done, mym_yn, video image
	FROM myclassmain, 
	(SELECT cs_group, cs_code, cs_video video
		FROM classsub)
	WHERE mym_mid = 'test01'
	AND mym_yn = 'Y'
	AND cs_code = CONCAT(LOWER(mym_code),'_01');


SELECT mym_code subTitle, count
FROM myclassmain,
(SELECT COUNT(mym_code) count
FROM myclassmain
WHERE SUBSTR(mym_code, 1,2) = 'JA')
WHERE SUBSTR(mym_code, 1,2) = 'JA';


SELECT 
    (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'JA') JA,
    (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'DB') DB,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'JS') JS,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'SP') SP,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'BS') BS,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'KT') KT,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE SUBSTR(mym_code, 1,2) = 'HL') HL,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'JQ') JQ,
     (SELECT COUNT(mym_code) count
    FROM myclassmain
    WHERE  mym_mid = 'test01'
    AND SUBSTR(mym_code, 1,2) = 'AJ') AJ
FROM dual;













