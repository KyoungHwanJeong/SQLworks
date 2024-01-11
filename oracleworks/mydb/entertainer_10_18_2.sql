/*
-- 제1정규화 대상
-- 1. 직업이 가수인 연예인은?(entertainers 테이블로 검색, 검색의 어려움이 있음 정규화 필요)
-- 2. 연예인의 이름과 생년월일, 직업을 검색하시오(동등조인)
-- 3. 연예인의 이름과 생년월일, 직업을 검색하시오(내부조인)
*/
-- 연예인 테이블
CREATE TABLE entertainers_2(
    name        VARCHAR2(30),
    birthday    VARCHAR2(20),
    job         VARCHAR2(30)
);

INSERT INTO entertainers_2
VALUES ('양동근', '19790601', '배우, 가수');
INSERT INTO entertainers_2
VALUES ('박은빈', '19920904', '배우');
INSERT INTO entertainers_2
VALUES ('장기하', '19820220', '배우, 가수');
COMMIT;
SELECT * FROM entertainers_2;

-- 연예인 테이블, 직업 테이블로 분해(제2정규화)
CREATE TABLE entertainer_2(
    name        VARCHAR2(20),
    birthday    VARCHAR2(20)
);
INSERT INTO entertainer_2 VALUES ('양동근', '19790601');
INSERT INTO entertainer_2 VALUES ('박은빈', '19920904');
INSERT INTO entertainer_2 VALUES ('장기하', '19820220');
COMMIT;

CREATE TABLE job_2(
    ename       VARCHAR2(20),
    jobname     VARCHAR2(30)
);
INSERT INTO job_2 VALUES ('양동근', '배우');
INSERT INTO job_2 VALUES ('양동근', '가수');
INSERT INTO job_2 VALUES ('박은빈', '배우');
INSERT INTO job_2 VALUES ('장기하', '배우');
INSERT INTO job_2 VALUES ('장기하', '가수');

SELECT * FROM entertainer_2;
SELECT * FROM job_2;

-- 1. 직업이 가수인 연예인은?(entertainers 테이블로 검색, 검색의 어려움이 있음 정규화 필요)
SELECT *
FROM entertainers_2
WHERE job LIKE '%가수%';

-- 2. 연예인의 이름과 생년월일, 직업을 검색하시오(동등조인)
SELECT  A.name,
        A.birthday,
        B.jobname
FROM entertainer_2 A, job_2 B
WHERE A.name = b.ename;

-- 3. 연예인의 이름과 생년월일, 직업을 검색하시오(내부조인)
SELECT  A.name,
        A.birthday,
        B.jobname
FROM entertainer_2 A INNER JOIN job_2 B
    ON A.name = b.ename;


