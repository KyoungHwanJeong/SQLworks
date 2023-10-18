/*
-- 제1정규화 대상
-- 1. 직업이 가수인 연예인은?(entertainers 테이블로 검색, 검색의 어려움이 있음 정규화 필요)
-- 2. 연예인의 이름과 생년월일, 직업을 검색하시오(동등조인)
-- 3. 연예인의 이름과 생년월일, 직업을 검색하시오(내부조인)
*/
-- 연예인 테이블
CREATE TABLE entertainers(
    name        VARCHAR2(30),
    birthday    VARCHAR2(20),
    job         VARCHAR2(30)
);

INSERT INTO entertainers
VALUES ('양동근', '19790601', '배우, 가수');
INSERT INTO entertainers
VALUES ('박은빈', '19920904', '배우');
INSERT INTO entertainers
VALUES ('장기하', '19820220', '배우, 가수');
COMMIT;
SELECT * FROM entertainers;

-- 제1정규화 대상
-- 속성값이 원자값이어야 한다
-- 직업이 가수인 연예인은? 검색의 어려움이 있음
SELECT * FROM entertainers
WHERE job LIKE '%가수%';

-- 연예인 테이블, 직업 테이블로 분해(제2정규화)
CREATE TABLE entertainer(
    name        VARCHAR2(20),
    birthday    VARCHAR2(20)
);
INSERT INTO entertainer VALUES ('양동근', '19790601');
INSERT INTO entertainer VALUES ('박은빈', '19920904');
INSERT INTO entertainer VALUES ('장기하', '19820220');
COMMIT;

CREATE TABLE job(
    ename       VARCHAR2(20),
    jobname     VARCHAR2(30)
);
INSERT INTO job VALUES ('양동근', '배우');
INSERT INTO job VALUES ('양동근', '가수');
INSERT INTO job VALUES ('박은빈', '배우');
INSERT INTO job VALUES ('장기하', '배우');
INSERT INTO job VALUES ('장기하', '가수');

SELECT * FROM entertainer;
SELECT * FROM job;

-- 연예인의 이름과 생년월일, 직업을 검색하시오
-- 동등조인
SELECT  a.name, 
        a.birthday, 
        b.jobname
FROM entertainer a, job b
WHERE a.name = b.ename;
    
-- 내부 조인(INNER JOIN)
SELECT  a.name "연예인 이름", 
        a.birthday 생일, 
        b.jobname 직업
FROM entertainer a INNER JOIN job b
    ON a.name = b.ename;
    


