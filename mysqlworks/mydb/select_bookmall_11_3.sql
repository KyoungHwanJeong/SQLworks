-- bookmall
use mydb;

select * from book;

-- 도서를 이름순으로 정렬
select * from book
order by bookname;

-- 도서를 가격이 높은 순으로 정렬
select * from book
order by price desc;

-- 도서이름에 '축구'가 포함된 출판사 검색
select bookid, publisher from book where bookname like "%축구%";

-- 도서이름에 '축구'가 포함되면서 가격이 10,000원 이상인 도서 검색
select * from book where bookname like "%축구%" and price >= 10000;

-- 도서 테이블에 있는 모든 출판사를 검색하는데 중복된 이름의 출판사를 제외한다
select distinct publisher from book;

-- 도서 가격이 10000이상이고, 20000 이하인 도서 검색하기
select * from book where price >= 10000 and price <= 20000;
select * from book where price between 10000 and 20000;

-- 가격이 13000원이 아닌 도서 검색
select * from book where price != 13000;
select * from book where price <> 13000;

-- 가격이 13000원인 도서 검색
select * from book where price = 13000;

-- 고객을 이름순으로 정렬하시오(오름차순)
select * from customer order by name asc;

-- 전화번호가 없는 고객을 검색하시오
-- orcle에서는 is null 로 검색이 된다
select * from customer where phone = ' ';

-- 주소가 대한민국인 고객을 검색하시오
select * from customer where address like '%대한민국%';

-- 주소가 대한민국이 아닌 고객을 검색하시오
select * from customer where address not like '%대한민국%';

-- 고객의 총인원 수를 구하시오
select count(*) as 총인원수 from customer;

-- 도서 중에서 도서 가격이 가장 높은 도서를 검색하시오
select (select max(price) from book a) from book b where a.bookid = b.bookid;

select * from book b where price = (select max(price) from book);

-- 주문 테이블에서 주문 가격의 총 판매액을 구하시오
select sum(saleprice) as 총판매액, round(avg(salprice/count(*)), 0) as 총평균액  from orders;

-- 고객별(custid)로 주문한 도서의 총판매액을 계산
select custid, count as 도서수량, sum(saleprice) as 총판매액 from orders group by custid;

-- 도서를 3권이상 산 사람 + 고객별(custid)로 주문한 도서의 총판매액을 계산
select custid, count(*) as 도서수량, sum(saleprice) as 총판매액 from orders group by custid having count(*) >= 3;

-- 도서를 3권이상 산 사람 + 고객별(custid)로 주문한 도서의 총판매액을 계산 + 고객 이름
select 	a.name,
		a.custid,
		count(b.orderid) as 도서수량, 
        sum(b.saleprice) as 총판매액 
from customer a join orders b 
where a.custid=b.custid 
group by b.custid 
having count(b.orderid) >= 3;

