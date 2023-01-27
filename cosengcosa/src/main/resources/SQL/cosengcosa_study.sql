-- 시퀀스 생성
DROP SEQUENCE study_seq;
 CREATE SEQUENCE study_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE
       NOCACHE
       NOORDER;

desc study;

-- 지식공유 테이블 생성
DROP TABLE study;
CREATE TABLE study(
	s_no NUMBER(5)
        CONSTRAINT S_NO_PK PRIMARY KEY, 	    -- 관리번호			        				  
    s_title VARCHAR2(100 CHAR)                   -- 글 제목
        CONSTRAINT S_TITLE_NN NOT NULL,
    s_error VARCHAR2(500 CHAR)                  -- 오류코드
        CONSTRAINT S_ERR_NN NOT NULL,
    s_askcontent VARCHAR2(700 CHAR)            -- 글 내용
        CONSTRAINT S_CON_NN NOT NULL,
    s_askimg VARCHAR2(100 CHAR),                -- 이미지
    s_askid VARCHAR2(18 CHAR)                    -- 질문자 아이디
        CONSTRAINT S_AID_FK REFERENCES member(m_id)  --member 테이블이 없음
        CONSTRAINT S_AID_NN NOT NULL,
    s_count NUMBER(8)                           -- 조회수
        CONSTRAINT S_COUNT_NN NOT NULL,  
    s_recommend NUMBER(8)                       -- 추천수
        CONSTRAINT S_RECOM_NN NOT NULL,			        				  
    s_file VARCHAR2(100 CHAR),					-- file
    s_open CHAR(1) CHECK (s_open IN('Y', 'N')), -- 공개여부
    s_clear CHAR(1) CHECK (s_clear IN('Y', 'N')), -- 해결유무
    s_cdate TIMESTAMP                           -- 등록일자
       CONSTRAINT S_DATE_NN NOT NULL,
    s_yn CHAR(1) CHECK (s_yn IN('Y', 'N'))      -- 살제유무
        CONSTRAINT S_YN_NN NOT NULL                    
);

-- 지식공유 답변 시퀀스
DROP SEQUENCE studyAnswer_seq;
 CREATE SEQUENCE studyAnswer_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE
       NOCACHE
       NOORDER;

-- 지식공유 답변 테이블
DROP TABLE studyAnswer;
CREATE TABLE studyAnswer(
    sa_no NUMBER(5)
        CONSTRAINT SA_NO_PK PRIMARY KEY, 
    sa_num NUMBER(5)
        CONSTRAINT SA_NUM_FK REFERENCES study(s_no)
        CONSTRAINT SA_NUM_NN NOT NULL,
    sa_answer VARCHAR2(700 CHAR),               -- 답변
    sa_answerimg VARCHAR2(100 CHAR),
    sa_answerid VARCHAR2(18 CHAR)                 -- 답변자 아이디
        CONSTRAINT SA_ANID_FK REFERENCES member(m_id),
    sa_cdate TIMESTAMP                           -- 등록일자
        CONSTRAINT SA_DATE_NN NOT NULL
);


-- 답변 데이터
INSERT INTO studyAnswer (sa_no, sa_num, sa_answer, sa_answerimg, sa_answerid,sa_cdate)
    VALUES (studyAnswer_seq.NEXTVAL, '88', '제발 나와라', null, 'test01', '2023-01-15 15:02:12');

commit;


-- 지식공유 테이블 값 입력
-- 너무 많이 만들면 오류남!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- 80개 이하로 


INSERT INTO study (s_no,  s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn)
VALUES (study_seq.NEXTVAL, 'db 쿼리는 짜는데 ORA-02253 오류가 나요','sql command not properly ended', '테이블 생성을 하면서 제약 조건을 주는데 자꾸 오류가 나요ㅠㅠ', null,  'test01',  20,10,null,'Y','Y','2023-01-06 17:31:08','Y');
INSERT INTO study (s_no,  s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn)
VALUES (study_seq.NEXTVAL, 'spring에서 db데이터를 못 받아오는데 어떻게 하나요??','sql command not properly ended',  'sql문이 틀린건지 명칭을 잘못준건지 어디가 문제인지 잘 모르겠어요.... 고인물분들 도와주세요', null,  'test01',  15,7,null,'Y','Y','2022-11-14 13:24:22','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn)
VALUES (study_seq.NEXTVAL, 'HTML에서 블럭을 오른쪽으로 보내고 싶은데...','bad request 400',  '시작하지 일주일도 안되서 방법을 하나도 모르겠어요... ', null,  'test02', 30,12,null,'Y','Y','2023-01-02 22:20:05','Y');
INSERT INTO study (s_no,  s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn)
VALUES (study_seq.NEXTVAL, 'java를 다운 받으려는데 설치는 했는데 실행이 안됬읍니다.  ','sql command not properly ended',  '모르겠읍니다', null,  'test01', 59,15,null,'Y','Y','2023-01-02 13:33:55','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'python 처음 시작하는데 java랑 반복문 문법이 다른가요?','java.lang.nullpointerexception ',  'java하다가 처음 시작해봐서 하나도 모르겠네요 java랑 다른 점이 뭔가요', null, 'test01', 5,0,null,'Y','Y','2023-01-05 18:34:26','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'spring으로 게시판을 만드는데 대댓글을 만들다가 오류가 났어요.','서블릿 [appServlet]을(를) 위한 Servlet.init() 호출이 예외를 발생시켰습니다.',  '댓글은 ajax로 넘겨주고 컨트롤러도 따로 만들었습니다. mapper, controller, ajax 를 아무리 찾아봐도 모르겠습니다. ', null, 'test01', 42,26,null,'Y','Y','2023-01-16 12:35:16','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'javascript로 속성을 추가하고 싶은데 아무리 실행해봐도 반응이 없습니다ㅠㅠ','TypeError: X is not a function',  '어디서 문제인지 잘 모르겠습니다. 개인적으로는 오타라고 생각하는데 전혀 안 보입니다ㅠㅠ', null, 'test02', 30,22,null,'Y','Y','2023-01-23 11:55:46','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'db로 oracle을 사용 중 인데 테이블을 만들 때 null 허용으로 해줘도 자꾸 null이라고 오류가 나네요',']Could not set parameters for mapping 부적합한 열 유형:1111 에러',  '분명 계속 다시 null 허용으로 테이블을 다시 만들어줘도 null이라고 오류가 나네요', null, 'test01', 42,16,null,'Y','Y','2023-01-03 10:45:56','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'spring에서 파일업로드 기능을 구현하다가 오류가 나는데 해결 방법을 모르겠습니다','ERROR: com.cosengcosa.room.controller.MyAdvice - Exception 발생 : The current request is not a multipart request',  '파일은 넘어가는데 upload 폴더가 없어지거나 보내다가 오류가 납니다ㅠ ', null, 'test02', 50,36,null,'Y','Y','2023-01-15 16:15:26','Y');
INSERT INTO study (s_no, s_title, s_error, s_askcontent, s_askimg, s_askid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL, 'spring에서 데이터를 보내던 도중 int 형태가 bigdecimal 맞지 않다고 오류가 납니다','no constructor found in com.cosengcosa.room.domain.studyanswer matching [java.math.bigdecimal, java.math.bigdecimal, java.lang.string, java.lang.string, java.lang.string, oracle.sql.timestamp]',  '저런 테이블은 만든적이 없는데 어디서 부터 문제인지 감도 안 잡힙니다 살려주세요 ㅠㅠ  ', null, 'test01', 70,56,null,'Y','Y','2023-01-26 18:45:36','Y');


commit;
select * from study ORDER BY s_no ASC;




-- 검색쿼리
SELECT
    num, sNo,sTitle,sAskcontent, sAskimg,sAskid,sOpen,sCdate,sCount,sRecommend, sYn
FROM    
    (SELECT
        num, sNo,sTitle,sAskcontent, sAskimg, sAskid, sOpen,sCdate,sCount,sRecommend, sYn
    FROM 
        (
            SELECT
                ROWNUM num,
                s_no AS sNo,
                s_title AS sTitle,
                s_askcontent AS sAskcontent,
                s_askimg AS sAskimg,
                s_askid AS sAskid,
                s_open AS sOpen,
                s_cdate AS sCdate,
                s_count AS sCount,
                s_recommend AS sRecommend,
                s_file AS sFile,
                s_yn AS sYn
             FROM
                study
             WHERE
                s_yn = 'Y'
       ) study
    ORDER BY 
        sNo DESC
    )
WHERE num >=1 AND num <= 10
;


    SELECT 
		    COUNT(*) 
		FROM 
			study 
		WHERE 
			s_title LIKE '%' || 'db' || '%'	
        ;

SELECT * FROM study WHERE s_no = 5;


-- sNo,sCode,sTitle,sAskcontent, sAskimg, sAnswer,sAnswerimg,sAskid,sAnswerid, sOpen,sCdate,sCount,sRecommend, sYn