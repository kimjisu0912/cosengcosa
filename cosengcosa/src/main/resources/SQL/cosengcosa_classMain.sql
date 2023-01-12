-- 메인강의 테이블 생성
DROP SEQUENCE classmain_seq;
 CREATE SEQUENCE classmain_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

DROP TABLE classmain;
CREATE TABLE classmain(
	cm_no NUMBER(5)
        CONSTRAINT CM_NO_PK PRIMARY KEY, 	    -- 관리번호
    cm_code VARCHAR2(8 CHAR)
        CONSTRAINT CM_CODE_UK UNIQUE
        CONSTRAINT CM_CODE_NN NOT NULL,				    -- 강의코드
        
    cm_title VARCHAR2(100 CHAR) 
        CONSTRAINT CM_TITLE_NN NOT NULL,				    -- 강의명
        
    cm_name VARCHAR2(100 CHAR) 
        CONSTRAINT CM_NAME_NN NOT NULL,				    -- 사람이름
    cm_period NUMBER(5) 
        CONSTRAINT CM_PERIOD_NN NOT NULL,				    -- 수강기간
    cm_price NUMBER(8) 
        CONSTRAINT CM_PRICE_NN NOT NULL,				    -- 가격
    cm_count NUMBER(8)
        CONSTRAINT CM_COUNT_NN NOT NULL,                -- 조회수
    cm_recommend NUMBER(8) DEFAULT 0
         CONSTRAINT CM_RECOM_NN NOT NULL ,               -- 추천수
    cm_star NUMBER(1) DEFAULT 0
        CONSTRAINT CM_STAR_NN NOT NULL,				    -- 별점
 --   file1 VARCHAR2(100 CHAR),							-- file1
 --   video VARCHAR2(200 CHAR),							-- video
    cm_yn CHAR(1) CHECK (cm_yn IN('Y', 'N'))
        CONSTRAINT CM_YN_NN NOT NULL                    -- 삭제유무
);
-- content 넣어두자,,, char 최대로 



INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA01', '자바 기초 프로그래밍 강좌','동빈나', 3, 35000, 0, 0, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA03', '자바(JAVA)강의','홍드로이드' ,3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB03', '오라클(Oracle) 데이터 베이스(DataBase) 11g tutorials ','소프트캠퍼스', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB04', '오라클 기초 강좌','최용진', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB05', '오라클 PL/SQL','오라클 자바 커뮤니티', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS02', 'JavaScript 입문수업', '생활코딩',3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS03', '혼자공부하는 자바스크립트','윤인성', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP02', 'Springboot 강좌 - 개념정리','메타코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP03', '스프링 부트 게시판 무작정 따라하기', '한코딩',3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP04', 'Spring 5 for Beginner','나무소리', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS02', 'bootstrap','생활코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT02', '안드로이드(Android Kotlin)','홍드로이드', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT03', '[Do it! 깡샘의 안드로이드 앱 프로그래밍 with 코틀린] 동영상 강의','깡샘', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL01', '입문자를 위한 HTML 기초강의','유노코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL02', 'HTML/CSS 기초강의','수코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL03', 'HTML/CSS강의','짐코딩의 CODING GYM', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL04', 'HTML + CSS + JS 미니 프로젝트 실습(프론트엔드 개발자 입문편)','수코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ01', 'jQuery','Rocks Easyweb', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ02', 'jQuery Plugin','리베하얀', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ03', '예제로 배우는 jQuery강의','소스놀이터', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ01', 'WEB3-AJAX','생활코딩', 3, 35000, 1, 1, 4,'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_period, cm_price, cm_count, cm_recommend, cm_star, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ02', 'AJAX 다뤄보기', '코딩레시피', 3, 35000, 1, 1, 4,'Y');


commit;
select *from classmain;



SELECT
	    num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,
	    cmRecommend, cmStar, cmYn
	FROM    
	    (SELECT
	        ROWNUM num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,
	        cmRecommend, cmStar, cmYn
	    FROM 
	        (SELECT
	            cm_no AS cmNo,
	             AS cmId,
	            cm_code AS cmCode,
	            cm_name AS cmName,
	            cm_sdate AS cmSdate,
	            cm_edate AS cmEdate,
	            cm_price AS cmPrice,
	            cm_count AS cmCount,
	            cm_recommend AS cmRecommend,
	            cm_star AS cmStar,	       
	            cm_yn AS cmYn
	        FROM
            classmain
       WHERE
			cm_yn = 'Y'
         --   AND cm_name LIKE '%%'
        ) classmain
        ORDER BY cmNo DESC
    )
	WHERE num >=1 AND num <= 10
    ;
	
    
SELECT      num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,      cmRecommend, cmStar, cmYn  FROM          (SELECT          ROWNUM num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,          cmRecommend, cmStar, cmYn      FROM           (SELECT              cm_no AS cmNo,               AS cmId,              cm_code AS cmCode,              cm_name AS cmName,              cm_sdate AS cmSdate,              cm_edate AS cmEdate,              cm_price AS cmPrice,              cm_count AS cmCount,              cm_recommend AS cmRecommend,              cm_star AS cmStar,                      cm_yn AS cmYn          FROM             classmain         WHERE cm_yn = 'Y'          ) classmain         ORDER BY cmNo DESC     )  WHERE num   >= 1 AND num  <= 2;
