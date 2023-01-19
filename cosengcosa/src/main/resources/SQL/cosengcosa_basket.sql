
-- 장바구니
-- 시퀀스 생성
DROP SEQUENCE basket_seq;
 CREATE SEQUENCE basket_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


-- 장바구니 테이블 생성
DROP TABLE basket;
CREATE TABLE basket(
	ba_no NUMBER(5)
        CONSTRAINT BA_NO_PK PRIMARY KEY, 	    -- 관리번호
    ba_mid VARCHAR2(18 CHAR) 
        CONSTRAINT BA_MID_FK REFERENCES member(m_id) -- 개발을 위해 잠시 주석처리
        CONSTRAINT BA_MID_NN NOT NULL,			-- 회원id
    ba_name VARCHAR2(10 CHAR)
    	CONSTRAINT BA_NAME_NN NOT NULL,		-- 회원이름
    ba_cmcode VARCHAR2(8 CHAR)
        CONSTRAINT BA_CMCODE_FK REFERENCES classmain(cm_code) 
        CONSTRAINT BA_CMCODE_NN NOT NULL,	    -- 결재(메인)강의코드
    ba_cname VARCHAR2(100 CHAR)           
        CONSTRAINT BA_CNAME_NN NOT NULL,         -- 결재(메인)강의이름
    ba_price NUMBER(8) 
        CONSTRAINT BA_PRICE_NN NOT NULL		    -- 결재가격
);


-- 결재 테이블 값 입력
-- 적당히 한 70번만 컨트롤 시프트 엔터로 하자
INSERT INTO basket (ba_no, ba_mid, ba_name, ba_cmcode, ba_cname, ba_price) 
VALUES (basket_seq.NEXTVAL, 'test01', 'test01', 'JA01', '자바 기초 프로그래밍 강좌', 200000);

commit;
select * from basket ORDER BY ba_no DESC;


-- 검색쿼리
SELECT
	    num, baNo, baMid, baName, baCmcode, baCname, baPrice
	FROM    
	    (SELECT
	        ROWNUM num, baNo, baMid, baName, baCmcode, baCname, baPrice
	    FROM 
	        (SELECT
	            ba_no AS baNo,	           
	            ba_mid AS baMid,
	            ba_name AS baName,
	            ba_cmcode AS baCmcode,
                ba_cname AS baCname,
	            ba_price AS baPrice
	        FROM
            basket
			WHERE
            ba_mid LIKE '%test01%'
        ) basket
        ORDER BY baNo DESC
    )
	WHERE num>=1 AND num <= 20
    ;
    
-- 조회    
SELECT
        ba_no AS baNo,	           
        ba_mid AS baMid,
        ba_name AS baName,
        ba_cmcode AS baCmcode,
        ba_cname AS baCname,
        ba_price AS baPrice
    FROM
    basket
    WHERE
    ba_mid LIKE '%test01%'
;
SELECT
        ba_no,	           
        ba_mid,
        ba_name,
        ba_cmcode,
        ba_cname,
        ba_price
    FROM
    basket
    WHERE
    ba_mid LIKE '%test01%'
;

-- 체크
SELECT COUNT(*) FROM basket WHERE ba_cmcode = 'JA01';



