/*
1. ex4 테이블에 유일키(PRIMARY KEY) id(10 Byte)와 NULL 값을 가지지 않는 passwd(10 Byte)를 선언한다.
2. 값   ('sky2003', 'u1234')
        ('sky2003', 'u54321')
        ('today123', 'u2345')을 넣고 출력하기
3. 나이 age 칼럼(3 Byte)를 추가하고, 값('today321', 'u2345', 25)를 넣고 출력하기
4. 패스워드 자료형의 크기를 10 -> 12 Byte로 변경하고 값 ('today3210', 'u2345678910', 23)을 넣고 출력하기
*/

CREATE TABLE ex4_2(
    id VARCHAR2(10) PRIMARY KEY,
    passwd VARCHAR2(10) NOT NULL
);

INSERT INTO ex4_2 VALUES ('sky2003', 'u1234');
INSERT INTO ex4_2 VALUES ('sky2003', 'u54321');     -- 무결성 제약조건 위배
INSERT INTO ex4_2 VALUES ('today123', 'u2345');

COMMIT;
SELECT * FROM ex4_2;

ALTER TABLE ex4_2 ADD age NUMBER(3);
INSERT INTO ex4_2 VALUES ('today321', 'u2345', 25);
COMMIT;
SELECT * FROM ex4_2;

ALTER TABLE ex4_2 MODIFY passwd VARCHAR2(12);
INSERT INTO ex4_2 VALUES ('today3210', 'u2345678910', 23);
COMMIT;
SELECT * FROM ex4_2;