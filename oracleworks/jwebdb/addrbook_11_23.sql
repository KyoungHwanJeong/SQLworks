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

SELECT * FROM addrbook;