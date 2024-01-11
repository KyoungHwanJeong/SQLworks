-- addrbook table 생성
CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username    VARCHAR2(20) NOT NULL,
    tel         VARCHAR2(20),
    email       VARCHAR2(30) UNIQUE,    -- UNIQUE 를 넣으면 중복을 체크해준다
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE;   -- 자동 순번 넣기

INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '정경환', '010-1234-5678', 'test@test.com', '남');

-- email 중복을 체크하기 위해
INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '김이레', '010-2345-6789', 'test@test.com', '여');

COMMIT;

TRUNCATE TABLE addrbook;

-- 이메일이 khit@kh.kr인 이메일 찾기
SELECT email FROM addrbook
WHERE email = 'khit@kh.kr';
-- 주소 삭제
DELETE FROM addrbook WHERE bnum = 6;
-- 주소 수정
UPDATE addrbook 
SET username = '금강', tel='010-6666-7777', gender='남'
WHERE bnum = 5;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;

SELECT * FROM addrbook;