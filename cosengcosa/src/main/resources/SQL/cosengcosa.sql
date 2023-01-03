use spring;


-- 테스트용 및 참고용
-- 메인강의 테이블 생성
DROP TABLE IF EXISTS classmain;
CREATE TABLE IF NOT EXISTS classmain(
	cm_no INTEGER AUTO_INCREMENT PRIMARY KEY, 	-- 관리번호
    cm_id VARCHAR(8) NOT NULL UNIQUE,			-- 강의id cm_id VARCHAR(8) NOT NULL UNIQUE, 보류
    cm_code VARCHAR(8) NOT NULL,				-- 강의코드
    cm_name VARCHAR(100) NOT NULL,				-- 강의명
    cm_sdate TIMESTAMP NOT NULL,				-- 시작일
    cm_edate TIMESTAMP NOT NULL, 				-- 종료일
    cm_price INTEGER(8) NOT NULL,				-- 가격
    cm_count INTEGER(8) NOT NULL,				-- 조회수
    cm_recommend INTEGER(8) NOT NULL,			-- 추천수
    cm_star INTEGER(1) NOT NULL,				-- 별점
    file1 VARCHAR(100),							-- file1
    video VARCHAR(200),							-- video
    cm_yn CHAR(1) CHECK (cm_yn IN('Y', 'N'))	-- 삭제유무
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테스트용 및 참고용
-- 메인강의 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'ja01', '자바를 잡아라~!', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 35000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'ja02', '자바를 내친구~!', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'ja03', '자바의 정석', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'DB01', 'SQL 문법을 이해하자~!', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 55000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'DB02', 'MySQL활용', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'DB03', '마리아 디비의 학습', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'jq01', 'Jquery의 학습', '2017-12-01 09:00:00', '2017-12-20 12:00:00', 55000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'js01', 'JavaScript 활용', '2018-01-01 09:00:00', '2018-01-20 12:00:00', 30000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'HL01', 'HTML5학습', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'cs01', 'css3의 기초지식', '2018-02-01 09:00:00', '2018-02-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'jp01', 'JSP 2.0', '2018-03-01 09:00:00', '2018-03-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');
INSERT INTO classmain (cm_id, cm_code, cm_name, cm_sdate, cm_edate, cm_price, cm_count, cm_recommend, cm_star, file1, video, cm_yn) 
VALUE ((select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a), 'sp01', 'spring4', '2018-04-01 09:00:00', '2018-04-20 12:00:00', 45000, 1, 1, 4, null, null,'Y');

commit;
select * from classmain ORDER BY cm_no DESC;

-- 검색쿼리
SELECT
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
 cm_yn = "Y"
AND cm_name LIKE CONCAT('%', "", '%')
ORDER BY cmNo DESC
LIMIT 1, 10;

-- 이건 쿼리 테스트 한거임
SELECT concat('cm','',MAX(a.cm_no)) FROM classmain a;
(select concat('cm','',ifnull(max(a.cm_no), 0)+1) from classmain a);


SELECT 
			no,
			title,
			writer,
			content,
			reg_date AS regDate,
			read_count AS readCount,
			pass,
			file1
		FROM springbbs
        WHERE
        title LIKE CONCAT('%', "", '%')
        ;