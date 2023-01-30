DROP TABLE  member;
CREATE TABLE member(
	m_no NUMBER(8)
        CONSTRAINT MB_NO_PK PRIMARY KEY, -- 회원번호
    m_id VARCHAR2(18 CHAR)
        CONSTRAINT MB_ID_UK UNIQUE
        CONSTRAINT MB_ID_NN NOT NULL,
    m_pass VARCHAR2(100 CHAR) 
        CONSTRAINT MB_PASS_NN NOT NULL,
    m_name VARCHAR2(10 CHAR)  
        CONSTRAINT MB_NAME_NN NOT NULL,
    m_nickname VARCHAR2(30)    
        CONSTRAINT MB_NICK_UK UNIQUE
        CONSTRAINT MB_NICK_NN NOT NULL,
    m_tel VARCHAR2(13 CHAR)
        CONSTRAINT MB_TEL_UK UNIQUE
        CONSTRAINT MB_TEL_NN NOT NULL,
    m_birth VARCHAR2(10 CHAR)
        CONSTRAINT MB_BIRTH_NN NOT NULL,
    m_email VARCHAR2(30 CHAR)
        CONSTRAINT MB_EMAIL_NN NOT NULL,
    m_zipcode VARCHAR2(5 CHAR)
        CONSTRAINT MB_ZIP_NN NOT NULL,
    m_address1 VARCHAR2(80 CHAR)
       CONSTRAINT MB_ADD1_NN NOT NULL,
    m_address2 VARCHAR2(60 CHAR),
    m_grant CHAR DEFAULT 'M'
        CONSTRAINT MB_GRANT_CK CHECK (m_grant IN('M', 'A', 'T'))
        CONSTRAINT MB_GRANT_NN NOT NULL,
    m_joindate DATE DEFAULT sysdate
        CONSTRAINT MB_DATE_NN NOT NULL,
    m_yn CHAR DEFAULT 'Y'
        CONSTRAINT MB_YN_CK CHECK (m_yn IN('Y', 'N'))   
);

-- 관리자 계정
INSERT INTO
    member(m_no, m_id, m_pass, m_name, m_nickname, m_tel, m_birth, m_email, m_zipcode, m_address1, m_address2, m_grant, m_joindate, m_yn)
VALUES(
    (SELECT NVL(MAX(m_no) + 1, 100001)FROM member),
    'admin', '$2a$10$AZKmRv7VBqTpk5hRfs1WP.ootPt5WZ4FZxqEOg0w19NsizTBMO.Iu', '관리자', '관리자', '010-1111-1111', '1980/11/11','admin@githrd.com', 
    '08787', '서울 관악구 남부순환로 1820(봉천동)','','A', sysdate, 'Y'
);

-- test01 계정
INSERT INTO
    member(m_no, m_id, m_pass, m_name, m_nickname, m_tel, m_birth, m_email, m_zipcode, m_address1, m_address2, m_grant, m_joindate, m_yn)
VALUES(
    (SELECT NVL(MAX(m_no) + 1, 100001)FROM member),
    'test01', '$2a$10$FlewZ/x3DRRy0W8KO4VK2e57zntCA/UH1AabRX/N2bdF2ZH1FQ9Ra', 'test01', 'test01', '010-2222-2222', '1980/11/11','test01@githrd.com', 
    '08787', '서울 관악구 남부순환로 1820(봉천동)','','M', sysdate, 'Y'
);

-- test02 계정
INSERT INTO
    member(m_no, m_id, m_pass, m_name, m_nickname, m_tel, m_birth, m_email, m_zipcode, m_address1, m_address2, m_grant, m_joindate, m_yn)
VALUES(
    (SELECT NVL(MAX(m_no) + 1, 100001)FROM member),
    'test02', '$2a$10$2qHpR8E5.uuWN1ZsiKxrWe9AtsgNgx4Z2e.SRiikIxtD1h8PSUn0.', 'test02', 'test02', '010-3333-3333', '1980/11/11','test02@githrd.com', 
    '08787', '서울 관악구 남부순환로 1820(봉천동)','','M', sysdate, 'Y'
);


commit;

SELECT * FROM member WHERE m_id = 'admin';

SELECT * FROM member;