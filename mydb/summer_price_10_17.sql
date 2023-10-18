/*
-- 수강료 테이블을 생성한다
    과목이름(PK)(20 byte), 수강료
-- 수강료 데이터
    ('C', 30000)
    ('Java', 45000)
    ('Python', 40000)
    를 생성한다.
-- 여름학기 등록 테이블을 생성한다
    학번(PK), 과목이름(FK)(20 byte)
-- 여름학기 데이터
    (100, 'C')
    (101, 'Java')
    (200, 'Python')
    (201, 'Java')
    를 생성한다.
--1. 커밋 후 200번 학생의 수강 신청 취소
--2. Python 과목의 수강료는?
--3. 수강료 테이블에 'C++' 강좌를 35,000으로 삽입
--4. 수강료 정보 확인하기
--5. Java 수강료가 45,000원에서 40,000원으로 변경
--6. 수강료가 가장 싼 과목의 과목이름과 수강료?
*/
-- 수강료 테이블
CREATE TABLE summer_price(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

-- 여름학기 등록 테이블
CREATE TABLE summer_register(
    sid     NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY(subject) REFERENCES summer_price(subject)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

COMMIT;
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 200번 학생의 수강 신청 취소
-- 삭제 이상 없음
DELETE FROM summer_register
WHERE sid = 200;

-- Python 과목의 수강료는?
SELECT price
FROM summer_price
WHERE subject = 'Python';

-- 수강료 테이블에 'C++' 강좌를 35,000으로 삽입
INSERT INTO summer_price VALUES('C++', 35000);      -- 삽입 이상 없음

-- 수강료 정보 확인하기
SELECT * FROM summer_price;

-- Java 수강료가 45,000원에서 40,000원으로 변경
UPDATE summer_price SET price = 40000               -- 수정 이상 없음
WHERE subject LIKE 'Java';


-- 수강료가 가장 싼 과목의 과목이름과 수강료?
SELECT subject, price FROM summer_price
WHERE price = (SELECT MIN(price)FROM summer_price);


COMMIT;

SELECT * FROM summer_register;

drop table summer_price;
drop table summer_register;