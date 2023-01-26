-- 추천이력
-- 시퀀스 생성
DROP SEQUENCE recommend_seq;
 CREATE SEQUENCE recommend_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 추천이력 테이블 생성
DROP TABLE recommend;
CREATE TABLE recommend(
	rcd_no NUMBER(5)
        CONSTRAINT RCD_NO_PK PRIMARY KEY, 	    -- 관리번호
    rcd_mid VARCHAR2(18 CHAR) 
        CONSTRAINT RCD_MID_FK REFERENCES member(m_id) -- 
        CONSTRAINT RCD_MID_NN NOT NULL,			-- 회원id
    rcd_cmcode VARCHAR2(8 CHAR)
        CONSTRAINT RCD_CODE_FK REFERENCES classmain(cm_code)
        CONSTRAINT RCD_GROUP_NN NOT NULL,        -- 강의그룹코드
    rcd_cdate TIMESTAMP
            CONSTRAINT RCD_CDATE_NN NOT NULL,		    -- 등록일
    rcd_good CHAR(1) CHECK (rcd_good IN('Y', 'N'))
            CONSTRAINT RCD_GOOD_NN NOT NULL            -- 추천유무
);


-- ================================================================================

select * from recommend;

INSERT INTO recommend(rcd_no, rcd_mid, rcd_cmcode, rcd_cdate, rcd_good)		
VALUES(recommend_seq.NEXTVAL, 'test01', 'AJ02', SYSDATE, 'Y')
;

UPDATE 
    classmain
SET cm_recommend = 0
;

DELETE FROM recommend;

select * from recommend;
select * from classmain order by cm_no desc;

