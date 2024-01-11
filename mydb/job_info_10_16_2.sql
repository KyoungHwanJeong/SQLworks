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

CREATE TABLE JOB_INFO_2(
    JOB_ID      VARCHAR2(10),
    MIN_SALARY  NUMBER,
    MAX_SALARY  NUMBER
);

INSERT INTO JOB_INFO_2 VALUES('AD_PRES', 20000, 40000);
INSERT INTO JOB_INFO_2 VALUES('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO_2 VALUES('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO_2 VALUES('FI_MGR', 8000, 16000);
INSERT INTO JOB_INFO_2 VALUES('FI_ACCOUNT', 4000, 9000);
INSERT INTO JOB_INFO_2 VALUES('AC_MGR', 8000, 16000);
INSERT INTO JOB_INFO_2 VALUES('AC_ACCOUNT', 4000, 9000);

COMMIT;
SELECT * FROM JOB_INFO_2;

-- 1. 최저급여, 최고급여의 평균을 구하시오
SELECT  ROUND(AVG(MIN_SALARY), -2) 최저급여평균,
        ROUND(AVG(MAX_SALARY), -2) 최고급여평균
FROM JOB_INFO_2;

-- 2. 최저급여가 5000 달러 이상인 직업 아이디를 검색하시오
SELECT JOB_ID, MIN_SALARY FROM JOB_INFO_2
WHERE MIN_SALARY >= 5000;

-- 3. 최저 급여가 5000 달러 이상인 정보를 검색한 뷰 생성하시오
CREATE VIEW V_JOB_INFO_2
AS SELECT * FROM JOB_INFO_2
WHERE MIN_SALARY >= 5000;

-- 4. 최고 급여와 최저 급여의 차가 10000 달러 이상인 직업 아이디 수를 검색하시오
SELECT COUNT(JOB_ID)
FROM JOB_INFO_2
WHERE MAX_SALARY - MIN_SALARY >= 10000;

SELECT JOB_ID, COUNT(JOB_ID)
FROM JOB_INFO_2
WHERE MAX_SALARY - MIN_SALARY >= 10000
GROUP BY JOB_ID;

-- 5. 직업 아이디 이름이 FI로 시작하는 자료를 검색하시오(뷰에서 검색)
SELECT * FROM V_JOB_INFO_2
WHERE JOB_ID LIKE 'FI%';

-- 6. 최고 급여가 가장 높은 직업의 아이디를 검색하시오
SELECT JOB_ID FROM JOB_INFO_2
WHERE MAX_SALARY = (SELECT MAX(MAX_SALARY) FROM JOB_INFO_2);

