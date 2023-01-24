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
drop table classsub;
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
    cm_count NUMBER(8) DEFAULT 0,                 -- 조회수
    cm_recommend NUMBER(8) DEFAULT 0,               -- 추천수
    cm_star NUMBER(1) DEFAULT 0, -- 별점
    video VARCHAR2(200 CHAR),							-- video
    cm_yn CHAR(1) CHECK (cm_yn IN('Y', 'N'))
        CONSTRAINT CM_YN_NN NOT NULL                    -- 삭제유무
);
-- content 넣어두자,,, char 최대로 

-- file



INSERT INTO classmain (cm_no, cm_code, cm_title,  cm_name ,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA01', '자바 기초 프로그래밍 강좌', '동빈나','주로 기초 지식이 없는 사람들을 대상을 만든 자바 강의입니다.', 5, 200000, 0, 0, 1, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩','자바에 대해 처음 배우시나요? 그렇다면 남궁성의 정석코딩으로 기초를 다져봅시다. ', 5, 250000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA03', '자바(JAVA)강의','홍드로이드','자바에 관해 알고싶다고요? 그렇다면 이 홍드로이드의 강의를 들으면 쉽고 재미있게 배우실수 있을겁니다. .' ,5, 180000, 0, 0, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처','오라클 기초 강좌 입니다. ', 5, 150000, 0, 0, 3, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어','오라클에대해 완전답파! 혼자서도 오라클을 깨우칠수 있도록 알차고 재밋게 구성되어 있습니다. ', 5, 250000, 0, 0, 1,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB03', '오라클(Oracle) 데이터 베이스(DataBase) 11g tutorials ','소프트캠퍼스','오라클에 대해 알고, 보다 쉽게 접근하기 위해 만들어졌습니다.', 5, 120000, 0, 0, 5,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB04', '오라클 기초 강좌','최용진','오라클 초보자를 위한 기초 강좌 입니다. ', 5, 120000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB05', '오라클 PL/SQL','오라클 자바 커뮤니티','데이터 베이스란 무엇일까요? 단순히 데이터를 넣고 통계하는 그런 프로그램일까요? 저희가 만든 강의를 통해서 오라클이란 어떤것인지, 어떤 프로', 5, 150000, 0, 0, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마','자바스크립트 기초 강의와 중급용 강의가 있다. ', 5, 260000, 0, 0, 3,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS02', 'JavaScript 입문수업', '생활코딩', '인터넷에서 항상 보는 사이트들의 대부분 코딩으로 이루어져 있습니다. 코딩이란 막연히 어려운것이 아닐까 할수 잇지만, 우리가 배울 코딩이 얼마나 친숙하고 재미있는지를 알려드리고자 합니다. ', 5, 150000, 0, 0, 1, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS03', '혼자공부하는 자바스크립트','윤인성', '자바스크립트, 왜 배워야 할까요? 그 이유는 전세계에서도 사용하는 대표적인 언어이기 때문입니다. 이 강의를 통해 전반적으로 자바스크립트에 대해 알아보는 시간을 가질수 있었으면 좋겠습니다.', 5, 150000, 0, 0, 5, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오','스프링 강좌입니다. 대략 20시간 안쪽으로 수업하고 있다.', 5, 200000, 0, 0, 5,  null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content,cm_period, cm_price, cm_count, cm_recommend, cm_star,video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP02', 'Springboot 강좌 - 개념정리','메타코딩','실전에 기반하여 만든 스프링강좌를 통해 스프링의 동작원리와 그 활용에 대해 배워 보도록 합시다.', 5, 220000, 0, 0, 3, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP03', '스프링 부트 게시판 무작정 따라하기', '한코딩','스프링 부트를 이용해 게시판 만드는 작업을 진행해 보자 ', 5, 110000, 0, 0, 3, null, 'Y');
INSERT INTO classmain (cm_no, cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP04', 'Spring 5 for Beginner','나무소리','스프링의 원리를 알아가면서 활용하는 방법에 대해 배워봅시다. ', 5, 120000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌','아직까지 힘들게 짜고 계신가요? 이것만 활용하면 3분만에 나만의 페이지를 뚝딱! 그 비법을 공개합니다. ', 5, 100000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS02', 'bootstrap','생활코딩','부트스트랩으로 이전보다 더 나은 게시판을 만들어 봐요 ', 5, 220000, 0, 0, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo','코틀린이란 무엇인가? 자바와 비슷하게 생긴듯 하면서 다른 알쏭달쏭한 코틀린을 배워보도록 합시다 ', 5, 120000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT02', '안드로이드(Android Kotlin)','홍드로이드','알기쉬운 안드로이드 강좌! ', 5, 250000, 0, 0, 1, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT03', '[Do it! 깡샘의 안드로이드 앱 프로그래밍 with 코틀린] 동영상 강의','깡샘','깡샘의 코틀린 강좌는 안드로이드 이론을 다루는 앱 프로그래밍 입니다.', 5, 120000, 0, 0, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL01', '입문자를 위한 HTML 기초강의','유노코딩','기초지식이 없어 곤한하신가요?', 5, 100000, 0, 0, 1, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL02', 'HTML/CSS 기초강의','수코딩','나만의 사이트를 만들어 보고싶으신가요? 지금 이 수업을 들으시면 당신도 웹페이지를 직접 만드실수 있습니다. 도전해보세요!', 5, 100000, 0, 0, 4,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'HL03', 'HTML/CSS강의','짐코딩의 CODING GYM','첫 코딩 어려우셨나요? 기초 강좌를 들으면서 실력을 쌓아가세요', 5, 120000, 0, 0, 2, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL04', 'HTML + CSS + JS 미니 프로젝트 실습(프론트엔드 개발자 입문편)','수코딩','코딩의 첫걸음! html과 css, js까지 패키지로 들을수 있습니다.', 5, 180000, 0, 0, 5, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ01', 'jQuery','Rocks Easyweb','쉽고 재밌고 간결한 제이쿼리를 이해하고 사용해 봅시다. ', 5, 200000, 0, 0, 2, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ02', 'jQuery Plugin','리베하얀','아직도 기다긴 코딩을 하시고 있나요? 이것만 있으면 짧은 코딩으로 해결! 제이쿼리에 대해 알아보아요.', 5, 200000, 0, 0, 5, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ03', '예제로 배우는 jQuery강의','소스놀이터','jquery어려웠나요? 소스놀이터에서 쉽게 가르쳐드립니다.이론만 나열하는 수업은 이제 끝! 본 강의는 실습과 더불어 예제를 통해 이해를 돕고, 어려운 부분을 공유함으로써 교육을 한층 더 좋게 만들려고 노력하고 있습니다. ', 5, 100000, 0, 0, 3, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ01', 'WEB3-AJAX','생활코딩','코딩 어려우신가요? 생활코딩에서 간단하게 잡아드립니다. ', 5, 220000, 0, 0, 3, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ02', 'AJAX 다뤄보기', '코딩레시피','ajax를 배우고 싶다면?! 코딩레시피에서 함께 해요!', 5, 240000, 0, 0, 3, null, 'Y');


commit;
select * from classsub;
select *from classmain ;



SELECT
	    num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
	   			 cmRecommend, cmStar,  video, cmYn
	FROM    
	    (SELECT
	        ROWNUM num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
	        cmRecommend, cmStar,  video, cmYn
	    FROM 
	        (SELECT
	            cm_no AS cmNo,
	            cm_code AS cmCode,
	            cm_title AS cmTitle,
	            cm_name AS cmName,
	            cm_content AS cmContent,
	            cm_period AS cmPeriod,
	            cm_price AS cmPrice,
	            cm_count AS cmCount,
	            cm_recommend AS cmRecommend,
	            cm_star AS cmStar,	
	            video AS video,	        
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
    
    commit;
    
select count(cm_code) from classmain;
select * from classsub;

    

