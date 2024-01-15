-- t_member 테이블 생성

use springdb;
drop table if exists t_member;
create table t_member(
	id bigint primary key auto_increment,
    email varchar(50) unique,
    password varchar(20) not null,
    name varchar(20) not null,
    age int
);

commit;
select* from t_member;
truncate t_member;
