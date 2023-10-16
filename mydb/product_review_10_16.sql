/*
-- product_review 테이블을 생성한다
    리뷰번호(PK), 상품코드(6 byte)(NOT NULL), 회원아이디(20 byte)(NOT NULL), 리뷰내용(CLOB)(NOT NULL),
    작성일(DATE DEFALUT)
    상품코드는 외래키이다
-- 시퀀스 seq_rno 를 캐쉬 없음으로 생성한다
-- 리뷰 데이터
    (seq_rno.NEXTVAL, '100001', 'today10', '무소음인데 소음이 조금 있는 듯...')
    (seq_rno.NEXTVAL, '100002', 'cloud100', '무선이라 정말 편하네요!')
    (seq_rno.NEXTVAL, '100003', 'sky123', '게임할 맛 납니다.')

-- 1. 커밋 하고 나서 테이블 유지하고 데이터 전체 삭제하기
-- 2. 시퀀스를 삭제하고 다시 생성하기
-- 3. 상품코드가 '100001'이고 회원 아이디가 'cloud100'인 상품의 정보를 출력하시오
-- 4. 리뷰가 있는 상품을 검색하시오(오라클 방식, 동등조인)
-- 5. 리뷰가 있는 상품을 검색하시오(표준방식, 내부조인을 이용)
-- 6. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(오라클 방식)
-- 7. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식)
-- 8. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식 RIGHT JOIN으로 )
*/
-- product_review 테이블 생성
-- clob(character large object) - 매우 큰 문자열 자료형(4기가)
CREATE TABLE product_review(
    review_no       NUMBER PRIMARY KEY,         -- 리뷰번호
    product_code    CHAR(6) NOT NULL,          -- 상품코드
    member_id       VARCHAR2(20) NOT NULL,      -- 회원아이디
    content         CLOB NOT NULL,             -- 리뷰내용
    regdate         DATE DEFAULT SYSDATE,       -- 작성일
    FOREIGN KEY(product_code) REFERENCES product(product_code)  -- 외래키
);
-- 자동 순번(nocache - 초기화 하면 1부터 시작, 안하면 다음 순번부터 이어짐)
CREATE SEQUENCE seq_rno NOCACHE;             -- 저장 안함, 초기화 되게
-- regdate 는 DEFAULT 지정 했으므로 저장할 필요가 없음
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100001', 'today10', '무소음인데 소음이 조금 있는 듯...');
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100001', 'cloud100', '무선이라 정말 편하네요!');
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100002', 'sky123', '게임할 맛 납니다.');

COMMIT;
select * from product_review;

-- 테이블 유지하고 데이터 전체 삭제
TRUNCATE TABLE product_review;
-- 시퀀스 삭제
DROP SEQUENCE seq_rno;
drop table product_review;

-- 상품코드가 '100001'이고 회원 아이디가 'cloud100'인 상품의 정보를 출력하시오
SELECT * FROM product_review
WHERE product_code = 100001 AND member_id LIKE 'cloud100';

-- 상품 아이템 - 3개, 리뷰있는 아이템 - 2개
-- 리뷰가 있는 상품을 검색하시오(동등조인)
-- 조건일치 : a 테이블의 기본키 = b 테이블의 외래키
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 표준방식 -- 내부조인(INNER JOIN)
SELECT * FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 리뷰의 유무에 관계없이 상품의 정보를 검색하시오
-- 외부조인 방식(Product 의 상품은 모두 출력되고,
-- 리뷰는 있든 없든 관계없음, 리뷰가 없으면 NULL로 출력됨)
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code(+);

-- 표준 방식(외부조인 - OUTER JOIN)
-- OUTER는 생략 가능하다
SELECT * FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code;

-- RIGHT JOIN
SELECT  b.product_code, 
        b.product_name, 
        b.price, 
        a.member_id, 
        a.content, 
        a.regdate
FROM product_review a RIGHT JOIN product b
ON a.product_code = b.product_code;

