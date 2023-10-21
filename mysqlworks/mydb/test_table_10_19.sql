-- 먼저 db를 선택함
use mydb;
create table test(
	no 	int,						-- 숫자형	// MySQL은 끝에 한칸 띄워야됨
    msg	varchar(100)				-- 문자형
);

insert into test values (1, '좋은 하루 되세요~');
insert into test values (2, 'Good Luck!!');

select * from test;
commit;

drop table test;