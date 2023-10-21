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
CREATE TABLE summer_price_2(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER
);
INSERT INTO summer_price_2 VALUES('C', 30000);
INSERT INTO summer_price_2 VALUES('Java', 45000);
INSERT INTO summer_price_2 VALUES('Python', 40000);

CREATE TABLE summer_register_2(
    sid     NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY (subject) REFERENCES summer_price_2(subject)    
);

INSERT INTO summer_register_2 VALUES(100, 'C');
INSERT INTO summer_register_2 VALUES(101, 'Java');
INSERT INTO summer_register_2 VALUES(200, 'Python');
INSERT INTO summer_register_2 VALUES(201, 'Java');

COMMIT;
SELECT * FROM summer_price_2;
SELECT * FROM summer_register_2;

--1. 커밋 후 200번 학생의 수강 신청 취소
DELETE FROM summer_register_2
WHERE sid = 200;

--2. Python 과목의 수강료는?
SELECT price FROM summer_price_2
WHERE subject LIKE 'Python';

--3. 수강료 테이블에 'C++' 강좌를 35,000으로 삽입
INSERT INTO summer_price_2 VALUES('C++', 35000);

--4. 수강료 정보 확인하기
SELECT * FROM summer_price_2;

--5. Java 수강료가 45,000원에서 40,000원으로 변경
UPDATE summer_price_2 SET price = 40000
WHERE subject LIKE 'Java';

--6. 수강료가 가장 싼 과목의 과목이름과 수강료?
SELECT subject, price
FROM summer_price_2
WHERE price = (SELECT MIN(price) FROM summer_price_2);