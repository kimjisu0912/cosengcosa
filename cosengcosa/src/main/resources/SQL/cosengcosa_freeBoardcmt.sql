

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
DROP SEQUENCE freeboardcmt_seq;
 CREATE SEQUENCE freeboardcmt_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 메인강의 테이블 생성
DROP TABLE freeboardcmt;
CREATE TABLE freeboardcmt(
	fc_no NUMBER(8)
        CONSTRAINT FC_NO_PK PRIMARY KEY,
    fc_fid  NUMBER(8)
        CONSTRAINT FC_FID_NN NOT NULL,
    fc_grp  NUMBER(8)
        CONSTRAINT FC_GRP_NN NOT NULL,
    fc_grps  NUMBER(8)
        CONSTRAINT FC_GRPS_NN NOT NULL,
    fc_grpl  NUMBER(8)
        CONSTRAINT FC_GRPL_NN NOT NULL,
    fc_writer VARCHAR2(10 CHAR)
        CONSTRAINT FC_WRI_FK REFERENCES member(m_id)
        CONSTRAINT FC_WRI_NN NOT NULL,
    fc_content VARCHAR2(700 CHAR)
        CONSTRAINT FC_CON_NN NOT NULL,
    fc_cdate TIMESTAMP
        CONSTRAINT FC_DATE_NN NOT NULL,
    fc_yn CHAR(1) CHECK (fc_yn IN('Y', 'N'))              -- 살제유무
        CONSTRAINT FC_YN_NN NOT NULL                 
);

select 'fc'||TO_CHAR(nvl(max(a.cm_no)+1,1)) from classmain a;

INSERT INTO freeboardcmt (fc_no, fc_id, fc_fid, fc_grp, fc_grps , fc_grpl, fc_writer, fc_content, fc_cdate, fc_yn) 
VALUES 
(freeboardcmt_seq.NEXTVAL,
(select 'fc'|| TO_CHAR(nvl(max(a.fc_no)+1,1)) from freeboardcmt a),
''
);


-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자

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
