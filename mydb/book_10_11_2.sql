/*
bookmall 구축하기
1. book 테이블 생성하기
    책 아이디(PK), 책 이름(60 byte)(NOT NULL), 출판사(60 byte)(NOT NULL), 가격(NOT NULL)
2. 도서 자료 데이터
    (1, '축구의 역사', '굿스포츠', 7000)
    (2. '축구아는 여자', '나무수', 13000)
    (3. '축구의 이해', '대한미디어', 22000)
    (4. '골프 바이블', '대한미디어', 35000)
    (5. '피겨 교본', '굿스포츠', 8000)
    (6. '양궁의 실제', '굿스포츠', 7000)
    (7. '야구의 추억', '이상미디어', 20000)
    (8. '야구를 부탁해', '이상미디어', 13000)
    (9. '올림픽 이야기', '삼성낭', 7500)
    (10. 'Olympic Champions', 'Person', 13000)
    을 추가한다.
3. 커밋 후 모든 도서를 출력하기.
4. 모든 도서의 도서 번호와 이름과 가격을 검색하기.
5. 도서 테이블에 있는 모든 출판사를 검색하기(중복 제거)
6. 가격이 20000원 미만인 도서를 검색하시오(오름차순)
7. 가격이 10000원 이상이고, 20000원 이하인 도서를 검색하시오(BETWEEN)
8. '축구의 역사'를 출간한 출판사를 검색하시오
9. 도서 이름에 '축구'가 포함된 책의 출판사를 검색하시오
10. '축구'에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
11. 도서를 이름순으로 정렬하시오(오름차순)
12. 도서를 가격순으로 정렬하시오(오름차순), 가격이 같으면 이름을 내림차순으로 정렬하시오
13. 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 검색하시오(IN 함수)
14. 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 제외하고 검색하시오(NOT IN 함수)
15. 가격이 13000원인 도서를 검색하시오
16. 가격이 13000원이 아닌 도서를 검색하시오
17. 도서 이름에 '축구'가 포함되지 않은 도서 이름과 출판사를 검색하시오
*/

-- 1. book 테이블 생성하기
CREATE TABLE book_2(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(60) NOT NULL,
    publisher   VARCHAR2(60) NOT NULL,
    price       NUMBER NOT NULL
);
-- 2. 도서 자료 데이터
INSERT INTO book_2 VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book_2 VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO book_2 VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book_2 VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book_2 VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book_2 VALUES(6, '양궁의 실제', '굿스포츠', 7000);
INSERT INTO book_2 VALUES(7, '야구의 추억', '이상미디어', 13000);
INSERT INTO book_2 VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book_2 VALUES(9, '올림픽 이야기', '삼성낭', 7500);
INSERT INTO book_2 VALUES(10, 'Olympic Champions', 'Person', 13000);

-- 3. 커밋 후 모든 도서를 출력하기.
COMMIT;
SELECT * FROM book_2;

-- 4. 모든 도서의 도서 번호와 이름과 가격을 검색하기.
SELECT bookid, bookname, price FROM book_2;

-- 5. 도서 테이블에 있는 모든 출판사를 검색하기(중복 제거)
SELECT DISTINCT publisher FROM book_2;

-- 6. 가격이 20000원 미만인 도서를 검색하시오(오름차순)
SELECT * FROM book_2
WHERE price < 20000;

-- 7. 가격이 10000원 이상이고, 20000원 이하인 도서를 검색하시오(BETWEEN)
SELECT * FROM book_2
WHERE price BETWEEN 10000 AND 20000;

-- 8. '축구의 역사'를 출간한 출판사를 검색하시오
SELECT publisher FROM book_2
WHERE bookname = '축구의 역사';

SELECT publisher FROM book_2
WHERE bookname LIKE '축구의 역사';

-- 9. 도서 이름에 '축구'가 포함된 책의 출판사를 검색하시오
SELECT publisher FROM book_2
WHERE bookname LIKE '%축구%';

-- 10. '축구'에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
SELECT * FROM book_2
WHERE bookname LIKE '%축구%' AND price >= 20000;

-- 11. 도서를 이름순으로 정렬하시오(오름차순)
SELECT * FROM book_2
ORDER BY bookname ASC;

-- 12. 도서를 가격순으로 정렬하시오(오름차순), 가격이 같으면 이름을 내림차순으로 정렬하시오
SELECT * FROM book_2
ORDER BY price ASC, bookname DESC;

-- 13. 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 검색하시오(IN 함수)
SELECT * FROM book_2
WHERE publisher IN('굿스포츠', '대한미디어');

SELECT * FROM book_2
WHERE publisher LIKE '굿스포츠' OR publisher LIKE '대한미디어';

-- 14. 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 제외하고 검색하시오(NOT IN 함수)
SELECT * FROM book_2
WHERE publisher NOT IN('굿스포츠', '대한미디어');

-- 15. 가격이 13000원인 도서를 검색하시오
SELECT * FROM book_2
WHERE price = 13000;

SELECT * FROM book_2
WHERE price LIKE 13000;

-- 16. 가격이 13000원이 아닌 도서를 검색하시오
SELECT * FROM book_2
WHERE price != 13000;

SELECT * FROM book_2
WHERE price NOT LIKE 13000;

-- 17. 도서 이름에 '축구'가 포함되지 않은 도서 이름과 출판사를 검색하시오
SELECT bookname, publisher FROM book_2
WHERE bookname NOT LIKE '%축구%';

DROP TABLE book_2;
