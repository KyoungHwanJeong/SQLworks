/*
1. student 테이블 생성하기
    학번(PK), 학생이름(20 byte)(NOT NULL), 나이(2 byte)(NOT NULL), 성별(6 byte)(NOT NULL), 주소(50 byte), 과목이름(30 byte)(FK)(NOT NULL)
2. 학생 데이터
    (1001, '이강', 22, '여자', '서울시 강서구', '소프트웨어학과')
    (1002, '박대양', 34, '남자', '인천시 남구', '전기전자공학과')
    (1003, '우영우', 31, '여자', '', '전기전자공학과')
    (1003, '김산', 29, '남자', '서울시 동대문구', '회계학과')
    를 넣는다.
3. 전체 학생조회하기
4. 이름이 이강인 학생의 학번과 이름과 나이를 조회하기
5. 이름에 '우'가 들어간 학생의 모든 정보를 조회하기
6. 나이가 30세 이상이고 성별이 남자인 학생의 모든 정보를 조회하기
7. 커밋 하고, 주소가 없는 학생의 정보를 조회하기
8. 주소가 없는 학생을 삭제하고 전체 조회하기
9  주소에 공백 문자를 넣고 전체 조회하기, 데이터(1003, '우영우', 31, '여자', ' ','전기전자공학과')
10. 주소가 공백인 학생을 삭제하고, 롤백하고 전체 조회하기
11. 주소가 없는 학생을 삭제하기 전 상태에서 커밋 후 주소가 NULL인 데이터에 '수원시 영통구' 넣고 전체 조회하기
12. 학생의 나이가 적은 순으로 정렬하고 전체 조회하기
13. 학과명이 전기전자공학과인 학생을 나이가 많은 순으로 정렬하고 전체 조회하기
*/
CREATE TABLE student_2(
    stuid   NUMBER PRIMARY KEY,                     -- PK
    stuname VARCHAR2(20) NOT NULL,
    age     NUMBER(2) NOT NULL,
    gender  VARCHAR2(6) NOT NULL,
    stuaddress VARCHAR(50),
    majorname VARCHAR2(30) NOT NULL,
    FOREIGN KEY(majorname) REFERENCES major_2       -- FK
);

INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES (1001, '이강', 22, '여자', '서울시 강서구', '소프트웨어학과');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1002, '박대양', 34, '남자', '인천시 남구', '전기전자공학과');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '우영우', 31, '여자', '','전기전자공학과');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '김산', 29, '남자', '서울시 동대문구', '회계학과');                   -- 무결성 제약조건에 위배

COMMIT;
SELECT * FROM student_2;

SELECT stuid, stuname, age
FROM student_2
WHERE stuname = '이강';

SELECT * FROM student_2
WHERE stuname LIKE '%우%';

SELECT * FROM student_2
WHERE age >= 30 AND gender = '남자';

SELECT * FROM student_2
WHERE stuaddress IS NULL;

COMMIT;
DELETE FROM student_2
WHERE stuaddress IS NULL;
SELECT * FROM student_2;

INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '우영우', 31, '여자', ' ', '전기전자공학과');
SELECT * FROM student_2;

DELETE FROM student_2
WHERE stuaddress = ' ';
SELECT * FROM student_2;

ROLLBACK;
SELECT * FROM student_2;

UPDATE student_2 SET stuaddress = '수원시 영통구'
WHERE stuaddress IS NULL;
SELECT * FROM student_2;

SELECT * FROM student_2
ORDER BY age ASC;

SELECT * FROM student_2
WHERE majorname = '전기전자공학과'
ORDER BY age DESC;




