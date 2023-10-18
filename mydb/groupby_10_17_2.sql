/*

--1. '1002'번 부서 이름을 '총무팀'으로 변경하기
--2. 부서별 급여 총액을 구하시오
--3. 부서 이름과 부서별 급여 총액을 출력하시오
--4. 부서 이름과 부서별 급여 총액을 출력하시오(ROLLUP을 이용해서)
--5. 부서 이름과 부서별 급여 총액을 출력하시오(CUBE를 이용해서)
--6. 직원 이름과 월급, 월급의 총합을 출력하시오
--7. '강태양'의 급여를 3000000원으로 변경하기
--8. 직원 이름과 월급, 월급의 총합, 순위는 월급이 많은 순서로 순위를 매겨서 출력하시오
*/
-- department 테이블 생성
CREATE TABLE department_2(
    deptno      VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office      VARCHAR2(20)
);

INSERT INTO department_2 VALUES('1000', '인사팀', '서울');
INSERT INTO department_2 VALUES('1001', '전산팀', '인천');
INSERT INTO department_2 VALUES('1002', '전산팀', '수원');
INSERT INTO department_2(deptno, deptname) VALUES('1003', '영업팀');

-- employee 테이블 생성
CREATE TABLE employee_2(
    empno    NUMBER(3) PRIMARY KEY,
    empname  VARCHAR2(20) NOT NULL,
    sal   NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno   VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno)      -- 외래키
);
INSERT INTO employee_2 VALUES (100,'이강', 2500000, SYSDATE, '1000');
INSERT INTO employee_2 VALUES (101,'김산', 2000000, SYSDATE, '1001');
INSERT INTO employee_2 VALUES (102,'박달', 3000000, SYSDATE, '1002');
INSERT INTO employee_2 VALUES (103,'강태양', 3500000, SYSDATE, '1000');
INSERT INTO employee_2 VALUES (104,'최우주', 5000000, SYSDATE, '1001');
INSERT INTO employee_2 VALUES (105,'우영우', 4000000, SYSDATE, '1002');

COMMIT;
SELECT * FROM department_2;
SELECT * FROM employee_2;

--1. '1002'번 부서 이름을 '총무팀'으로 변경하기
UPDATE department_2 SET deptname = '총무팀'
WHERE deptno = 1002;

--2. 부서별 급여 총액을 구하시오
SELECT deptno 부서번호, SUM(sal) 급여총액
FROM employee_2
GROUP BY deptno;

--3. 부서 이름과 부서별 급여 총액을 출력하시오
SELECT  a.deptno, 
        a.deptname, 
        SUM(b.sal) 급여총액
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY a.deptno, a.deptname;

--4. 부서 이름과 부서별 급여 총액을 출력하시오(ROLLUP을 이용해서)
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) 급여총액
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY ROLLUP(a.deptno, a.deptname);

--5. 부서 이름과 부서별 급여 총액을 출력하시오(CUBE를 이용해서)
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) 급여총액
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY CUBE(a.deptno, a.deptname);

--6. 직원 이름과 월급, 월급의 총합을 출력하시오
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno) "sal_sum"
FROM employee_2;

--7. '강태양'의 급여를 3000000원으로 변경하기
UPDATE employee_2 SET sal = 3000000
WHERE empname = '강태양';

--8. 직원 이름과 월급, 월급의 총합, 순위는 월급이 많은 순서로 순위를 매겨서 출력하시오
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno),
        DENSE_RANK() OVER(ORDER BY sal DESC)
FROM employee_2;

COMMIT;