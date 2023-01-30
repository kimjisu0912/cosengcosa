drop table ;



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
VALUES (classmain_seq.NEXTVAL, 'JA01', '자바 기초 프로그래밍 강좌', '동빈나','자바 개발자들을 위한 입문수업입니다. 자바에대한 기초적인 기본 문법부터 시작하여 다향한 내용을 공부할 예정입니다. 이 수업을 통해 학습자들은 올바른 자바 프로그래밍을 배우고 실무에서도 적용할수 있는 실습을 통해 실력이 향상될 것입니다.', 4, 200000, 0, 30, 1, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA02', '자바의 정석 기초편(2020최신)','남궁성의 정석코딩','자바의 정석 기초 자바강좌입니다. 자바를 공부하시는 자바 초보자들을 대상으로 진행하며, 기초적인 문법과 더불어 실제 클래스를 만들어 어떤식으로 작성하는 지 실습을 통해 강의를 보퉁하는 방식으로 진행하고 있습니다.', 5, 250000, 0, 65, 3, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JA03', '자바(JAVA)강의','홍드로이드','안녕하세요 홍드로이드입니다. 이번 강좌는 백엔드 프로그래머들을 위한 자바강의를 진행합니다. 구성으로는 잘 사용하는 java프로그램을 설치하고, 자바의 기본적인 문법의 설명과 더불어 실습을 통해 자바에 대해 이해하고 활용할수 있게 되는것이 이번 강좌의 목표입니다. 짧고 간결하게 준비하여 쉽고 재미있게 배울수 있을것이라 생각합니다.  ' ,6, 180000, 0, 15, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB01', '오라클(Oracle) SQL 강의 강좌','뉴렉처','오라클 SQL 학습, 왜 필요할까요? 오라클은 업계에서 가장 유명한 DBMS(DataBase Management System) 중 하나입니다. 오라클은 DBMS 관리를 위한 프로그래밍 언어, SQL을 통해 관리할 수 있습니다. 실력있는 자바 백엔드 웹 개발자 내지 데이터베이스를 잘 활용하는 개발자로 나아가기 위해서는 SQL을 통해 오라클을 다룰 줄 알아야 합니다. 특히 자바 백엔드 웹 개발자에게는 필수적인 발판이 될 과정입니다. ', 3, 150000, 0, 45, 3, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB02', '[SQL 기초강의] 혼자 공부하는 SQL(MySQL 8.0)','한빛미디어','어떻게 공부해야 할지 아직감이 잡히지 않으신가요? 학원에서 공부하기엔 너무 비싸고, 혼자공부하기엔 기초를 쌓기 어렵다 느끼시는 분들! 기초와 실습을 동시에 갖추고, DB의 개념적인 부분까지 싹 모아 완강후 나도 DB를 다룰줄 아는 사람이 될수 있습니다. ', 4, 240000, 0, 16, 1,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB03', '오라클(Oracle) 데이터 베이스(DataBase) 11g tutorials ','소프트캠퍼스','본 과정은 오라클 데이터베이스의 기본적인 부분을 다루고 있습니다. 보다 더 공부에 도움이 될수 있도록 직접 실습하면서 학습하고, 본 과정을 마치게 된다면 기초적인 부분부터 중급정도의 실력을 쌓아 나가실수 있을것이라 생각됩니다.  ', 2, 120000, 0, 112, 5,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB04', '오라클 기초 강좌','최용진','Oracle데이터 베이스를 이용해 SQL을 처음부터 시작하는 강좌입니다. SQL의 기초적인 문법부터 시작해서 SQL * plus에서만 활용할수 있는 문법 등 이론과 실습을 통해 기초능력을 강화할수 있도록 준비했습니다.  ', 6, 120000, 0, 75, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'DB05', '오라클 PL/SQL','오라클 자바 커뮤니티','이 코스는 데이터베이스를 조작하는 언어 SQL을 비즈니스에서 활용할수 있는 데이터 분석에 도움이 되는 스킬로써 공부합니다. 많은 데이터 베이스 중 인기가 아주 많은 오픈소스 데이터베이스 MySQL을 이용하고, 데이터베이스 서버를 컴퓨터에 인스톨 하는 방법을 배우며, SQL의 기본부터 시작해서 복잡한 SQL쿼리를 데이터베이스에 읽고 쓰기방식 까지 배울 수 있습니다. 이 강좌는 듣기만 하는 강좌가 아닌 실제로 SQL에 쓰이는 문장을 실제로 작성해보는 학습형태를 갖추고 있습니다.거기에 더해 강의의 내용 이해를 더 깊이 이해할수 있도록 중간 테스트도 준비되어 있습니다. 단, 이 코스는 SQL을 처음 접하는 분들이 중급자가 될수 있도록 준비된 강좌이니, 평소 SQL을 접하신 분들에게는 수강을 추천드리지 않습니다.', 5, 150000, 0, 49, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS01', '자바스크립트 기초 강좌 : 100분 완성 / 중급강좌 : 140분 완성','코딩앙마','약 2시간만 쓰면 기초탈출! JavaScript 를 초심자가 듣을수 있는 기초 강좌와 중급자들이 듣는 중급강좌로 나누어 준비했습니다. 중급자분들의 경우 바로 중급으로 넘어가도 괜찮지만, JavaScript가 처음이신 분들은 기초 강좌를 먼저 듣고 들어주시면 감사드립니다. 총 4시간으로 구성되어 있습니다.  ', 4, 260000, 0, 52, 3,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS02', 'JavaScript 입문수업', '생활코딩', 'html/css와 더불어 이벤트를 주는데에 꼭 필요한 JavaScript강좌입니다. 프론트엔드와 백엔드 어느곳에도 잘 사용하는 언어로 여러분들이 필수적으로 들어야 할 언어라 생각합니다. 이번 강좌에서는 기초적인 용어설명과 문법, 그리고 다양한 이벤트를 주는 방법등등 실습을 통해 능력을 길러 최종적으로는 HTML로 만든 web사이트에 다양한 이벤트를 줄수 있는것이 이번 목표과제입니다.  ', 3, 150000, 0, 16, 1, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code, cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JS03', '혼자공부하는 자바스크립트','윤인성', '혼자 공부하고 싶어하시는 분들을 위한 자바스크립트 강좌입니다. 본 강의는 서적을 통한 기초적인 이론과 문법, 그리고 실습을 통해 다양한 이벤트를 주어 HTML에 적용하는것을 목표로 하고 있습니다. ', 5, 150000, 0, 84, 5, null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star,  video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP01', '스프링부트(Spring Boot) 강의','어라운드 허브 스튜디오','springboot 강좌입니다. 본 강좌는 기본적인 프로잭트의 생성과 구조에 대해 알고, MVC패턴이란 무엇인지, REST API는 무엇인지 전체적으로 이론에 비중을 두고 있습니다. 중간중간 실습을 해보기도 하지만, spring의 전반적인 이해를 위한 이론의 비중이 커 spring에대해 기초가 부족하신 분들, 혹은 spring을 배웠지만 복습과 더불어 깊이 공부해 보고 싶으신 분들을 대상으로 구성하고 있습니다. ', 4, 200000, 0, 123, 5,  null, 'Y');
INSERT INTO classmain (cm_no,  cm_code,cm_title, cm_name,cm_content,cm_period, cm_price, cm_count, cm_recommend, cm_star,video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP02', 'Springboot 강좌 - 개념정리','메타코딩','본 과정은 자바 프로그래밍을 기초로 Spring Framework에 대한 개념과 용어, 동작에 대해 집중해서 학습할 수 있습니다. 그렇기에 Spring boot학습하기에 앞서 Spring MVC project 를 학습하시고 정확한 개념과 동작원리를 이해하신 후에 들어주시면 좋겠습니다.', 10, 220000, 0, 87, 3, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP03', '스프링 부트 게시판 무작정 따라하기', '한코딩','안녕하세요 한코딩입니다. 이번 강좌는 스프링 부트를 이용한 게시판만들기를 진행합니다. 어렵게 구성하기 보다는 모두가 쉽고 재밋게 접할 수 있도록 최대한 간단하게 구성하였기에 크게 부담감을 가지실 필요는 없을것이라 생각합니다. ', 6, 110000, 0, 56, 3, null, 'Y');
INSERT INTO classmain (cm_no, cm_code, cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'SP04', 'Spring 5 for Beginner','나무소리','초보자들을 위한 spring 강좌입니다. 프로젝트의 기본개념부터 시작하여 Spring Framework, Spring MVC, Spring Boot, Spring Data JPA 등등 이러한 개념적인 부분을 짚고 넘어가는 강의입니다. 이후 이론을 통해 실제로 프로그래밍하여 어떻게 진행하는지 짧게 공부합니다. ', 6, 120000, 0, 77, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS01', '부트스트랩 실전강좌(Bootstrap tutoial)','온코딩빠찌','아직도 직접 css값을 줘서 작성하시나요? 이것만 있으면 당신도 1분이면 페이지 작성완료! 부트스트랩에 대해 궁금하시다면 같이 배워보시는건 어떠신가요? 페이지를 들어가서 직접 설명하고 함께 작성하여 초보자도 따라할수 있습니다. ', 2, 100000, 0, 88, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'BS02', 'bootstrap','생활코딩','뷰를 작성하는데 시간이 오래 걸리지 않으신가요? 그렇다면 이 부트스트랩을 한번 들어보세요! 당신의 시간을 절약해 주는 데 요긴하게 사용할 것이라 생각합니다. 본 강좌는 부트스트랩에 대한 설명으로 기본적으로 HTML/CSS강좌를 들었던 분들을 대상으로 진행하고 있습니다. 잘 이해가 안될수도 있기에 만일 처음배우시는 분들은 먼저 HTML기초 강좌를 수강하고 들어주시면 감사합니다. ', 8, 220000, 0, 99, 2, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT01', '디모의 Kotlin 강좌','테크과학!DiMo','이 동영상은 프로그래밍을 처음 접하신 분들을 위한 코틀린 강좌입니다. 코틀린은 2011년 7월에 처음 나온 새로운 언어로, 문법도 지금까지의 프로그래밍 언어의 노하우가 담긴 훌륭한 언어로 되어있습니다. 그리고 자바와 완전 호완이 가능해 배워두신다면 분명 도움이 될것이라 생각하고 있습니다. 그리고 본 강좌를 위해 자바를 들어보시면 좋지만, 그렇지 않더라도 쉽게 접근할 수 있도록 쉽게 강의하고 있습니다.  ', 5, 120000, 0, 79, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT02', '안드로이드(Android Kotlin)','홍드로이드','안녕하세요, 홍드로이드입니다. 이번 강좌에서는 안드로이드를 개발하는데에 중요한 코틀린에 대해 강의를 하려고 합니다. 자바와 비슷하게 되어있는 코틀린은, 자바와 비교해서 크게 다르지 않아 조금만 배운다면 금방 이해하게 되실거라 생각합니다. 이번 강좌에서는 깊게 들어가기 보다는 안드로이드와 관련해서 가볍게 들어갈 예정입니다. 따라서 자바를 공부하신 적이 없더라도 가볍게 들어주시면 감사드립니다.  ', 5, 250000, 0, 19, 1, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'KT03', '[Do it! 깡샘의 안드로이드 앱 프로그래밍 with 코틀린] 동영상 강의','깡샘','이 강좌는 앱 프로그래밍의 코틀린을 중심으로 강좌를 진행하고 있습니다. 처음 프로그래밍에 접하시거나, 앱 프로그래밍을 배워보고 싶은 분들 모두 이 강좌를 끝까지 듣고 나신다면 분명 간단한 앱을 만드실수 있으시리라 생각듭니다. 그외 강의에 대해 잘 모르시거나, 질문이 있으시다면 커뮤니티에 글을 올려주시면 감사드립니다. ', 6, 120000, 0, 46, 4, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL01', '입문자를 위한 HTML 기초강의','유노코딩','안녕하세요, 유노코딩입니다. 이번 강좌에서는 정말로 순수하게 프로그래밍에 대해 잘 모르는 사람들을 위한 기초강의를 준비했습니다. HTML을 통해 프로그래밍이란 무엇인지를 이해하고, 직접 같이 따라해 보아 실전 연습에도 도움이 될수 있도록 구성하고 있습니다. 흥미가 있으신 분들은 같이 공부해 봅시다. ', 2, 100000, 0, 98, 1, null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL02', 'HTML/CSS 기초강의','수코딩','프로그래밍에 대해 처음 배우시나요? 이번 강좌는 프로그래밍의 첫 시작이라고도 할 수 있는 HTML과 CSS에 대해 쉽게 배워봅니다. 물론 이론뿐이 아닌 실제로 페이지를 제작해 봄으로써 몸에 익힐 수 있도록 구성하고 있습니다.', 2, 100000, 0, 100, 4,  null, 'Y');
INSERT INTO classmain (cm_no, cm_code,cm_title, cm_name, cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'HL03', 'HTML/CSS강의','짐코딩의 CODING GYM','HTML이나 CSS의 기초와 코딩의 흐름을 배우면서 강사와 함께 심플한 웹페이지를 제작합니다. 내용면에서 아주 기초적인 내용이므로, 주로 지식이 없는 분들이 배우시는 것을 추천드립니다. ', 3, 120000, 0, 72, 2, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'HL04', 'HTML + CSS + JS 미니 프로젝트 실습(프론트엔드 개발자 입문편)','수코딩','본 강좌는 주로 프론트엔드에 집중되어 있는 HTML과 CSS, JavaScript 를 전부 들을 수 있는 종합과목으로 구성되어 있습니다. 실습을 하면서 진행하며, 본 강좌를 완강하시게 된다면, 간단한 사이트를 스스로 만들어 내며, 다른 사람들이 만든 페이지조차 이해할수 있게 되며 간단하게 변경하거나 제작 하실수 있을것입니다. ', 6, 180000, 0, 78, 5, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ01', 'jQuery','Rocks Easyweb','Jquery강좌를 통해 JavaScript와 어떤 점이 다르고 어떤이점이 있는지 이론적 공부와, 실제로 작성해 보면서 Jquery란 무엇인지 알아보도록 합시다. 다소 어려울 수 있는 강좌이므로 우선적으로 JavaScript를 공부하고 들었으면 합니다. ', 4, 200000, 0, 101, 5, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn)  
VALUES (classmain_seq.NEXTVAL, 'JQ02', 'jQuery Plugin','리베하얀','이번 강좌는 간단하게 제이쿼리에 대해 알아보겠습니다. 기초적인 이론과 더불어 실제 실무에서도 사용하는 기술들을 실습을 통해 배워보도록 하겠습니다. ', 10, 200000, 0, 132, 5, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'JQ03', '예제로 배우는 jQuery강의','소스놀이터','이번 강좌는 jQuery를 배우기 위해 알기 쉽게 예시를 들어 강의를 진행하려고 합니다. 또한 이번 강좌는 기초부터 설명하고 있어 강의를 수강하신다면 jQuery를 이용하여 페이지에 다양한 이벤트를 주거나, 깔끔한 기능을 줄수있는 능력을 기를수 있습니다.', 10, 100000, 0, 50, 3, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ01', 'WEB3-AJAX','생활코딩','본 강좌는 AJAX수업입니다. ajax는 자바스크립트와 비슷하면서도 ajax는 자바스크립트에서는 부족했던 효율적으로 웹서버에 정보를 요청하여 부분적으로 정보를 갱신해주는 기술입니다. 그래서 이런 ajax라는 기술이 무엇인지, 그리고 더 나아가서는 웹 애플리케이션이 어떻게 나아가는지를 하나씩 하나씩 밟아가며 배워보도록 합시다. 본 강좌는 자바스크립트를 기반으로 수업을 나가기에, 자바스크립트를 모르시는 분들은 반드시 자바스크립트를 수강하시고 오시는것을 권고합니다.', 4, 220000, 0, 100, 3, null, 'Y');
INSERT INTO classmain (cm_no , cm_code,cm_title, cm_name,cm_content, cm_period, cm_price, cm_count, cm_recommend, cm_star, video, cm_yn) 
VALUES (classmain_seq.NEXTVAL, 'AJ02', 'AJAX 다뤄보기', '코딩레시피','이메일 또는 아이디 중복확인, 댓글처리 등에 사용하는 비동기 통신방식인 ajax에 대한 내용을 다룹니다. 이번 강좌를 통해서 front페이지에서 ajax의 요청방법이나 javaScript로 어떻게 활용하는지 등등 이론과 실습을 통해 배워보도록 하겠습니다.', 6, 240000, 0, 62, 3, null, 'Y');


commit;

select *from classmain ;

select cm_code, cm_period from classmain;

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






---------------------------------------------------------------------------------
SELECT COUNT(b.cs_video) as cmVideo FROM
			classmain a,
			classsub b
		WHERE
			a.cm_code = b.cs_group
			AND a.cm_code = 'AJ01'
			AND b.cs_code = (SELECT MIN(cs_code) FROM classsub
			WHERE cs_group = 'AJ01');
 --------------------------------------------------------------------------------------           

   

 SELECT
       num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
       cmRecommend, cmStar, video, cmYn, csVideo
   FROM  
        (SELECT
           ROWNUM num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
           cmRecommend, cmStar, video, cmYn, csVideo
       FROM        
           (SELECT
                   a.cm_no AS cmNo,
                   a.cm_code AS cmCode,
                   a.cm_title AS cmTitle,
                   a.cm_name AS cmName,
                   a.cm_content AS cmContent,
                   a.cm_period AS cmPeriod,
                   a.cm_price AS cmPrice,
                   a.cm_count AS cmCount,
                   a.cm_recommend AS cmRecommend,
                   a.cm_star AS cmStar,   
                   a.video AS video,           
                   a.cm_yn AS cmYn,
                   b.cs_video As csVideo
                
            FROM
                classmain a, classsub b
            WHERE
             cm_yn = 'Y'
             AND  a.cm_code = b.cs_group
             AND b.cs_code = (SELECT MIN(cs_code) FROM classsub WHERE cs_group = a.cm_code )
             AND a.cm_title LIKE '%%'
             ORDER BY  a.cm_no DESC
             )classmain
         ORDER BY num 
         )
         WHERE num  >=1 AND num <= 10
         ;
   --------------------------------------------------------------------------------------      
         SELECT
	     num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
       cmRecommend, cmStar, video, cmYn, csVideo
	FROM    
	    (SELECT
	        ROWNUM num, cmNo, cmCode, cmTitle, cmName, cmContent, cmPeriod, cmPrice, cmCount,
           cmRecommend, cmStar, video, cmYn, csVideo
	    FROM 
	        (SELECT
	               a.cm_no AS cmNo,
                   a.cm_code AS cmCode,
                   a.cm_title AS cmTitle,
                   a.cm_name AS cmName,
                   a.cm_content AS cmContent,
                   a.cm_period AS cmPeriod,
                   a.cm_price AS cmPrice,
                   a.cm_count AS cmCount,
                   a.cm_recommend AS cmRecommend,
                   a.cm_star AS cmStar,   
                   a.video AS video,           
                   a.cm_yn AS cmYn,
                   b.cs_video As csVideo
	        FROM
            classmain a, classsub b
       where
			cm_yn = 'Y'
	 		
	 		AND a.cm_code = b.cs_group
            AND b.cs_code = (SELECT MIN(cs_code) FROM classsub WHERE cs_group = a.cm_code )
	 	
		 	ORDER BY cm_no DESC
        ) classmain 
        ORDER BY num 
    )
	WHERE num>=1 AND num <=10;
