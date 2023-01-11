
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


-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자

INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_01', 'JA01', 'JAVA 소개와 수업 소개', '자바에 대해서 알아보고 앞으로 수업에 대해서 알아보자', 'qR90tdW0Hbo', '13:09','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_02', 'JA01', 'JAVA 설치', '자바 설치를 설치하고 설치확인하는 법을 알아보자', '2021-12-01 09:00:00', 'kyFrm3zKryE', '15:07','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_03', 'JA01', 'JAVA 설치와 실행2 윈도우버전', '윈도우환경에서 자바를 설치를 해보자', '2021-12-01 09:00:00', 'u7MKu4uDsJs', '09:18','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_04', 'JA01', 'JAVA 개발도구와 이클립스', '자바개발을 도와주는 도구들에 대해서 알아보고 이클립스를 활용해서 자바를 사용해보자', 'SohwzrJpKVY', '07:15','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_05', 'JA01', 'JAVA 숫자와 문자열-숫자', '자바의 숫자형을 다루는 법에 대해서 알아보자', 'o8IWnKNAG4s', '07:29','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_06', 'JA01', 'JAVA 숫자와 문자열-문자열', '자바의 문자열 다루는 법에 대해서 알아보자', '1ZwCWAGA2PE', '15:45','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_07', 'JA01', 'JAVA 변수의 선언과 할당', '변수에 대해서 알아보고 선언하는 법과 할당하는 것을 알아보자', 'LTLVGjYxabs', '06:23','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_08', 'JA01', 'JAVA 데이터의 크기', '자바에서 데이터의 종류와 각각의 크기에 대해서 알아보자', 'i1OkU7XYSAU', '04:22','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_09', 'JA01', 'JAVA 형 변환', '자바에서 데이터들간의 형 변환을 하는법을 알아보자', 'FWAHBg28zeY', '15:40','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_10', 'JA01', 'JAVA 연산자 ', '자바에서 제공하는 연산자에 대해서 알아보고 사용해보자', 'SZFMO1cw3BA', '08:36','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_11', 'JA01', 'JAVA 배열과 그룹핑', '배열에 대해서 알아보고 그룹핑의 개념을 이해해보자', 'pegfdsD1IY4', '09:44','Y');
INSERT INTO classsub (cs_no, cs_code, cs_group, cs_title, cs_content, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL, 'ja01_12', 'JA01', 'JAVA 메소드 오리엔테이션', '메소드에 대해서 알아보고 개념을 이해해보자', '54hrXAyYUGo', '06:41','Y');



commit;
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
    
    
    