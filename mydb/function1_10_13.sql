/*
내장함수 
-- 1. -10의 절대값을 구하기
-- 2. 127.67을 반올림하기(소수 둘째 자리에서 반올림, 소수 첫째 자리에서 반올림,
                        일의 자리에서 반올림, 십의 자리에서 반올림)
-- 3. 127.67을 버림하기(소수 둘째 자리이후 버림, 소수 첫째자리 이후 버림,
                        일의 자리이후 버림, 십의 자리이후 버림)
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
-- 숫자 타입 내장 함수
-- 절대값 구하기 : ABS()
-- 제공 테이블 : dual
SELECT ABS(-10) FROM dual;

-- 반올림 : ROUND(숫자, 자리수)
SELECT ROUND(127.67, 1) FROM dual;  -- 127.7 소수 둘째 자리에서 반올림
SELECT ROUND(127.67, 0) FROM dual;  -- 128 소수 첫째 자리에서 반올림
SELECT ROUND(127.67, -1) FROM dual; -- 120 일의 자리에서 반올림
SELECT ROUND(127.67, -2) FROM dual; -- 100 십의 자리에서 반올림

-- 버림(내림) : TRUNC(숫자, 자리수)
SELECT TRUNC(127.67, 1) FROM dual;  -- 127.6 소수 첫째자리까지 표시(이후 버림)
SELECT TRUNC(127.67, 0) FROM dual;  -- 127
SELECT TRUNC(127.67, -1) FROM dual; -- 120
SELECT TRUNC(127.67, -2) FROM dual; -- 100

-- 버림(내림) : FLOOR(숫자) - 정수로 내림한다.
SELECT FLOOR(127.67) FROM dual; -- 소수 이하 버림(정수)
SELECT FLOOR(127.6) FROM dual;

-- 거듭제곱 : POWER(밑, 지수)
SELECT POWER(2, 3) FROM dual;

-- 문자 타입
-- 소문자로 변경하기 : LOWER('ABCD')
-- 대문자로 변경하기 : UPPER('abcd')
SELECT LOWER('ABCD') FROM dual;
SELECT UPPER('abcd') FROM dual;

-- 문자열의 일부분을 추출 : SUBSTR(문자열, 인덱스, 자리수)
-- 인덱스는 1번에서 시작
SELECT SUBSTR('abc', 1, 2) FROM dual;   -- 1번부터 2개의 문자를 추출

-- 문자열을 찾아 바꾸기 : REPLACE(문자열, 변경 전 문자, 변경 후 문자)
SELECT REPLACE('abcd', 'c', 'e') FROM dual; -- 'c'를 'e'로 바꾸기

-- 문자열의 길이 : LENGTH(문자열)
SELECT LENGTH('abcd') FROM dual;

-- 마스킹 처리 
-- LPAD(문자열, 전체길이, 특정문자) -- 왼쪽부터 특정 문자로 빈칸 채우기
-- RPAD(문자열, 전체길이, 특정문자) -- 오른쪽부터 특정 문자로 빈칸 채우기
SELECT LPAD('Today', 8, '*') FROM dual;
SELECT RPAD('Today', 8, '*') FROM dual;

-- 주문테이블
-- 고객별 평균 주문 금액을 백원단위로 반올림
SELECT  custid AS 고객번호,
        SUM(saleprice) AS 합계금액,
        COUNT(saleprice) AS 주문건수,
        ROUND(AVG(saleprice), -2) AS 평균주문금액
FROM orders
GROUP BY custid;

-- 도서테이블
-- 책제목의 글자수
-- 책제목의 바이트 수 : 한글 - 3byte, 영어, 특수문자 - 1byte
SELECT  bookname,
        LENGTH(bookname) as 글자수,
        LENGTHB(bookname) as 바이트수
FROM book;

--'축구'를 농구로 변경하여 검색하기
SELECT bookname,
    REPLACE(bookname, '축구', '농구') as bookname
FROM BOOK;

-- 고객 테이블
-- 고객 이름별 같은 성을 가진 고객의 인원수를 구하시오.
SELECT SUBSTR(name, 1, 1) 성,
    COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

--


