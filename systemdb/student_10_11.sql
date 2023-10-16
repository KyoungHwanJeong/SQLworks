/*
1. student 테이블 생성하기
    학번(PK), 학생이름(20 byte)(NOT NULL), 나이(2 byte)(NOT NULL), 성별(6 byte)(NOT NULL), 주소(50 byte), 과목이름(30 byte)(FK)
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
7. 주소가 없는 학생의 정보를 조회하기
8. 주소가 없는 학생을 삭제하고 전체 조회하기
9  주소에 공백 문자를 넣고 전체 조회하기, 데이터(1003, '우영우', 31, '여자', ' ','전기전자공학과')
10. 주소가 공백인 학생을 삭제하고, 롤백하고 전체 조회하기
11. 주소가 없는 학생을 삭제하기 전 상태에서 커밋 후 주소가 NULL인 데이터에 '수원시 영통구' 넣고 전체 조회하기
12. 학생의 나이가 적은 순으로 정렬하고 전체 조회하기
13. 학과명이 전기전자공학과인 학생을 나이가 많은 순으로 정렬하고 전체 조회하기
*/
-- 학생 테이블 생성
CREATE TABLE student(
    snumber NUMBER PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(2)NOT NULL,
    gender  VARCHAR2(6)NOT NULL,
    address VARCHAR2(50),
    mname   VARCHAR2(30) NOT NULL,
    FOREIGN KEY(mname)REFERENCES major(mname)      -- 외래키
);

-- 학생 추가
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1001, '이강', 22, '여자', '서울시 강서구', '소프트웨어학과');
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1002, '박대양', 34, '남자', '인천시 남구', '전기전자공학과');
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '우영우', 31, '여자', '', '전기전자공학과');

-- 부모 키에 없는 데이터는 삽입 이상이 발생한다.
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '김산', 29, '남자', '서울시 동대문구', '회계학과');  -- 삽입 이상


-- 전체 학생 조회
SELECT * FROM student;

-- 이름이 이강인 학생의 학번과 이름과 나이를 조회하기
SELECT snumber, sname, age FROM student
WHERE sname = '이강';

-- 이름에 '우'가 포함된 학생의 모든 정보를 출력하시오
SELECT * FROM student
WHERE sname LIKE '%우%';

-- 나이가 30세 이상이고, 성별이 남자인 학생의 모든 정보를 출력하시오
SELECT * FROM student
WHERE age >= 30 AND gender = '남자';

-- 주소가 없는 학생의 정보를 출력하시오(IS)
SELECT * FROM student
WHERE address IS NULL;

-- 주소가 없는 학생을 삭제
DELETE FROM student
WHERE address IS NULL;
SELECT * FROM student;

-- address 에 한칸 띄고(공백) 데이터 넣기
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '우영우', 31, '여자', ' ', '전기전자공학과');
SELECT * FROM student;


-- 주소가 공백인 학생을 삭제(NULL이 아님)
DELETE FROM student
WHERE address = ' ';
SELECT * FROM student;

-- 주소가 NULL 인 데이터에 '수원시 영통구'로 입력하기
UPDATE student SET address = '수원시 영통구'
WHERE address IS NULL;

-- 정렬하기(오름차순-ASC, 내림차순_DESC)
-- 학생의 나이가 적은 순으로 정렬하여 출력하시오
SELECT * FROM student
ORDER BY age;   -- ASC 생략.

-- 정렬하기(오름차순-ASC, 내림차순_DESC)
-- 학과명이 전기전자공학과 학생중에서 나이가 많은 순으로 정렬하여 출력하시오
SELECT * FROM student
WHERE mname = '전기전자공학과'
ORDER BY age DESC; -- 가장 늦게 컴파일 됨

-- 롤백
ROLLBACK;

-- 트랜잭션(롤백은 커밋 하기 전에 실행하면 취소가 된다, 복원이 됨)
COMMIT;

DROP TABLE student;
