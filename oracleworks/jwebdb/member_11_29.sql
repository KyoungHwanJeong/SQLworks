-- jweb, member 테이블 생성
CREATE TABLE member(
    mno         INT,
    id          VARCHAR2(20) NOT NULL UNIQUE,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    email       VARCHAR2(50),
    gender      VARCHAR2(6),
    joindate    TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);
CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member (mno, id, passwd, name, email, gender)
VALUES(seq_mno.NEXTVAL, 'khit', 'm1234567!ab', '정경환', 'khit@gmail.com', '남');

-- id가 'khit'인 회원의 정보
SELECT * FROM member WHERE id = 'khit';

-- id와 passwd가 일치하는 회원 찾기
SELECT * FROM member 
WHERE id = 'khit' AND passwd='m1234567';

SELECT * FROM member ORDER BY mno;

-- result 는 별칭이지만 칼럼 역할을 한다
SELECT COUNT(*) as result
FROM member WHERE id = 'khit';

-- 아이디가 있으면(아이디의 개수가 1이면 true), 1이 아니면 false를 출력하기
SELECT DECODE(COUNT(*), 1, 'true', 'false') AS result
FROM member WHERE id = 'khit';

COMMIT;
SELECT * FROM member;

DROP SEQUENCE seq_mno;

DROP TABLE member;
