

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
DROP SEQUENCE requestboard_seq;
 CREATE SEQUENCE requestboard_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 메인강의 테이블 생성
DROP TABLE requestboard;
CREATE TABLE requestboard(
	r_no NUMBER(8)
        CONSTRAINT R_NO_PK PRIMARY KEY,
    r_code VARCHAR2(8 CHAR)
        --CONSTRAINT R_CODE_UK UNIQUE
        CONSTRAINT R_CODE_NN NOT NULL,
    r_title VARCHAR2(50 CHAR)
        CONSTRAINT R_TITLE_NN NOT NULL,
    r_content VARCHAR2(700 CHAR)
        CONSTRAINT R_CON_NN NOT NULL,
    r_writer VARCHAR2(18 CHAR)
        CONSTRAINT R_WRI_FK REFERENCES member(m_id)
        CONSTRAINT R_WRI_NN NOT NULL,
    r_answer VARCHAR2(700 CHAR),
    r_count NUMBER(8)                           -- 조회수
        CONSTRAINT R_COUNT_NN NOT NULL,  
    r_open CHAR(1) CHECK (r_open IN('Y', 'N'))              -- 살제유무
        CONSTRAINT R_OPEN_NN NOT NULL,
    r_cdate TIMESTAMP
        CONSTRAINT R_DATE_NN NOT NULL,
    r_yn CHAR(1) CHECK (r_yn IN('Y', 'N'))              -- 살제유무
        CONSTRAINT R_YN_NN NOT NULL                 
);

select 'f'||TO_CHAR(nvl(max(a.cm_no)+1,1)) from classmain a;

INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer, r_open, r_cdate, r_yn) 
VALUES 
(requestboard_seq.NEXTVAL,
(select 'r'|| TO_CHAR(nvl(max(a.r_no)+1,1)) from requestboard a),
'1234',
'분명 회원가입을 했었는데 로그인이 안되고 아이디, 비밀번호 찾기도 안되요',
'분명 회원가입을 했었는데 로그인이 안되고 아이디, 비밀번호 찾기도 안되요 빨리 해결해 주시면 감사하겠습니다.',
'회원1',
'사이트 이용에 불편을 드려 죄송합니다. 우선 회원가입 되어있는지 확인해본 결과 회원가입이 되어있지 않다고 나왔습니다.
귀찮으시겠지만 한번 더 회원가입을 해주시기 바랍니다.',
'Y',
'2023-01-09-12:20:00',
'Y'
);


-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 40번만 컨트롤 시프트 엔터로 하자
INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer,r_count, r_open, r_cdate, r_yn) 
VALUES (requestboard_seq.NEXTVAL,'회원','분명 회원가입을 했었는데 로그인이 안되고 아이디, 비밀번호 찾기도 안되요','분명 회원가입을 했었는데 로그인이 안되고 아이디 비밀번호 찾기도 안되요 빨리 해결해 주시면 감사하겠습니다.','test01','사이트 이용에 불편을 드려 죄송합니다. 우선 회원가입 되어있는지 확인해본 결과 회원가입이 되어있지 않다고 나왔습니다.귀찮으시겠지만 한번 더 회원가입을 해주시기 바랍니다.','10','Y','2023-01-09-12:20:00','Y');
INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer,r_count, r_open, r_cdate, r_yn) 
VALUES (requestboard_seq.NEXTVAL,'결제','강의를 결제했는데 내 강의실에 강의가 없습니다.','결제한 강의가 내 강의실에 없습니다. 결제는 되서 돈만 나간 상황입니다.', 'test01','사이트 이용에 불편을 드려 죄송합니다. 사이트 오류로 인해 일시적인 현상입니다. 결제 금액은 환불해드렸습니다.','20','Y','2023-01-06-18:25:10','Y');
INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer,r_count, r_open, r_cdate, r_yn) 
VALUES (requestboard_seq.NEXTVAL,'결제','강의 중간에 영상이 몇개 빠져있습니다','결제한 강의를 듣고 있었는데 중간에 몇몇 영상이 없는것처럼 다음 영상이 어색합니다. 중간에 영상이 빠진것 같은데 확인 좀 해주세요', 'test01','사이트 이용에 불편을 드려 죄송합니다. 다시 확인하시면 정상적으로 수업을 들을 수 있을겁니다.','30','Y','2023-01-04-20:50:18','Y');
INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer,r_count, r_open, r_cdate, r_yn) 
VALUES (requestboard_seq.NEXTVAL,'회원','아이디를 못 찾겠습니다.','오랜만에 접속하는거라 아이디를 못 찾겠습니다.', 'test01','아이디는 asdasd123 입니다','40','Y','2023-01-05-22:40:38','Y');
INSERT INTO requestboard (r_no, r_code, r_title, r_content, r_writer , r_answer,r_count, r_open, r_cdate, r_yn) 
VALUES (requestboard_seq.NEXTVAL,'결제','강의 결제가 안됩니다','강의를 결제하려고 하는데 결제창에서 오류가 뜨고 결제가 안됩니다.', 'test01','사이트 이용에 불편을 드려 죄송합니다. 다시 확인하시면 정상적으로 결제하실 수 있습니다.','50','Y','2023-01-08-21:55:58','Y');

commit;
select * from requestboard ORDER BY r_no DESC;




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
	            r_no AS no,
                r_code AS code,
                r_title AS title,
                r_content AS content,
                r_writer AS writer, 
                r_answer AS answer,
                r_open AS open,
                r_cdate AS cdate,
                r_yn AS yn
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

INSERT INTO requestBoard (r_answer)
VALUES  ('');

UPDATE requestBoard
    SET r_answer = '이걸로 바꿈 ㅅㄱ'
WHERE
    r_no = 89
;

commit;