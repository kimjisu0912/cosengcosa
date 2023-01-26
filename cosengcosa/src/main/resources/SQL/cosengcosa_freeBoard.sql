

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
    f_title VARCHAR2(100 CHAR)                           -- 제목
        CONSTRAINT F_TITLE_NN NOT NULL,
    f_content VARCHAR2(700 CHAR)                        -- 내용
        CONSTRAINT F_CON_NN NOT NULL,
    f_writer VARCHAR2(10 CHAR)                          -- 작성자
        CONSTRAINT F_WRI_FK REFERENCES member(m_id) -- 참조 테이블이 없음
        CONSTRAINT F_WRI_NN NOT NULL,
    f_count NUMBER(8)                           -- 조회수
        CONSTRAINT F_COUNT_NN NOT NULL,  
    f_recommend NUMBER(8)                       -- 추천수
        CONSTRAINT F_RECOM_NN NOT NULL,	
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
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL,  '오늘 설대입구 사람 엄청 많던데 뭔일임?', '설대입구에서 점심 먹으려는데 뭔놈의 사람이 이리 많냐 가는 곳마다 자리가 없음', 'test01', '2023-01-09-12:20:00', 'Y', '10','10' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '오늘 처음 파이썬 시작하는 사람입니다', '고인물들이여 꿀팁좀 알려주시오', 'test01', '2022-11-29-8:10:50', 'Y' ,'20','20' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '곧 새해인데 다들 새해 복 많이 받으세요', '다들 새해에는 좋은 일만 가득 하기를...', 'test01', '2022-12-31-11:58:59', 'Y' ,'30','30' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL,  '이번에 배우는 내용은 하나도 귀에 안들어온다 큰일이다', '비상비상 하나도 모르겠다 이거야', 'test01', '2023-01-07-15:21:50', 'Y' ,'40','40');
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '취업해야 하는데 추천 좀', '이제 취업준비하는데 좋은 회사 추천 좀', 'test01', '2023-01-31-12:20:50', 'Y','50','50' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '님들이 제일 좋아하는 햄버거는 뭐임?', '난 근본 싸이버거인데 이젠 다른것도 먹어보고 싶으 추천 좀 해주라',  'test01', '2022-11-13-13:14:23', 'Y' ,'60','60');
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '설날에 다들 용돈 좀 받았나?', '본인 노트북이 매우 갖고 시프으므믐 사주라ㅏㅏ 다들 마음을 모아 이 불쌍한 나에게 10000원씩만 주면 가능할거 같은디',  'test02', '2023-01-25-11:32:58', 'Y' ,'70','70');
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '다들 오늘 눈온거 봤어요???', '우리집 언덕이 꽤 높은데 거기서 쌀포대 하나 들고 썰매타면 재밌겠더라 파티원 모집합니다(1/15)',  'test02', '2023-01-26-10:25:10', 'Y','80','80' );
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, '저 내일 면접보는데 꿀팁 좀 알려주세요 ㅠㅠ', '내일 면접보는데 너무 떨려요ㅠㅠ 옷은 깔끔하게만 입고오라는데 뭘 입으라는지...',  'test01', '2023-01-28-15:50:50', 'Y' ,'90','90');
INSERT INTO freeboard (f_no, f_title,f_content, f_writer , f_cdate, f_yn, f_count, f_recommend) 
VALUES (freeboard_seq.NEXTVAL, 'db는 mysql이 좋아요? 아님 oracle이 좋아요?', '혼자서 가볍게 연습하고 싶은데 뭐가 좋은지 모르겠어ㅡ.ㅡ 장단점 좀 알려주',  'test02', '2023-01-18-18:41:32', 'Y' ,'100','100');

commit;
select * from freeboard ORDER BY f_no DESC;




-- 검색쿼리
SELECT
	    num, fNo,fTitle, fContent,fWriter,fYn,fCdate
	FROM    
	    (SELECT
	        ROWNUM num, fNo,fTitle, fContent,fWriter,fYn,fCdate
	    FROM 
	        (SELECT
	           f_no AS fNo,
                f_title AS fTitle,
                f_content AS fContent,
                f_writer AS fWriter,
                f_yn AS fYn,
                f_cdate As fCdate
	        FROM
                freeBoard
			WHERE
            f_yn = 'Y'
        ) freeBoard
        ORDER BY fNo DESC
    )
	WHERE num>=1 AND num <= 10
    ;

UPDATE freeBoard 
			SET f_title = '수정된 내용', f_content = 'kkkdkdkdkdkdkdkddd', 	
				f_cdate = SYSDATE
		WHERE f_no = 118
;

commit;