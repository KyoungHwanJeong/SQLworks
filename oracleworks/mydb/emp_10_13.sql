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
-- emp 테이블
CREATE TABLE emp(
    empno       NUMBER(3) PRIMARY KEY,      -- 사원번호
    ename       VARCHAR2(20) NOT NULL,      -- 사원이름
    gender      VARCHAR2(6) NOT NULL,       -- 성별
    salary      NUMBER(10),                 -- 급여
    hire_date   VARCHAR2(20) NOT NULL       -- 입사일
);

-- 자료 생성
INSERT INTO emp VALUES (100, '이강', '남자', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '김산', '여자', 2500000, '2020-05-15');
INSERT INTO emp VALUES (102, '오상식', '남자', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '박신입', '여자', null, '2023-10-01');

COMMIT;

SELECT * FROM emp;

-- 실습 문제
--1. 사원을 입사일 순으로 정렬하시오(오름차순 정렬)
SELECT *
FROM emp
ORDER BY hire_date ASC;

--2. 사원을 급여 순으로 정렬하시오(오름차순 정렬)
SELECT *
FROM emp
ORDER BY salery ASC;

--3. 급여가 300만원 이하인 사원을 급여가 많은 순으로 정렬하시오
SELECT *
FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

--4. 급여가 없는 사원을 검색하시오
SELECT *
FROM emp
WHERE salary IS NULL;

--5. 사원의 총 수를 구하시오
SELECT COUNT(*) as 사원수
FROM emp;

--6. 사원의 급여 합계와 평균을 구하시오
SELECT  SUM(salary) AS 급여합계,
        AVG(salary) AS 급여평균
FROM emp;

--7. 이름이 김산인 사원의 성별을 남자로 변경하시오
--업데이트 하기
UPDATE emp SET gender = '남자'
WHERE ename = '김산';

SELECT REPLACE(gender, '여자', '남자')
FROM emp
WHERE ename = '김산';

--8. 이름이 오상식인 사원을 삭제하시오
DELETE FROM emp
WHERE ename = '오상식';

COMMIT;
ROLLBACK;

-- 반올림 : ROUND(숫자, 자리수)
SELECT  ename 사원이름,
        salary 급여,
        salary/30 일급,
        ROUND(salary/30, 1) 결과1,
        ROUND(salary/30, 0) 결과2,
        ROUND(salary/30, -1) 결과3
FROM emp;

-- 급여가 가장 많은 사원과 급여가 가장 적은 사원의 이름과 급여를 검색하시오
-- MAX(SALARY)
-- 서브쿼리(subquery)
-- 최고급여 구하기
SELECT MAX(salary) FROM emp;
SELECT MIN(salary) FROM emp;

SELECT ename, salary
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp) 
    OR salary = (SELECT MIN(salary) FROM emp);
/*
SELECT ename, salary
FROM emp
GROUP BY ename
    HAVING MAX(salary);
*/
