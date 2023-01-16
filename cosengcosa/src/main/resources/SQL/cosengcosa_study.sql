
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
DROP SEQUENCE study_seq;
 CREATE SEQUENCE study_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 메인강의 테이블 생성
DROP TABLE study;
CREATE TABLE study(
	s_no NUMBER(5)
        CONSTRAINT S_NO_PK PRIMARY KEY, 	    -- 관리번호			        
    s_code VARCHAR2(8 CHAR)                     -- 분류코드
        CONSTRAINT S_CODE_NN NOT NULL,				  
    s_title VARCHAR2(50 CHAR)                   -- 글 제목
        CONSTRAINT S_TITLE_NN NOT NULL,
    s_error VARCHAR2(50 CHAR)
        CONSTRAINT S_ERR_NN NOT NULL,
    s_askcontent VARCHAR2(700 CHAR)            -- 글 내용
        CONSTRAINT S_CON_NN NOT NULL,
    s_askimg VARCHAR2(10 CHAR),                -- 이미지
    s_answer VARCHAR2(700 CHAR),               -- 답변
    s_answerimg VARCHAR2(10 CHAR),             -- 답변이미지
    s_askid VARCHAR2(8 CHAR)                    -- 질문자 아이디
        CONSTRAINT S_AID_FK REFERENCES member(m_id)  --member 테이블이 없음
        CONSTRAINT S_AID_NN NOT NULL,
    s_answerid VARCHAR2(8 CHAR)                 -- 답변자 아이디
        CONSTRAINT S_ANID_FK REFERENCES member(m_id),
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

--s_no,s_code ,s_title, s_askcontent,s_askimg ,s_answer,s_answerimg,s_askid,s_answerid,s_count,s_recommend,s_file,s_open, s_cdate,s_yn

select 'cm'||TO_CHAR(nvl(max(a.cm_no)+1,1)) from classmain a;

INSERT INTO study (s_no, s_id, s_code, s_title, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend, s_star, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES 
(study_seq.NEXTVAL,
(select 's'|| TO_CHAR(nvl(max(a.s_no)+1,1)) from study a),
'ja01', 
'db 쿼리는 짜는데 ORA-02253 오류가 나요', 
'테이블 생성을 하면서 제약 조건을 주는데 자꾸 오류가 나요ㅠㅠ', 
null, 
'중간에 이름이 겹친게 하나 있네요. 한번 삭제 해보세요~~~',
null, 
'응애개발자', 
'썩은물', 
20,
10,
4,
null,
'Y',
'Y',
'2023-01-06 17:31:08',
'Y');


-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 40번만 컨트롤 시프트 엔터로 하자
INSERT INTO study (s_no, s_code, s_title, s_error, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL,'ja01', 'db 쿼리는 짜는데 ORA-02253 오류가 나요','sql command not properly ended', '테이블 생성을 하면서 제약 조건을 주는데 자꾸 오류가 나요ㅠㅠ', null, '중간에 이름이 겹친게 하나 있네요. 한번 삭제 해보세요~~~', null, 'test01', 'test02', 20,10,null,'Y','Y','2023-01-06 17:31:08','Y');
INSERT INTO study (s_no, s_code, s_title, s_error, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL,'ja02', 'spring에서 db데이터를 못 받아오는데 어떻게 하나요??','sql command not properly ended',  'sql문이 틀린건지 명칭을 잘못준건지 어디가 문제인지 잘 모르겠어요.... 고인물분들 도와주세요', null, 'sql문에 띄어쓰기 하셧나요? 띄어쓰기를 하지 않으면 오류가 납니다!!', null, 'test01', 'test02', 15,7,null,'Y','Y','2022-11-14 13:24:22','Y');
INSERT INTO study (s_no, s_code, s_title,s_error,  s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL,'ja03', 'HTML에서 블럭을 오른쪽으로 보내고 싶은데...','sql command not properly ended',  '시작하지 일주일도 안되서 방법을 하나도 모르겠어요... ', null, '태그에 style속성을 주고 float:right을 주면 됩니다.', null, 'test02', 'test01', 30,12,null,'Y','Y','2023-01-02 22:20:05','Y');
INSERT INTO study (s_no,  s_code, s_title, s_error, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend,  s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL,'ja04', 'java를 다운 받으려는데 설치는 했는데 실행이 안됬읍니다.  ','sql command not properly ended',  '모르겠읍니다', null, '어후 틀딱 이것도 못하냐 java만 다운 받으면 안되고 jdk라고 검색받고 깔고 다시해봐', null, 'test01', 'test02', 99,55,null,'Y','Y','2023-01-02 13:33:55','Y');
INSERT INTO study (s_no, s_code, s_title, s_error, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_count, s_recommend, s_file, s_open, s_clear, s_cdate, s_yn) 
VALUES (study_seq.NEXTVAL,'ja05', '님들 오늘 신도림역에서 지갑 잃어버림 보신 분?','sql command not properly ended',  '제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발제발', null, '이건 뭐하는 놈이냐 ㅋㅋㅋㅋㅋ ', null, 'test01', 'test02', 5,0,null,'Y','Y','2023-01-05 18:34:26','Y');

commit;
select * from study ORDER BY s_no DESC;




-- 검색쿼리
SELECT
	    num, sNo,sCode,sTitle,sAskcontent, sAskimg, sAnswer,sAnswerimg,sAskid,sAnswerid, sOpen,sCdate,sCount,sRecommend, sYn
	FROM    
	    (SELECT
	        ROWNUM num, sNo,sCode,sTitle,sAskcontent, sAskimg, sAnswer,sAnswerimg,sAskid,sAnswerid, sOpen,sCdate,sCount,sRecommend, sYn
	    FROM 
	        (SELECT
	            s_no AS sNo,
	            s_code AS sCode,
	            s_title AS sTitle,
                s_askcontent AS sAskcontent,
                s_askimg AS sAskimg,
                s_answer AS sAnswer,
                s_answerimg AS sAnswerimg,
                s_askid AS sAskid,
                s_answerid AS sAnswerid,
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
        ORDER BY sNo ASC
    )
	WHERE num>=1 AND num <= 10
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