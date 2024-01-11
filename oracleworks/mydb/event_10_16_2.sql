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

CREATE TABLE event_2(
    event_no    NUMBER PRIMARY KEY,         -- 이벤트 번호
    event_name  VARCHAR2(50) NOT NULL,      -- 이벤트 이름
    start_date  VARCHAR2(20) NOT NULL,      -- 시작일
    end_date    VARCHAR2(20) NOT NULL       -- 종료일
);
-- 시퀀스 생성
CREATE SEQUENCE seq_eno_2 NOCACHE;
-- 이벤트 데이터
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '20% 할인 쿠폰 증정', '2023-10-10', '2023-10-20');
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '마우스 패드 증정', '2023-11-15', '2023-11-25');
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '벚꽃 축제 페스티벌', '2023-12-10', '2023-12-30');
COMMIT;
SELECT * FROM event_2;

-- 1. 구매 날짜에 진행 하고 있는 이벤트 이름, 아이디, 상품후기, 등록날짜를 출력하시오
SELECT  a.event_name 이벤트이름,
        b.member_id 아이디,
        b.content 상품후기,
        b.regdate 등록날짜
FROM event_2 a, product_review_2 b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

-- 2. 구매 날짜에 진행 하고 있는 이벤트 이름, 아이디, 상품후기, 등록날짜를 출력하시오(표준방식 조인을 이용)
SELECT  a.event_name 이벤트이름,
        b.member_id 아이디,
        b.content 상품후기,
        b.regdate 등록날짜
FROM event_2 a INNER JOIN product_review_2 b
ON b.regdate >= a.start_date AND b.regdate <= a.end_date;


DROP TABLE event_2;
DROP SEQUENCE seq_eno_2;