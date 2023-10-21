/*
-- 1. employee2 테이블에 (106, '양신입', 25, null, 30)을 삽입하시오. -- 에러 이유?
-- 2. 급여가 400만원 이상이고 부서번호가 10인 사원을 검색하시오.
-- 3. 급여가 많은 순으로 정렬하시오.
-- 4. 급여가 없는 사원을 검색하시오.
-- 5. 사원의 총인원을 구하시오.
-- 6. 사원의 급여 총액과 급여 평균을 구하시오.
-- 7. 사원의 총인원, 급여 총액과 급여 평균을 구하시오.
-- 8. 부서별 급여 총액을 구하시오.
-- 9. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(동등조인)
-- 10. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(내부조인)
-- 11. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(join ~ using)
-- 12. 부서아이디별, 부서이름별 급여 총액, 평균
-- 13. 부서아이디별, 부서이름별 급여 총액, 평균(ROLLUP 이용해서)
-- 14. 최고 급여와 최저 급여를 받는 사원의 정보를 검색하시오
-- 15. '백두산' 사원의 급여를 430만원으로 수정하세요.
-- 16. 사원의 급여 순위를 구하시오
*/

-- 1. employee2 테이블에 (106, '양신입', 25, null, 30)을 삽입하시오. -- 에러 이유?
INSERT INTO employee2 VALUES(106, '양신입', 25, null, 30);     -- 부모키가 없어서 무결성 제약 조건 발생

-- 2. 급여가 400만원 이상이고 부서번호가 10인 사원을 검색하시오.
SELECT * FROM employee2
WHERE sal >= 4000000 AND deptid = 10;

-- 3. 급여가 많은 순으로 정렬하시오.
SELECT * FROM employee2
ORDER BY sal DESC;

-- 4. 급여가 없는 사원을 검색하시오.
SELECT * FROM employee2
WHERE sal IS NULL;

-- 5. 사원의 총인원을 구하시오.
SELECT COUNT(*) 총인원 FROM employee2;

-- 6. 사원의 급여 총액과 급여 평균을 구하시오.
SELECT  ROUND(SUM(sal), 0) 급여총액, 
        ROUND(AVG(sal), 0) 급여평균
FROM employee2;

-- 7. 사원의 총인원, 급여 총액과 급여 평균을 구하시오.
SELECT  COUNT(*) 사원수,
        ROUND(SUM(sal), 0) 급여총액,
        ROUND(AVG(sal), 0) 급여평균
FROM employee2;

-- 8. 부서별 급여 총액을 구하시오.
SELECT  a.deptid, a.deptname, SUM(b.sal)
FROM department2 a, employee2 b
WHERE a.deptid = b.deptid
GROUP BY a.deptid, a.deptname;

-- 9. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(동등조인)
SELECT  a.deptid, 
        a.deptname, 
        b.empid, 
        b.empname, 
        b.age, 
        b.sal
FROM department2 a, employee2 b
WHERE a.deptid = b.deptid;

-- 10. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(내부조인)
SELECT  a.deptid,
        a.deptname,
        b.empid,
        b.empname,
        b.age,
        b.sal
FROM department2 a INNER JOIN employee2 b
    ON a.deptid = b.deptid;

-- 11. 부서이름을 포함한 사원의 모든 정보(부서아이디, 부서이름, 사원아이디, 사원이름, 사원 나이, 월급)를 검색하시오(join ~ using)
SELECT  deptid,
        a.deptname,
        b.empid,
        b.empname,
        b.age,
        b.sal
FROM department2 a INNER JOIN employee2 b
    USING (deptid);
    
-- 12. 부서아이디별, 부서이름별 급여 총액, 평균
SELECT  a.deptid, 
        a.deptname, 
        ROUND(SUM(b.sal), 0) 급여총액, 
        ROUND(AVG(b.sal), -2) 급여평균
FROM department2 a INNER JOIN employee2 b
    ON a.deptid = b.deptid
GROUP BY a.deptid, a.deptname;
    
-- 13. 부서아이디별, 부서이름별 급여 총액, 평균(ROLLUP 이용해서)
SELECT  a.deptid, 
        a.deptname, 
        ROUND(SUM(sal), 0) 급여총액, 
        ROUND(AVG(sal), -2) 급여평균
FROM department2 a INNER JOIN employee2 b
    ON a.deptid = b.deptid
GROUP BY ROLLUP(a.deptid, a.deptname);

-- 14. 최고 급여와 최저 급여를 받는 사원의 정보(사원아이디, 사원이름, 나이, 부서 아이디)를 검색하시오
SELECT * FROM employee2
WHERE sal = (SELECT MAX(sal) FROM employee2)
    OR sal = (SELECT MIN(sal) FROM employee2);
    
-- 15. '백두산' 사원의 급여를 430만원으로 수정하세요.
UPDATE employee2 SET sal = 4300000
WHERE empid = 102;
SELECT * FROM employee2;

-- 16. 사원의 급여 순위를 구하시오
SELECT  empname,
        sal,
        RANK() OVER(ORDER BY sal DESC) 급여1,
        DENSE_RANK() OVER(ORDER BY sal DESC) 급여2
FROM employee2;