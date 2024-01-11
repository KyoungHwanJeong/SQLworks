
select * from department;
select * from employee;

use mydb;

-- 삽입 오류 : 부서 테이블에 아이디가 30이 없어서 에러
insert into employee values (106, '양신입', 25, null, 30);

-- 급여가 400만원 이상이고 부서번호가 10인 사원을 검색하시오.
select * from employee
where sal >= 4000000 and deptid = 10;

-- 급여가 많은 순으로 정렬하시오.
select * from employee
order by sal desc;

-- 급여가 없는 사원을 검색하시오.
select * from employee where sal is null;

-- 사원의 총인원을 구하시오.
select count(*) from employee;

-- 사원의 급여 총액과 급여 평균을 구하시오.
select round(sum(sal), 0), round(avg(sal), 0) from employee;

-- 사원의 총인원, 급여 총액과 급여 평균을 구하시오.
select 	count(*) 사원수,
		sum(sal) 급여총액,
		round(avg(sal), 0) 급여평균
    from employee;

-- 부서별 급여 총액을 구하시오.
select 	deptid, 
		sum(sal) 급여총액,
        round(avg(sal), -2) 급여평균
from employee
group by deptid;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오(조인)
select a.deptid 부서이름, b.*
from department a join employee b
on a.deptid = b.deptid;

-- 동등조인
select 	a.deptid,
		a.deptname,
		b.empid,
        b.empname,
        b.age,
        b.sal
from department a, employee b
where a.deptid = b.deptid;

-- 내부조인
select 	a.deptid,
		a.deptname,
		b.empid,
        b.empname,
        b.age,
        b.sal
from department a join employee b
on a.deptid = b.deptid;
 
 -- join ~ using
select 	a.deptid,
		a.deptname,
		b.empid,
        b.empname,
        b.age,
        b.sal
from department a join employee b
	using (deptid);
    
-- 부서아이디별, 부서이름별 급여 총액, 평균
select 	a.deptid, 
		a.deptname,
        sum(b.sal) 급여총액,
        round(avg(b.sal), -2) 급여평균
from department a join employee b
	on a.deptid = b.deptid
group by deptid, deptname;

-- 부서아이디별, 부서이름별 급여 소계, 총계(ROLLUP 이용해서)
select	a.deptid,
		a.deptname,
		sum(b.sal) 급여총액,
		round(avg(b.sal), -2) 급여평균
from department a join employee b
	on a.deptid = b.deptid
group by deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사원의 정보(사원아이디, 사원이름, 나이, 부서 아이디)를 검색하시오
select * from employee
where sal = (select max(sal) from employee) 
		or sal = (select min(sal) from employee);

-- '백두산' 사원의 급여를 430만원으로 수정하세요.
update employee set sal = 4300000
where empid = 102;			-- 기본키로만 변경이 가능함
select * from employee;

update employee set sal = 4300000
where empname like '백두산';

-- 사원의 급여 순위를 구하시오
select 	empname, 
		sal, 
        rank() over(order by sal desc) 급여순위1,
        dense_rank() over(order by sal desc) 급여순위2
from employee;