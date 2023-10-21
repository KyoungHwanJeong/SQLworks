/*
-- 여름 학기 테이블을 생성한다
    학번, 과목(20 byte), 수강료
-- 계절 학기 데이터
    (100, 'C', 30000)
    (101, 'Java', 45000)
    (200, 'Python', 40000)
    (201, 'Java', 45000)
    를 생성한다.
-- 1. 계절학기를 수강하는 학생의 학번과 수강하는 과목은?
-- 2. 'Python' 강좌의 수강료는?
-- 3. 여름학기를 듣는 학생수와 수강료 총액은?
-- 4. 200번 학생이 수강 취소(삭제)
-- 5. 이후 'Python'강좌를 신청 한 학생을 출력한다(이상 발생 이유는?)
-- 6. (NULL, 'C++', 35000) 객체를 삽입한다(이상 발생 이유는?)
-- 7. Java 수강료가 45,000원에서 40,000원으로 변경 되었다.(문제없는 코드)
-- 8. 학번 101번의 Java 수강료가 45,000원에서 40,000원으로 변경 되었다. 이때 Java 수강료는?(이상 발생 이유는?)
*/
CREATE TABLE summer_class_2(
    sid     NUMBER,             -- 학번
    subject VARCHAR2(20),       -- 과목
    price   NUMBER              -- 수강료
);
INSERT INTO summer_class_2 VALUES(100, 'C', 30000);
INSERT INTO summer_class_2 VALUES(101, 'Java', 45000);
INSERT INTO summer_class_2 VALUES(200, 'Python', 40000);
INSERT INTO summer_class_2 VALUES(201, 'Java', 45000);

COMMIT;
SELECT * FROM summer_class_2;

-- 1. 계절학기를 수강하는 학생의 학번과 수강하는 과목은?
SELECT sid, subject
FROM summer_class_2;

-- 2. 'Python' 강좌의 수강료는?
SELECT price 파이썬수강료 FROM summer_class_2
WHERE subject LIKE 'Python';

-- 3. 여름학기를 듣는 학생수와 수강료 총액은?
SELECT COUNT(sid) 학생수, SUM(price) 수강료총액 FROM summer_class_2;

-- 4. 200번 학생이 수강 취소(삭제)
DELETE FROM summer_class_2
WHERE sid = 200;

-- 5. 이후 'Python'강좌를 신청 한 학생을 출력한다(이상 발생 이유는?)
SELECT sid FROM summer_class_2                          -- 과목 목차도 없어짐 삭제이상 발생
WHERE subject LIKE 'Python';

-- 6. (NULL, 'C++', 35000) 객체를 삽입한다(이상 발생 이유는?)
INSERT INTO summer_class_2 VALUES(NULL, 'C++', 35000);  -- 신청한 학생이 NULL인데 개설됨 삽입이상 발생

-- 7. Java 수강료가 45,000원에서 40,000원으로 변경 되었다.(문제없는 코드)
UPDATE summer_class_2 SET price = 40000
WHERE subject = 'Java';

-- 8. 학번 101번의 Java 수강료가 45,000원에서 40,000원으로 변경 되었다. 이때 Java 수강료는?(이상 발생 이유는?)
UPDATE summer_class_2 SET price = 40000
WHERE subject = 'Java' AND sid = 101;

SELECT price FROM summer_class_2                        -- Java의 수강료가 2개임 수정이상 발생
WHERE subject LIKE 'Java';

ROLLBACK;