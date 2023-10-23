use mydb;
CREATE TABLE '주문테이블'(
	'주문번호' varchar(16)	NOT NULL,
    '고객번호' varchar(16)	NOT NULL,
    '주문일'	 varchar(8)		NOT NULL,
    '주문가격' decimal(15,2) 	NOT NULL,
    '배송가격' varchar(256),
    '배송완료일' varchar(8),
    '결제금액'  varchar(8),
    '할인금액'  decimal(15,2) NOT NULL,
    '적립포인트' decimal(15,2) NOT NULL
    PRIMARY KEY('주문번호')
);

create table 장바구니(
	번호 int primary key auto_increment,
    아이템 varchar(20),
    가격 int
);

insert into 장바구니(아이템, 가격) values ('두부', 2000);
insert into 장바구니(아이템, 가격) values ('계란', 6000);
insert into 장바구니(아이템, 가격) values ('콩나물', 3000);

-- 가격별로 정렬하시오
