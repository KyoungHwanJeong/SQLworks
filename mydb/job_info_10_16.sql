/*
-- JOB_INFO 테이블을 생성한다.
    직업 아이디(10 byte), 최저급여, 최고급여
-- JOB 데이터
    ('AD_PRES', 20000, 40000)
    ('AD_VP', 15000, 30000)
    ('AD_ASST', 3000, 6000)
    ('FI_MGR', 8000, 16000)
    ('FI_ACCOUNT', 4000, 9000)
    ('AC_MGR', 8000, 16000)
    ('AC_ACCOUNT', 4000, 9000)
    를 생성한다.
-- 1. 최저급여, 최고급여의 평균을 구하시오
-- 2. 최저급여가 5000 달러 이상인 직업 아이디를 검색하시오
-- 3. 최저 급여가 5000 달러 이상인 정보를 검색한 뷰 생성하시오
-- 4. 최고 급여와 최저 급여의 차가 10000 달러 이상인 직업 아이디 수를 검색하시오
-- 5. 직업 아이디 이름이 FI로 시작하는 자료를 검색하시오(뷰에서 검색)
-- 6. 최고 급여가 가장 높은 직업의 아이디를 검색하시오
*/
-- JOB_INFO 테이블 생성
-- SALARY는 달러 기준임
CREATE TABLE JOB_INFO(
    JOB_ID      VARCHAR(10),        -- 직업 아이디
    MIN_SALARY  NUMBER,             -- 최저급여
    MAX_SALARY  NUMBER              -- 최고급여
);

INSERT INTO JOB_INFO VALUES('AD_PRES', 20000, 40000);
INSERT INTO JOB_INFO VALUES('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO VALUES('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO VALUES('FI_MGR', 8000, 16000);
INSERT INTO JOB_INFO VALUES('FI_ACCOUNT', 4000, 9000);
INSERT INTO JOB_INFO VALUES('AC_MGR', 8000, 16000);
INSERT INTO JOB_INFO VALUES('AC_ACCOUNT', 4000, 9000);

COMMIT;

SELECT * FROM JOB_INFO;

-- 최저급여, 최고급여의 평균을 구하시오
SELECT  ROUND(AVG(MIN_SALARY), -1) 최저급여평균,
        ROUND(AVG(MAX_SALARY), -1) 최고급여평균
FROM JOB_INFO;

/*
    실행순서
    1. FROM 절
    2. WHERE 절
    3. SELECT 절
    4. ORDER 절
*/
-- 최저급여가 5000 달러 이상인 직업 아이디를 검색하시오
SELECT JOB_ID, MIN_SALARY AS MIN_SAL
FROM JOB_INFO
WHERE MIN_SALARY >= 5000;
     --MIN_SAL >= 5000;         -- 닉넴을 선언하는 SELECT 절이 나중에 실행되므로 닉넴을 붙이면 에러가 남

-- 최저 급여가 5000 달러 이상인 정보를 검색한 뷰 생성하시오
CREATE VIEW V_JOB_INFO
AS SELECT *
FROM JOB_INFO
WHERE MIN_SALARY >= 5000;

-- 최고 급여와 최저 급여의 차가 10000 달러 이상인 직업 아이디 수를 검색하시오
SELECT JOB_ID, COUNT(JOB_ID) 직업아이디수
FROM JOB_INFO
WHERE MAX_SALARY - MIN_SALARY >= 10000
GROUP BY JOB_ID;

SELECT COUNT(JOB_ID)
FROM JOB_INFO
WHERE SUB(MAX_SALARY, MIN_SALARY) >= 10000;

-- 직업 아이디 이름이 FI로 시작하는 자료를 검색하시오(뷰에서 검색)
SELECT * FROM V_JOB_INFO
WHERE JOB_ID LIKE 'FI%';

-- 최고 급여가 가장 높은 직업의 아이디를 검색하시오
SELECT JOB_ID
FROM JOB_INFO
WHERE MAX_SALARY = (SELECT MAX(MAX_SALARY) FROM JOB_INFO);


COMMIT;

drop table JOB_INFO;
TRUNCATE TABLE JOB_INFO;

drop view V_JOB_INFO;