/*
1. ex4 테이블에 유일키(PRIMARY KEY) id(10 Byte)와 NULL 값을 가지지 않는 passwd(10 Byte)를 선언한다.
2. 값   ('sky2003', 'u1234')
        ('sky2003', 'u54321')
        ('today123', 'u2345')을 넣고 출력하기
3. 나이 age 칼럼(3 Byte)를 추가하고, 값('today321', 'u2345', 25)를 넣고 출력하기
4. 패스워드 자료형의 크기를 10 -> 12 Byte로 변경하고 값 ('today3210', 'u2345678910', 23)을 넣고 출력하기
*/
-- ex4 테이블 생성
CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY,    -- 기본키 제약조건
    passwd VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'u1234');
INSERT INTO ex4 VALUES ('sky2003', 'u54321');   -- 무결성 제약 조건 위배
INSERT INTO ex4 VALUES ('today123', 'u2345', 25);
INSERT INTO ex4(id, passwd) VALUES ('today321', 'u3456');
-- 자료형의 크기보다 큰 데이터 입력 불가.
INSERT INTO ex4(id, passwd, age) VALUES ('today3210', 'u2345678910', 23);

COMMIT;

-- 나이 (age) 칼럼 추가
ALTER TABLE ex4 ADD age NUMBER(3);

-- 자료형의 크기 변경(varchar2 10 -> 12)
ALTER TABLE ex4 MODIFY passwd VARCHAR2(12);

SELECT * FROM ex4;

drop table ex4;