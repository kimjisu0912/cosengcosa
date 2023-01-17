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

drop table pay;

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
    cm_content VARCHAR2(4000 CHAR) 
        CONSTRAINT CM_CONTENT_NN NOT NULL,				    -- content(내용)
    cm_period NUMBER(4)
        CONSTRAINT CM_PERIOD_NN NOT NULL,				    -- 수강기간
    cm_price NUMBER(8) 
        CONSTRAINT CM_PRICE_NN NOT NULL,				    -- 가격
    cm_count NUMBER(8)
        CONSTRAINT CM_COUNT_NN NOT NULL,                -- 조회수
    cm_recommend NUMBER(8) DEFAULT 0
         CONSTRAINT CM_RECOM_NN NOT NULL ,               -- 추천수
    cm_star NUMBER(1) DEFAULT 0
        CONSTRAINT CM_STAR_NN NOT NULL,				    -- 별점
    file1 VARCHAR2(100 CHAR),							-- file1
    video VARCHAR2(200 CHAR),							-- video
    cm_yn CHAR(1) CHECK (cm_yn IN('Y', 'N'))
        CONSTRAINT CM_YN_NN NOT NULL                    -- 삭제유무
);
-- content 넣어두자,,, char 최대로 





INSERT INTO classmain (cm_no, cm_code, cm_title,  cm_name ,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA01', '자바 기초 프로그래밍 강좌', '동빈나','주로 기초 지식이 없는 사람들을 대상을 만든 자바 강의입니다.', 5, 200000, 0, 0, 1, null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩','자바기초강의', 5, 250000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA03', '자바(JAVA)강의','홍드로이드','자바강의입니다.' ,5, 180000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처','오라클 기초 강좌 입니다. ', 5, 150000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어','오라클조아', 5, 250000, 0, 0, 4, null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB03', '오라클(Oracle) 데이터 베이스(DataBase) 11g tutorials ','소프트캠퍼스','오라클 마스터', 5, 120000, 0, 0, 4, null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB04', '오라클 기초 강좌','최용진','오라클 초보자를 위한 기초 강좌 입니다. ', 5, 120000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB05', '오라클 PL/SQL','오라클 자바 커뮤니티','오라클 마스터를 목표로 힘냅시다', 5, 150000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마','자바스크립트 기초 강의와 중급용 강의가 있다. ', 5, 260000, 0, 0, 4, null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS02', 'JavaScript 입문수업', '생활코딩', '컨텐츠테스트', 5, 150000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS03', '혼자공부하는 자바스크립트','윤인성', '자바스크립트는 좋습니다.', 5, 150000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오','스프링 강좌입니다. 대략 20시간 안쪽으로 수업하고 있다.', 5, 200000, 0, 0, 4, null, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content,cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP02', 'Springboot 강좌 - 개념정리','메타코딩','스프링', 5, 220000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP03', '스프링 부트 게시판 무작정 따라하기', '한코딩','스프링 부트를 이용해 게시판 만드는 작업을 진행해 보자 ', 5, 110000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP04', 'Spring 5 for Beginner','나무소리','스프링 강좌', 5, 120000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌','부트스트랩 조아 ', 5, 100000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS02', 'bootstrap','생활코딩','부트스트랩으로 이전보다 더 나은 게시판을 만들어 봐요 ', 5, 220000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo','디모 조아', 5, 120000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT02', '안드로이드(Android Kotlin)','홍드로이드','안드로이드 강좌', 5, 250000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT03', '[Do it! 깡샘의 안드로이드 앱 프로그래밍 with 코틀린] 동영상 강의','깡샘','깡샘의 코틀린 강좌는 안드로이드 이론을 다루는 앱 프로그래밍 입니다.', 5, 120000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL01', '입문자를 위한 HTML 기초강의','유노코딩','기초지식이 없어 곤한하신가요?', 5, 100000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL02', 'HTML/CSS 기초강의','수코딩','기초기초기초', 5, 100000, 0, 0, 4, null, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'HL03', 'HTML/CSS강의','짐코딩의 CODING GYM','첫 코딩 어려우셨나요? 기초 강좌를 들으면서 실력을 쌓아가세요', 5, 120000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL04', 'HTML + CSS + JS 미니 프로젝트 실습(프론트엔드 개발자 입문편)','수코딩','코딩의 첫걸음! html과 css, js까지 패키지로 들을수 있습니다.', 5, 180000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ01', 'jQuery','Rocks Easyweb','제이쿼리 조아 ', 5, 200000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ02', 'jQuery Plugin','리베하얀','제이쿼리 강좌', 5, 200000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ03', '예제로 배우는 jQuery강의','소스놀이터','jquery어려웠나요? 소스놀이터에서 쉽게 가르쳐드립니다.', 5, 100000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ01', 'WEB3-AJAX','생활코딩','코딩 어려우신가요? 생활코딩에서 간단하게 잡아드립니다. ', 5, 220000, 0, 0, 4,null, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,file1, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ02', 'AJAX 다뤄보기', '코딩레시피','ajax를 배우고 싶다면?! 코딩레시피에서 함께 해요!', 5, 240000, 0, 0, 4,null, null, 'Y');


commit;
select * from classmain;
select *from classmain where cm_no = 59;



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
	
    select * from classsub;
    
    
    
select count(cm_code) from classmain;
select * from classsub;

    
SELECT      num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,      cmRecommend, cmStar, cmYn 
FROM          (SELECT          ROWNUM num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,          cmRecommend, cmStar, cmYn      
FROM           (SELECT              cm_no AS cmNo,               AS cmId,              cm_code AS cmCode,              cm_name AS cmName,              cm_sdate AS cmSdate,              cm_edate AS cmEdate,              cm_price AS cmPrice,              cm_count AS cmCount,              cm_recommend AS cmRecommend,              cm_star AS cmStar,                      cm_yn AS cmYn          FROM             classmain         WHERE cm_yn = 'Y'          ) classmain         ORDER BY cmNo DESC     )  WHERE num   >= 1 AND num  <= 2;
