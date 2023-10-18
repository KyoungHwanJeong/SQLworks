/*
-- emp 테이블을 생성한다
    사원번호(PK)(3 byte), 사원이름(20 byte)(NOT NULL), 성별(6 byte)(NOT NULL), 급여(10 byte), 입사일(20 byte)(NOT NULL)
-- 사원 데이터
    (100, '이강', '남자', 3000000, '2019-01-01')
    (101, '김산', '여자', 2500000, '2020-05-15')
    (102, '오상식', '남자', 5000000, '2015-02-22')
    (103, '박신입', '여자', null, '2023-10-01')
    를 생성한다.
-- 실습 문제
--1. 사원을 입사일 순으로 정렬하시오(오름차순 정렬)
--2. 사원을 급여 순으로 정렬하시오(오름차순 정렬)
--3. 급여가 300만원 이하인 사원을 급여가 많은 순으로 정렬하시오
--4. 급여가 없는 사원을 검색하시오
--5. 사원의 총 수를 구하시오
--6. 사원의 급여 합계와 평균을 구하시오
--7. 이름이 김산인 사원의 성별을 남자로 변경하시오
--8. 이름이 오상식인 사원을 삭제하시오
--9. 사원이름과 급여, 일급을 계산하시오(결과1: 일의자리에서 반올림, 결과2: 소수 첫째자리에서 반올림,
    결과3: 소수 둘째 자리에서 반올림)
--10. 급여가 가장 많은 사원과 급여가 가장 적은 사원의 이름과 급여를 검색하시오(서브쿼리)
*/
CREATE TABLE emp_2(
    empno NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    gender VARCHAR2(6) NOT NULL,
    salary NUMBER(10),
    hire_date VARCHAR2(20) NOT NULL
);
INSERT INTO emp_2 VALUES(100, '이강', '남자', 3000000, '2019-01-01');
INSERT INTO emp_2 VALUES(101, '김산', '여자', 2500000, '2020-05-15');
INSERT INTO emp_2 VALUES(102, '오상식', '남자', 5000000, '2015-02-22');
INSERT INTO emp_2 VALUES(103, '박신입', '여자', null, '2023-10-01');

COMMIT;
SELECT * FROM emp_2;

-- 실습 문제
--1. 사원을 입사일 순으로 정렬하시오(오름차순 정렬)
SELECT * FROM emp_2
ORDER BY hire_date ASC;

--2. 사원을 급여 순으로 정렬하시오(오름차순 정렬)
SELECT * FROM emp_2
ORDER BY salary ASC;

--3. 급여가 300만원 이하인 사원을 급여가 많은 순으로 정렬하시오
SELECT * FROM emp_2
WHERE salary <= 3000000
ORDER BY salary DESC;

--4. 급여가 없는 사원을 검색하시오
SELECT * FROM emp_2
WHERE salary IS NULL;

--5. 사원의 총 수를 구하시오
SELECT COUNT(empno) AS 사원의총수
FROM emp_2;

--6. 사원의 급여 합계와 평균을 구하시오
SELECT  SUM(salary) AS 급여합계, 
        AVG(salary) AS 급여평균
FROM emp_2;

--7. 이름이 김산인 사원의 성별을 남자로 변경하시오
UPDATE emp_2 SET gender = '남자'
WHERE empname = '김산';
SELECT * FROM emp_2;

SELECT REPLACE(gender, '여자', '남자')
FROM emp_2
WHERE empname = '김산';
SELECT * FROM emp_2;

COMMIT;

--8. 이름이 오상식인 사원을 삭제하시오
DELETE FROM emp_2
WHERE empname = '오상식';
SELECT * FROM emp_2;

ROLLBACK;
SELECT * FROM emp_2;

--9. 사원이름과 급여, 일급을 계산하시오(결과1: 일의자리에서 반올림, 결과2: 소수 첫째자리에서 반올림,
--  결과3: 소수 둘째 자리에서 반올림)
SELECT  empname 사원이름,
        salary  급여,
        salary/30 일급,
        ROUND(salary/30, -1) 결과1,
        ROUND(salary/30, 0) 결과2,
        ROUND(salary/30, 1) 결과3
FROM emp_2;

--10. 급여가 가장 많은 사원과 급여가 가장 적은 사원의 이름과 급여를 검색하시오(서브쿼리)
SELECT empname, salary
FROM emp_2
WHERE salary = (SELECT MAX(salary) FROM emp_2) 
    OR salary = (SELECT MIN(salary) FROM emp_2);
    