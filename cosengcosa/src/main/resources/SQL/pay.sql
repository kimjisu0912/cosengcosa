
-- 결재
-- 시퀀스 생성
DROP SEQUENCE pay_seq;
 CREATE SEQUENCE pay_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 결재 테이블 생성
DROP TABLE pay;
CREATE TABLE pay(
	p_no NUMBER(5)
        CONSTRAINT P_NO_PK PRIMARY KEY, 	    -- 관리번호
    p_id VARCHAR2(8 CHAR) 
        CONSTRAINT P_ID_UK UNIQUE
        CONSTRAINT P_ID_NN NOT NULL,			 -- id NOT NULL UNIQUE, 보류
    p_mid VARCHAR2(18 CHAR) 
       -- CONSTRAINT P_MID_FK REFERENCES member(m_id) -- 개발을 위해 잠시 주석처리
        CONSTRAINT P_MID_NN NOT NULL,			-- 회원id
    p_cmno NUMBER(5)
       -- CONSTRAINT P_CMNO_FK REFERENCES classmain(cm_no) -- 개발을 위해 잠시 주석처리
        CONSTRAINT P_CMNO_NN NOT NULL,          -- 메인강의no
    p_cmcode VARCHAR2(8 CHAR) 
        CONSTRAINT P_CMCODE_NN NOT NULL,	    -- 결재(메인)강의코드
    p_cname VARCHAR2(100 CHAR)           
        CONSTRAINT P_CNAME_NN NOT NULL,         -- 결재(메인)강의이름
    p_chk CHAR(1) DEFAULT 'Y'
        CHECK (p_chk IN('Y', 'N'))
        CONSTRAINT P_CHK_NN NOT NULL,           -- 결재유무
    p_price NUMBER(8) 
        CONSTRAINT P_PRICE_NN NOT NULL,		    -- 결재가격
    p_cdate TIMESTAMP
        CONSTRAINT P_CDATE_NN NOT NULL,		    -- 결재일
    p_yn CHAR(1) CHECK (p_yn IN('Y', 'N'))
        CONSTRAINT P_YN_NN NOT NULL             -- 삭제유무
);

select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a;

-- 결재 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'JA01', 'java 입문수업', 'Y', 30000, '2021-12-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'JA02', '남궁성의 정석코딩', 'Y', 23000, '2022-01-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)', 'Y', 15000, '2022-01-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'BS02', 'bootstrap', 'Y', 18000, '2022-01-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'HL01', '입문자를 위한 HTML 기초강의', 'Y', 16000, '2022-01-23 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'HL02', 'html/css 기초강의 - 프론트엔드 개발자 입문편', 'Y', 17000, '2022-01-23 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn)
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'DB01', '오라클(Oracle) SQL 강의 강좌', 'Y', 43000, '2022-02-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)', 'Y', 33000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌', 'Y', 13000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'JS02', 'JavaScript 입문수업', 'Y', 22000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'SP01', '스프링부트(Spring Boot) 강의', 'Y', 31000, '2022-04-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test01', 1, 'SP02', 'Springboot 강좌 - 개념정리', 'Y', 25000, '2022-04-02 11:00:00', 'Y');

INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'HL01', '입문자를 위한 HTML 기초강의', 'Y', 16000, '2021-11-23 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'HL02', 'html/css 기초강의 - 프론트엔드 개발자 입문편', 'Y', 17000, '2021-11-23 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JA01', 'java 입문수업', 'Y', 30000, '2021-12-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JA02', '남궁성의 정석코딩', 'Y', 23000, '2022-01-11 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)', 'Y', 15000, '2022-01-11 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'BS02', 'bootstrap', 'Y', 18000, '2022-01-13 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn)
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'DB01', '오라클(Oracle) SQL 강의 강좌', 'Y', 43000, '2022-02-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)', 'Y', 33000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌', 'Y', 13000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JS02', 'JavaScript 입문수업', 'Y', 22000, '2022-03-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'SP01', '스프링부트(Spring Boot) 강의', 'Y', 31000, '2022-04-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'SP02', 'Springboot 강좌 - 개념정리', 'Y', 25000, '2022-04-02 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JQ01', 'jQuery', 'Y', 21000, '2022-04-22 11:00:00', 'Y');
INSERT INTO pay (p_no, p_id, p_mid, p_cmno, p_cmcode, p_cname, p_chk, p_price, p_cdate, p_yn) 
VALUES (pay_seq.NEXTVAL,(select 'p'||TO_CHAR(NVL(max(a.p_no)+1 ,1)) from pay a), 'test02', 1, 'JQ03', '예제로 배우는 jQuery강의', 'Y', 27000, '2022-04-22 11:00:00', 'Y');


commit;
select * from pay ORDER BY p_no DESC;


-- 검색쿼리
SELECT
	    num, pNo, pId, pMid, pCmno, pCmcode, pCname, pChk, pPrice, pCdate, pYn
	FROM    
	    (SELECT
	        ROWNUM num, pNo, pId, pMid, pCmno, pCmcode, pCname, pChk, pPrice, pCdate, pYn
	    FROM 
	        (SELECT
	            p_no AS pNo,
	            p_id AS pId,
	            p_mid AS pMid,
	            p_cmno AS pCmno,
	            p_cmcode AS pCmcode,
                p_cname AS pCname,
	            p_chk AS pChk,
	            p_price AS pPrice,
	            p_cdate AS pCdate,
	            p_yn AS pYn
	        FROM
            pay
			WHERE
            p_yn = 'Y'
            AND p_mid LIKE '%%'
            AND p_cname LIKE '%%'
            AND TO_CHAR(p_cdate, 'YYYYMMDD') >= '20190101'
        ) pay
        ORDER BY pNo DESC
    )
	WHERE num>=1 AND num <= 10
    ;
    
    