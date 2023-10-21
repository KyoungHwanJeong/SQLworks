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
-- 5. 이후 'Python'강좌를 신청 한 학생을 삭제한다(이상 발생 이유는?)
-- 6. (NULL, 'C++', 35000) 객체를 삽입한다(이상 발생 이유는?)
-- 7. Java 수강료가 45,000원에서 40,000원으로 변경 되었다.(문제없는 코드)
-- 8. 학번 101번의 Java 수강료가 45,000원에서 40,000원으로 변경 되었다. 이때 Java 수강료는?(이상 발생 이유는?)
*/
-- 여름 학기 테이블
CREATE TABLE summer_class(
    sid     NUMBER,                     -- 학번
    subject VARCHAR2(20),               -- 과목
    price   NUMBER                      -- 수강료
);
-- 계절 학기 데이터
INSERT INTO summer_class(sid, subject, price) VALUES(100, 'C', 30000);
INSERT INTO summer_class(sid, subject, price) VALUES(101, 'Java', 45000);
INSERT INTO summer_class(sid, subject, price) VALUES(200, 'Python', 40000);
INSERT INTO summer_class(sid, subject, price) VALUES(201, 'Java', 45000);

-- 계절학기를 수강하는 학생의 학번과 수강하는 과목은?
SELECT sid, subject FROM summer_class;

-- 'Python' 강좌의 수강료는?
SELECT price FROM summer_class
WHERE subject LIKE 'Python';

-- 여름학기를 듣는 학생수와 수강료 총액은?
SELECT COUNT(sid) 학생수, SUM(price) 수강료총액
FROM summer_class;

-- 200번 학생이 수강 취소(삭제)
DELETE FROM summer_class
WHERE sid = 200;

-- 이후 'Python'강좌를 신청 한 학생을 출력하면 삭제이상이 발생
--
SELECT price FROM summer_class          -- 삭제 이상 발생(학번, 과목, 수강료 목록이 사라짐)
WHERE subject LIKE 'Python';            

-- 삽입 이상
-- C++ 강좌 개설 : 신청한 학생이 없음
INSERT INTO summer_class VALUES(NULL, 'C++', 35000);        -- 삽입 이상 발생

-- 학생 3명, 튜플은 4개
SELECT COUNT(*) 수강인원
FROM summer_class;

SELECT COUNT(sid) 수강인원                        -- 불일치(NULL값이 포함됨)
FROM summer_class;

-- 수정 이상
-- Java 수강료가 45,000원에서 40,000원으로 변경
UPDATE summer_class SET price = 40000           -- 문제 없는 코드
WHERE subject LIKE 'Java';

-- 만약 UPDATE문을 다음처럼 하면 이상 현상 발생
-- 1건만 수정
UPDATE summer_class SET price = 40000           
WHERE subject LIKE 'Java'
    AND sid = 101;

-- Java 수강료는?
-- 수정 이상 현상 발생, 수강료가 2개 출력됨
SELECT price FROM summer_class
WHERE subject LIKE 'Java';

SELECT * FROM summer_class;
drop table summer_class;

COMMIT;
ROLLBACK;