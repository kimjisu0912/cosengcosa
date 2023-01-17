DROP SEQUENCE myclasssub_seq;
 CREATE SEQUENCE myclasssub_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
DROP TABLE myclasssub;
CREATE TABLE myclasssub(
	mys_no NUMBER(5)
        CONSTRAINT MYS_NO_PK PRIMARY KEY, 	    -- 관리번호
    mys_mid VARCHAR2(18 CHAR) 
        CONSTRAINT MYS_MID_FK REFERENCES member(m_id) 
        CONSTRAINT MYS_MID_NN NOT NULL,			-- 회원id
    mys_code VARCHAR2(8 CHAR) 
        CONSTRAINT MYS_CSCODE_FK REFERENCES classsub(cs_code) 
        CONSTRAINT MYS_CSCODE_NN NOT NULL,		-- 서브강의코드
    mys_group VARCHAR2(8 CHAR)
        --CONSTRAINT MYS_CODE_FK REFERENCES myclassmain(mym_code)
        CONSTRAINT MYS_GROUP_NN NOT NULL,        -- 강의그룹코드    
    mys_title VARCHAR2(100 CHAR) 
        CONSTRAINT MYS_CSTITLE_NN NOT NULL,		-- 서브강의명
    mys_content VARCHAR2(3000)           
        CONSTRAINT MYS_CONTENT_NN NOT NULL,      -- 강의설명    
    mys_video VARCHAR2(200 CHAR)					
        CONSTRAINT MYS_VIDEO_NN NOT NULL,        -- video
    mys_runtime VARCHAR2(10 CHAR)        
        CONSTRAINT MYS_RUNTIME_NN NOT NULL,      -- 재생시간    
    mys_watchtime VARCHAR2(10 CHAR) DEFAULT '0'        
        CONSTRAINT MYS_WATCHTIME_NN NOT NULL,      -- 수강시간
    mys_sdate TIMESTAMP DEFAULT sysdate
        CONSTRAINT MYS_SDATE_NN NOT NULL,		-- 시작일
    mys_edate TIMESTAMP 
        CONSTRAINT MYS_EDATE_NN NOT NULL, 		-- 종료일   
    mys_done CHAR(1) CHECK (mys_done IN('Y', 'N')) 
        CONSTRAINT MYS_DONE_NN NOT NULL,              -- 수강완료 여부
    mys_yn CHAR(1) CHECK (mys_yn IN('Y', 'N'))
        CONSTRAINT MYS_YN_NN NOT NULL            -- 삭제유무
);

commit;

select * from classsub;

select * from myclasssub
where mys_mid = 'test01';
SELECT mys_video FROM myclasssub
	WHERE mys_mid = 'test01'
	AND mys_yn = 'Y'
	AND mys_group = 'JA01'
    AND rownum = 1;