/*
-- 이벤트 테이블을 생성한다
    이벤트번호(PK), 이벤트이름(50 byte)(NOT NULL), 시작일(20 byte)(NOT NULL), 종료일(20 byte)(NOT NULL)
-- 시퀀스 번호를 생성한다
-- 이벤트 데이터
    (seq_eno.NEXTVAL, '20% 할인 쿠폰 증정', '2023-10-10', '2023-10-20')
    (seq_eno.NEXTVAL, '마우스 패드 증정', '2023-11-15', '2023-11-25')
    (seq_eno.NEXTVAL, '벚꽃 축제 페스티벌', '2023-12-10', '2023-12-30')
    
-- 1. 구매 날짜에 진행 하고 있는 이벤트 이름, 아이디, 상품후기, 등록날짜를 출력하시오
-- 2. 구매 날짜에 진행 하고 있는 이벤트 이름, 아이디, 상품후기, 등록날짜를 출력하시오(표준방식 조인을 이용)
*/
-- event 테이블 생성
CREATE TABLE event(
    event_no    NUMBER PRIMARY KEY,         -- 이벤트 번호
    event_name  VARCHAR2(50) NOT NULL,      -- 이벤트 이름
    start_date  VARCHAR2(20) NOT NULL,      -- 시작일
    end_date    VARCHAR2(20) NOT NULL       -- 종료일
);

-- 자동 일련번호
CREATE SEQUENCE seq_eno NOCACHE;

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '20% 할인 쿠폰 증정', '2023-10-10', '2023-10-20');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '마우스 패드 증정', '2023-11-15', '2023-11-25');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '벚꽃 축제 페스티벌', '2023-12-10', '2023-12-30');

COMMIT;
SELECT * FROM event;

-- 이벤트 기간 동안에 리뷰를 작성한 고객에게 사은품을 주는 행사
-- 리뷰테이블과 이벤트 테이블 조인
-- 일대다(이벤트와 리뷰)
-- 비동등조인 NON EQ(>=, <=, between and)
select  a.event_name 이벤트이름,
        b.member_id 아이디,
        b.content 상품후기,
        b.regdate 등록날짜
from event a, product_review b
where b.regdate 
    between a.start_date and a.end_date;
    
-- 내부조인
select  a.event_name 이벤트이름,
        b.member_id 아이디,
        b.content 상품후기,
        b.regdate 등록날짜
from event a INNER JOIN product_review b
--ON b.regdate
--    between a.start_date and a.end_date;
ON b.regdate >= a.start_date and b.regdate <= a.end_date;    


-- 시험에 조인의 2가지 방식 나옴!
