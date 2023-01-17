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

-- test01 수강강의
INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'JA01', '자바 기초 프로그래밍 강좌','동빈나', 3, 200000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01','JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩', 3, 250000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'JA03', '자바(JAVA)강의','홍드로이드' ,3, 180000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처', 3, 150000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (classmain_seq.NEXTVAL, 'test01', 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어', 3, 250000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마', 3, 260000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오', 3, 200000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌', 3, 100000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test01', 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo', 3, 120000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

-- test02 수강강의
INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'JA01', '자바 기초 프로그래밍 강좌','동빈나', 3, 200000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02','JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩', 3, 250000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'JA03', '자바(JAVA)강의','홍드로이드' ,3, 180000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처', 3, 150000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (classmain_seq.NEXTVAL, 'test02', 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어', 3, 250000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마', 3, 260000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오', 3, 200000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌', 3, 100000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo', 3, 120000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'DB03', '오라클(Oracle) 데이터 베이스(DataBase) 11g tutorials ','소프트캠퍼스', 3, 120000,sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'DB04', '오라클 기초 강좌','최용진', 3, 120000,sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

INSERT INTO myclassmain (mym_no, mym_mid, mym_code, mym_title, mym_name, mym_period, mym_price, mym_sdate, mym_edate, mym_done, mym_yn) 
VALUES (myclassmain_seq.NEXTVAL, 'test02', 'DB05', '오라클 PL/SQL','오라클 자바 커뮤니티', 3, 150000, sysdate, ADD_MONTHS(sysdate, 3), 'N', 'Y');

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













