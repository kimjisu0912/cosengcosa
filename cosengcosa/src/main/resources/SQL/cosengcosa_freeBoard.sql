

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
DROP SEQUENCE freeboard_seq;
 CREATE SEQUENCE freeboard_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 메인강의 테이블 생성
DROP TABLE freeboard;
CREATE TABLE freeboard(
	f_no NUMBER(8)                                      -- 분류번호
        CONSTRAINT F_NO_PK PRIMARY KEY, 
    f_title VARCHAR2(30 CHAR)                           -- 제목
        CONSTRAINT F_TITLE_NN NOT NULL,
    f_content VARCHAR2(700 CHAR)                        -- 내용
        CONSTRAINT F_CON_NN NOT NULL,
    f_writer VARCHAR2(10 CHAR)                          -- 작성자
        CONSTRAINT F_WRI_FK REFERENCES member(m_id) -- 참조 테이블이 없음
        CONSTRAINT F_WRI_NN NOT NULL,
    f_cdate TIMESTAMP                                   -- 날짜
        CONSTRAINT F_DATE_NN NOT NULL,
    f_yn CHAR(1) CHECK (f_yn IN('Y', 'N'))              -- 살제유무
        CONSTRAINT F_YN_NN NOT NULL                 
);

select 'f'||TO_CHAR(nvl(max(a.cm_no)+1,1)) from classmain a;

INSERT INTO study (f_no, f_id, f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES 
(study_seq.NEXTVAL,
(select 'f'|| TO_CHAR(nvl(max(a.f_no)+1,1)) from freeboard a),
'오늘 설대입구 사람 엄청 많던데 뭔일임?',
'설대입구에서 점심 먹으려는데 뭔놈의 사람이 이리 많냐 가는 곳마다 자리가 없음',
'백수'
'2023-01-09-12:20:00'
'Y'
);


-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES (freeboard_seq.NEXTVAL,  '오늘 설대입구 사람 엄청 많던데 뭔일임?', '설대입구에서 점심 먹으려는데 뭔놈의 사람이 이리 많냐 가는 곳마다 자리가 없음', 'test01', '2023-01-09-12:20:00', 'Y' );
INSERT INTO freeboard (f_no,  f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES (freeboard_seq.NEXTVAL, '오늘 처음 파이썬 시작하는 사람입니다', '고인물들이여 꿀팁좀 알려주시오', 'test01', '2022-11-29-8:10:50', 'Y' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES (freeboard_seq.NEXTVAL, '곧 새해인데 다들 새해 복 많이 받으세요', '다들 새해에는 좋은 일만 가득 하기를...', 'test01', '2022-12-31-11:58:59', 'Y' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES (freeboard_seq.NEXTVAL,  '이번에 배우는 내용은 하나도 귀에 안들어온다 큰일이다', '비상비상 하나도 모르겠다 이거야', 'test01', '2023-01-07-15:21:50', 'Y' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn) 
VALUES (freeboard_seq.NEXTVAL, '취업해야 하는데 추천 좀', '이제 취업준비하는데 좋은 회사 추천 좀', 'test01', '2023-01-31-12:20:50', 'Y' );

commit;
select * from freeboard ORDER BY f_no DESC;




-- 검색쿼리
SELECT
	    num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,
	    cmRecommend, cmStar, file1, video, cmYn
	FROM    
	    (SELECT
	        ROWNUM num, cmNo, cmId, cmCode, cmName, cmSdate, cmEdate, cmPrice, cmCount,
	        cmRecommend, cmStar, file1, video, cmYn
	    FROM 
	        (SELECT
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
            cm_yn = 'Y'
            AND cm_name LIKE '%%'
        ) classmain
        ORDER BY cmNo DESC
    )
	WHERE num>=1 AND num <= 10
    ;
