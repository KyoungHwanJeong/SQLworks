-- 자바와 연동할 회원 테이블 생성
CREATE TABLE users_2(
    userid      VARCHAR2(20) PRIMARY KEY,
    username    VARCHAR2(30) NOT NULL,
    userpassword VARCHAR2(20) NOT NULL,
    userage     NUMBER(3) NOT NULL,
    useremail   VARCHAR2(50) NOT NULL
);

-- 회원 추가
INSERT INTO users_2
VALUES ('today', '고오늘', '12345', 25, 'today@korea.kr');

SELECT userid, username, userpassword, userage, useremail FROM users_2;


SELECT * FROM users_2 WHERE userid = 'today';

COMMIT; -- 자바에서 커밋 안하면 안나온다

DROP TABLE users_2;