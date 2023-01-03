
-- system/jennie 계정으로 접속후 사용
-- 신규계정생성
CREATE USER cosengcosa
IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 접속, 테이블 시퀀스등 데이터사용권한, DBA권한 주기
GRANT CONNECT TO cosengcosa;
GRANT RESOURCE TO cosengcosa;
GRANT DBA TO cosengcosa;

-- =========================================================================================

-- 테스트용 및 참고용
-- 시퀀스 생성
DROP SEQUENCE classmain_seq;
 CREATE SEQUENCE classmain_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 메인강의 테이블 생성
DROP TABLE classmain;
CREATE TABLE classmain(
	cm_no NUMBER(5)
        CONSTRAINT CM_NO_PK PRIMARY KEY, 	    -- 관리번호
    cm_id VARCHAR2(8 CHAR) 
        CONSTRAINT CM_ID_UK UNIQUE
        CONSTRAINT CM_ID_NN NOT NULL,			        -- 강의id cm_id VARCHAR(8) NOT NULL UNIQUE, 보류
    cm_code VARCHAR2(8 CHAR) 
        CONSTRAINT CM_CODE_NN NOT NULL,				    -- 강의코드
    cm_name VARCHAR2(100 CHAR) 
        CONSTRAINT CM_NAME_NN NOT NULL,				    -- 강의명
    cm_sdate TIMESTAMP 
        CONSTRAINT CM_SDATE_NN NOT NULL,				    -- 시작일
    cm_edate TIMESTAMP 
        CONSTRAINT CM_EDATE_NN NOT NULL, 				-- 종료일
    cm_price NUMBER(8) 
        CONSTRAINT CM_PRICE_NN NOT NULL,				    -- 가격
    cm_count NUMBER(8) CONSTRAINT MB_MAIL_NN NOT NULL,  -- 조회수
    cm_recommend NUMBER(8) 
        CONSTRAINT CM_RECOM_NN NOT NULL,			        -- 추천수
    cm_star NUMBER(1) 
        CONSTRAINT CM_STAR_NN NOT NULL,				    -- 별점
    file1 VARCHAR2(100 CHAR),							-- file1
    video VARCHAR2(200 CHAR),							-- video
    cm_yn CHAR(1) CHECK (cm_yn IN('Y', 'N'))
        CONSTRAINT CM_YN_NN NOT NULL                    -- 삭제유무
);

select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a;

INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES 
(classmain_seq.NEXTVAL,
(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a),
'ja01', 
'자바를 잡아라~!', 
'2017-12-01 09:00:00', 
'2017-12-20 12:00:00', 
35000,
1, 
1, 
4, 
null,
null,
'Y');


-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'ja01', '자바를 잡아라~!', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 35000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'ja02', '자바를 내친구~!', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'ja03', '자바의 정석', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'DB01', 'SQL 문법을 이해하자~!', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 55000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'DB02', 'MySQL활용', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'DB03', '마리아 디비의 학습', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'jq01', 'Jquery의 학습', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 55000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'js01', 'JavaScript 활용', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'HL01', 'HTML5학습', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'cs01', 'css3의 기초지식', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'jp01', 'JSP 2.0', '2018-03-01 09:00:00', '2018-03-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_no, cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL,(select 'cm'||TO_CHAR(max(a.cm_no) + 1) from classmain a), 'sp01', 'spring4', '2018-04-01 09:00:00', '2018-04-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');

commit;
select * from classmain ORDER BY cm_no DESC;

-- 검색쿼리
SELECT
	cm_no AS cmNo,
    cm_id AS cmId,
    cm_code AS cmCode,
    cm_name AS cmName,
    cm_sdate AS cmSdate,
    cm_edate AS cmEdate,
    cm_price AS cmPrice,
    cm_count AS cmCount,
    cm_recommend AS cmRecommend,
    cm_star AS cmStar,
    file1 AS file1,
    video AS video,
    cm_yn AS cmYn
FROM
	classmain
WHERE
 cm_yn = "Y"
AND cm_name LIKE CONCAT('%', "", '%')
ORDER BY cmNo DESC
LIMIT 1, 10;

-- 이건 쿼리 테스트 한거임
SELECT concat('cm','',MAX(a.cm_no)) FROM classmain a;
(select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a);


SELECT 
			no,
			title,
			writer,
			content,
			reg_date AS regDate,
			read_count AS readCount,
			pass,
			file1
		FROM springbbs
        WHERE
        title LIKE CONCAT('%', "", '%')
        ;