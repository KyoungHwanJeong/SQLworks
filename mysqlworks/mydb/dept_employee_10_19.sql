
-- 부서, 사원 테이블 생성

use mydb;
create table department(
	deptid    	int primary key,
    deptname	varchar(30) not null,
    location	varchar(20) not null
);

insert into department values (10, '개발팀', '서울');
insert into department values (20, '디자인팀', '부천');

create table employee(
	empid		int primary key,
    empname		varchar(30) not null,
    age			int not null,
    sal			int,
    deptid		int not null,
    foreign key(deptid) references department(deptid)
);

insert into employee values (101, '한강', 27, 2100000, 10);
insert into employee values (102, '백두산', 32, 3200000, 20);
insert into employee values (103, '오과장', 45, 5500000, 10);
insert into employee values (104, '김대리', 38, 4300000, 10);
insert into employee values (105, '양신입', 25, null, 10);

select * from department;
select * from employee;

drop table department;
drop table employee;
commit;