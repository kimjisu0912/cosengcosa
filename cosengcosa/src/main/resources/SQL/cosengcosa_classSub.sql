
-- 강의서브
-- 시퀀스 생성
DROP SEQUENCE classsub_seq;
 CREATE SEQUENCE classsub_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 서브강의 테이블 생성
DROP TABLE classsub;
CREATE TABLE classsub(
	cs_no NUMBER(5)
        CONSTRAINT CS_NO_PK PRIMARY KEY, 	    -- 관리번호
    cs_code VARCHAR2(8 CHAR)
        CONSTRAINT CS_CODE_UK UNIQUE
        CONSTRAINT CS_CODE_NN NOT NULL,			-- 강의코드
    cs_group VARCHAR2(8 CHAR)
        CONSTRAINT CS_CODE_FK REFERENCES classmain(cm_code)
        CONSTRAINT CS_GROUP_NN NOT NULL,        -- 강의그룹코드
    cs_title VARCHAR2(100 CHAR) 
        CONSTRAINT CS_NAME_NN NOT NULL,			-- 강의명
    cs_content VARCHAR2(3000)           
        CONSTRAINT CS_CONTENT_NN NOT NULL,      -- 강의설명
    cs_video VARCHAR2(200 CHAR)					
        CONSTRAINT CS_VIDEO_NN NOT NULL,        -- video
    cs_runtime VARCHAR2(10 CHAR)        
        CONSTRAINT CS_RUNTIME_NN NOT NULL,      -- 재생시간
    cs_yn CHAR(1) CHECK (cs_yn IN('Y', 'N'))
        CONSTRAINT CS_YN_NN NOT NULL            -- 삭제유무
);

DELETE FROM classsub;
DELETE FROM classsub
WHERE cs_group = 'JA02';


select * from classsub ORDER BY cs_no DESC;


-- 검색쿼리
SELECT
	    num, csNo, csCode, csGroup, csTitle, csContent, csVideo, csRuntime, csYn
	FROM    
	    (SELECT
	        ROWNUM num, csNo, csCode, csGroup, csTitle, csContent, csVideo, csRuntime, csYn
	    FROM 
	        (SELECT
	            cs_no AS csNo,	           
	            cs_code AS csCode,
	            cs_group AS csGroup,
	            cs_title AS csTitle,
                cs_content AS csContent,
	            cs_video AS csVideo,
	            cs_runtime AS csRuntime,
	            cs_yn AS csYn
	        FROM
            classsub
			WHERE
            cs_yn = 'Y'
            AND cs_group LIKE '%%'
--            AND cs_name LIKE '%%'
        ) classsub
        ORDER BY csNo ASC
    )
	WHERE num>=1 AND num <= 30
    ;

-- 검색쿼리(페이징x)
	    SELECT
	        ROWNUM num, csNo, csCode, csGroup, csTitle, csContent, csVideo, csRuntime, csYn
	    FROM 
	        (SELECT
	            cs_no AS csNo,	           
	            cs_code AS csCode,
	            cs_group AS csGroup,
	            cs_title AS csTitle,
                cs_content AS csContent,
	            cs_video AS csVideo,
	            cs_runtime AS csRuntime,
	            cs_yn AS csYn
	        FROM
            classsub
			WHERE
            cs_yn = 'Y'
            AND cs_group LIKE '%%'
--            AND cs_name LIKE '%%'
        ) classsub
        ORDER BY csNo ASC
    ;
    
    
    