use springdb;

drop table if exists t_board;
create table t_board(
	id int primary key auto_increment,
    btitle varchar(200) not null,
	bwriter varchar(30) not null,
	bcontent varchar(2000) not null,
	createddate datetime default now()
);

select * from t_board;
