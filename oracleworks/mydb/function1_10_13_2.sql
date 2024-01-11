/*
내장함수 
-- 1. -10의 절대값을 구하기
-- 2. 127.67을 반올림하기(소수 둘째 자리에서 반올림, 소수 첫째 자리에서 반올림,
--                      일의 자리에서 반올림, 십의 자리에서 반올림)
-- 3. 127.67을 버림하기(소수 둘째 자리이후 버림, 소수 첫째자리 이후 버림,
--                      일의 자리이후 버림, 십의 자리이후 버림)
-- 4. 127.67을 정수로 버림하기
-- 5. 2의 3승 거듭제곱 구하기
-- 6. 'ABCD'를 소문자로 출력하기
-- 7. 'abcd'를 대문자로 출력하기
-- 8. 'abc'의 1번째 부터 2개의 문자열 추출하기(SUBSTR 이용)
-- 9. 'abcd'에서 'c'를 'e'로 바꾸기
--10. 'abcd' 문자열의 길이를 구하기
--11. 전체 길이가 8 byte 인 today 문자열의 왼쪽을 *로 마스킹하기
--12. 전체 길이가 8 byte 인 today 문자열의 오른쪽을 *로 마스킹하기
-- 도서 테이블 이용
--13. 고객번호, 합계금액, 주문 건수를 출력하고, 고객별 평균 주문 금액을 백원단위로 반올림하여 출력하기
--14. 책 제목의 글자수와 바이트 출력하기
--15. 책 제목에 '축구'가 있는 책의 제목을 '농구'로 변경하기
--16. 고객 이름별 같은 성을 가진 고객의 인원수를 구하기
*/
-- 1. -10의 절대값을 구하기
SELECT ABS(-10) FROM dual;

-- 2. 127.67을 반올림하기(소수 둘째 자리에서 반올림, 소수 첫째 자리에서 반올림,
--                      일의 자리에서 반올림, 십의 자리에서 반올림)
SELECT ROUND(127.67, 1) FROM dual;
SELECT ROUND(127.67, 0) FROM dual;
SELECT ROUND(127.67, -1) FROM dual;
SELECT ROUND(127.67, -2) FROM dual;

-- 3. 127.67을 버림하기(소수 둘째 자리이후 버림, 소수 첫째자리 이후 버림,
--                      일의 자리이후 버림, 십의 자리이후 버림)
SELECT TRUNC(127.67,1) FROM dual;
SELECT TRUNC(127.67,0) FROM dual;
SELECT TRUNC(127.67,-1) FROM dual;
SELECT TRUNC(127.67,-2) FROM dual;

-- 4. 127.67을 정수로 버림하기
SELECT FLOOR(127.67) FROM dual;

-- 5. 2의 3승 거듭제곱 구하기
SELECT POWER(2, 3) FROM dual;

-- 6. 'ABCD'를 소문자로 출력하기
SELECT LOWER('ABCD') FROM dual;

-- 7. 'abcd'를 대문자로 출력하기
SELECT UPPER('abcd') FROM dual;

-- 8. 'abc'의 1번째 부터 2개의 문자열 추출하기(SUBSTR 이용)
SELECT SUBSTR('abc', 1, 2) FROM dual;

-- 9. 'abcd'에서 'c'를 'e'로 바꾸기
SELECT REPLACE('abcd', 'c', 'e') FROM dual;

--10. 'abcd' 문자열의 길이를 구하기
SELECT LENGTH('abcd') FROM dual;

--11. 전체 길이가 8 byte 인 today 문자열의 왼쪽을 *로 마스킹하기
SELECT LPAD('today', 8, '*') FROM dual;

--12. 전체 길이가 8 byte 인 today 문자열의 오른쪽을 *로 마스킹하기
SELECT RPAD('today', 8, '*') FROM dual;

--13. 고객번호, 합계금액, 주문 건수를 출력하고, 고객별 평균 주문 금액을 백원단위로 반올림하여 출력하기
SELECT  custid AS 고객번호,
        SUM(saleprice) AS 합계금액,
        COUNT(saleprice) AS 주문건수,
        ROUND(AVG(saleprice), -2) AS 평균주문금액
FROM orders_2
GROUP BY custid;

--14. 책 제목의 글자수와 바이트 출력하기
SELECT  bookname AS 책제목,
        LENGTH(bookname) AS 글자수,
        LENGTHB(bookname) AS 바이트수
FROM book_2;

--15. 책 제목에 '축구'가 있는 책의 제목을 '농구'로 변경하기
SELECT bookname, REPLACE(bookname, '축구', '농구') AS bookname FROM book_2;

COMMIT;

UPDATE book_2 SET bookname = '농구'
WHERE bookname LIKE '축구';
SELECT * FROM book_2;

--16. 고객 이름별 같은 성을 가진 고객의 인원수를 구하기
SELECT  SUBSTR(name, 1, 1) AS 성,
        COUNT(*) AS 인원
FROM customer_2
GROUP BY SUBSTR(name, 1, 1);