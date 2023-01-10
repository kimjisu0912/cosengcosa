
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
    cs_id VARCHAR2(8 CHAR) 
        CONSTRAINT CS_ID_UK UNIQUE
        CONSTRAINT CS_ID_NN NOT NULL,			 -- 강의id cm_id VARCHAR(8) NOT NULL UNIQUE, 보류
    cs_code VARCHAR2(8 CHAR) 
        CONSTRAINT CS_CODE_NN NOT NULL,			-- 강의코드
    cs_group VARCHAR2(8 CHAR)
         CONSTRAINT CS_CODE_FK REFERENCES classmain(cm_code)
        CONSTRAINT CS_GROUP_NN NOT NULL,        -- 강의그룹코드
    cs_name VARCHAR2(100 CHAR) 
        CONSTRAINT CS_NAME_NN NOT NULL,			-- 강의명
    cs_content VARCHAR2(3000)           
        CONSTRAINT CS_CONTENT_NN NOT NULL,      -- 강의설명
    cs_sdate TIMESTAMP 
        CONSTRAINT CS_SDATE_NN NOT NULL,		-- 시작일
    cs_edate TIMESTAMP 
        CONSTRAINT CS_EDATE_NN NOT NULL, 		-- 종료일
    cs_count NUMBER(8) 
        CONSTRAINT CS_COUNT_NN NOT NULL,        -- 조회수
    cs_recommend NUMBER(8) DEFAULT 0
        CONSTRAINT CS_RECOM_NN NOT NULL,	    -- 추천수 테스트단계에 삭제 할 예정
    cs_star NUMBER(1) DEFAULT 0
        CONSTRAINT CS_STAR_NN NOT NULL,			-- 별점 테스트단계에 삭제 할 예정
    cs_video VARCHAR2(200 CHAR)					
        CONSTRAINT CS_VIDEO_NN NOT NULL,        -- video
    cs_runtime VARCHAR2(10 CHAR)        
        CONSTRAINT CS_RUNTIME_NN NOT NULL,      -- 재생시간
    cs_yn CHAR(1) CHECK (cs_yn IN('Y', 'N'))
        CONSTRAINT CS_YN_NN NOT NULL            -- 삭제유무
);


-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자

INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_01', 'HL01', 'HTML5 시작 및 준비물 챙기기', 'HTML5를 시작하기 위한 프로그램의 소개와 활용에 대해서 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'bYgCtRqfi7o', '13:35','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_02', 'HL01', 'HTML5 텍스트 관련 태그들', '텍스트 태그의 종류를 알아보고 그 태그들의 활용과 이용법을 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'vgrd5sY_gFo', '24:32','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_03', 'HL01', 'HTML5 이미지와 하이퍼링크', '이미지 태그를 활용하는 법과 하이퍼링크의 사용법을 이용한 사례를 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'Xl88OXoK6lk', '17:34','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_04', 'HL01', 'HTML5 폼 관련 태그들', '폼 태그에 대해 이해를 하고 폼 태그에 관련된 태그들에 대해서 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'e7eIGHbFbX0', '23:22','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_05', 'HL01', 'HTML5 폼 관련 태그들2', '폼 태그에 대해서 이해를 하고 폼태그에 관련된 태그들에 추가적으로 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'u9f6qEsbDB8', '12:25','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_06', 'HL01', 'HTML5 CSS 기초', 'HTML과 한쌍을 이룬다고 하는 CSS에 대해 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'qVIWFELSgBY', '17:35','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_07', 'HL01', 'HTML5 CSS 기초2', 'CSS를 활용를 활용하는 법을 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'YouVyzSw7po', '12:56','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_08', 'HL01', 'HTML5 텍스트 관련 스타일', '텍스트 관련 스타일종류에 대해서 알아보고 활용해보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'vcOwS9XI3lM', '19:18','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_09', 'HL01', 'HTML5 색상과 배경을 위한 스타일', '색상 이용법과 배경 스타일을 꾸며보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, '9A8GPhG3-3k', '14:33','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_10', 'HL01', 'HTML5 텍스트 관련 스타일2', '텍스트 관련 스타일 종류에 대해서 추가로 알아보고 활용해보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'tNwcC7-s7RI', '17:14','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_11', 'HL01', 'HTML5 CSS 박스 모델', 'css 박스 모델에 대해서 알아보자', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'R_0L00mnn6E', '14:02','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'hl01_12', 'HL01', 'HTML5 CSS 박스 모델2', 'css 박스 모델에 대해서 알아보자2', '2021-11-20 09:00:00', '2022-02-27 12:00:00', 1, 1, 4, 'zGm93nj9OVo', '17:25','Y');


INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_01', 'JA01', 'JAVA 소개와 수업 소개', '자바에 대해서 알아보고 앞으로 수업에 대해서 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'qR90tdW0Hbo', '13:09','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_02', 'JA01', 'JAVA 설치', '자바 설치를 설치하고 설치확인하는 법을 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'kyFrm3zKryE', '15:07','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_03', 'JA01', 'JAVA 설치와 실행2 윈도우버전', '윈도우환경에서 자바를 설치를 해보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'u7MKu4uDsJs', '09:18','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_04', 'JA01', 'JAVA 개발도구와 이클립스', '자바개발을 도와주는 도구들에 대해서 알아보고 이클립스를 활용해서 자바를 사용해보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'SohwzrJpKVY', '07:15','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_05', 'JA01', 'JAVA 숫자와 문자열-숫자', '자바의 숫자형을 다루는 법에 대해서 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'o8IWnKNAG4s', '07:29','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_06', 'JA01', 'JAVA 숫자와 문자열-문자열', '자바의 문자열 다루는 법에 대해서 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, '1ZwCWAGA2PE', '15:45','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_07', 'JA01', 'JAVA 변수의 선언과 할당', '변수에 대해서 알아보고 선언하는 법과 할당하는 것을 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'LTLVGjYxabs', '06:23','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_08', 'JA01', 'JAVA 데이터의 크기', '자바에서 데이터의 종류와 각각의 크기에 대해서 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'i1OkU7XYSAU', '04:22','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_09', 'JA01', 'JAVA 형 변환', '자바에서 데이터들간의 형 변환을 하는법을 알아보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'FWAHBg28zeY', '15:40','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_10', 'JA01', 'JAVA 연산자 ', '자바에서 제공하는 연산자에 대해서 알아보고 사용해보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'SZFMO1cw3BA', '08:36','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_11', 'JA01', 'JAVA 배열과 그룹핑', '배열에 대해서 알아보고 그룹핑의 개념을 이해해보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, 'pegfdsD1IY4', '09:44','Y');
INSERT INTO classsub (cs_no, cs_id, cs_code, cs_group, cs_name, cs_content, cs_sdate, cs_edate, cs_count, cs_recommend, cs_star, cs_video, cs_runtime, cs_yn) 
VALUES (classsub_seq.NEXTVAL,(select 'cs'||TO_CHAR(NVL(max(a.cs_no)+1 ,1)) from classsub a), 'ja01_12', 'JA01', 'JAVA 메소드 오리엔테이션', '메소드에 대해서 알아보고 개념을 이해해보자', '2021-12-01 09:00:00', '2022-01-22 12:00:00', 1, 1, 4, '54hrXAyYUGo', '06:41','Y');



commit;
select * from classsub ORDER BY cs_no DESC;


-- 검색쿼리
SELECT
	    num, csNo, csId, csCode, csGroup, csName, csContent, csSdate, csEdate, csCount,
	    csRecommend, csStar, csVideo, csRuntime, csYn
	FROM    
	    (SELECT
	        ROWNUM num, csNo, csId, csCode, csGroup, csName, csContent, csSdate, csEdate, csCount,
	        csRecommend, csStar, csVideo, csRuntime, csYn
	    FROM 
	        (SELECT
	            cs_no AS csNo,
	            cs_id AS csId,
	            cs_code AS csCode,
	            cs_group AS csGroup,
	            cs_name AS csName,
                cs_content AS csContent,
	            cs_sdate AS csSdate,
	            cs_edate AS csEdate,
	            cs_count AS csCount,
	            cs_recommend AS csRecommend,
	            cs_star AS csStar,
	            cs_video AS csVideo,
	            cs_runtime AS csRuntime,
	            cs_yn AS csYn
	        FROM
            classsub
			WHERE
            cs_yn = 'Y'
            AND cs_group LIKE '%HL01%'
--            AND cs_name LIKE '%%'
        ) classsub
        ORDER BY csNo ASC
    )
	WHERE num>=1 AND num <= 30
    ;

-- 검색쿼리(페이징x)
	    SELECT
	        ROWNUM num, csNo, csId, csCode, csGroup, csName, csContent, csSdate, csEdate, csCount,
	        csRecommend, csStar, csVideo, csRuntime, csYn
	    FROM 
	        (SELECT
	            cs_no AS csNo,
	            cs_id AS csId,
	            cs_code AS csCode,
	            cs_group AS csGroup,
	            cs_name AS csName,
                cs_content AS csContent,
	            cs_sdate AS csSdate,
	            cs_edate AS csEdate,
	            cs_count AS csCount,
	            cs_recommend AS csRecommend,
	            cs_star AS csStar,
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
    
    
    