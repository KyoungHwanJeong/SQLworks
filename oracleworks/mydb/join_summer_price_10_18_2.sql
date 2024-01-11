/*
여름 계절학기 테이블
-- 1. 학생의 모든 수강정보를 검색하시오
-- 2. 학생의 모든 수강정보를 검색하시오(내부조인을 이용해서)
-- 3. 학생의 모든 수강정보를 검색하시오(내부조인 USING을 이용해서)
-- 4. 과목별 수강료 합계를 구하시오
-- 5. 과목별 수강료 합계를 구하시오(내부조인을 이용해서)
-- 6. java 과목의 수강료 합계를 구하시오
-- 7. 과목과 과목별 수강료 합계 및 전체 총계를 구하시오(NULL은 '총계'로 출력)
-- 8. 과목과 과목별 수강료 합계 및 전체 총계를 구하시오(NULL은 '총계'로 출력)(내부 조인을 이용하여)
*/
-- 1. 학생의 모든 수강정보를 검색하시오
SELECT  b.sid,
        a.subject,
        a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 2. 학생의 모든 수강정보를 검색하시오(내부조인을 이용해서)
SELECT  b.sid,
        a.subject,
        a.price
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject;
    
-- 3. 학생의 모든 수강정보를 검색하시오(내부조인 USING을 이용해서)
SELECT  b.sid,
        subject,
        a.price
FROM summer_price a INNER JOIN summer_register b
    USING (subject);
    
-- 4. 과목별 수강료 합계를 구하시오
SELECT b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- 5. 과목별 수강료 합계를 구하시오(내부조인을 이용해서)
SELECT b.subject, SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- 6. Java 과목의 수강료 합계를 구하시오
SELECT b.subject, SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject AND a.subject = 'Java'
GROUP BY b.subject;

-- 7. 과목과 과목별 수강료 합계 및 전체 총계를 구하시오(NULL은 '총계'로 출력)
SELECT NVL(b.subject, '총계'), SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- 8. 과목과 과목별 수강료 합계 및 전체 총계를 구하시오(NULL은 '총계'로 출력)(내부 조인을 이용하여)
SELECT NVL(b.subject, '총계'), SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject
GROUP BY ROLLUP(b.subject);

insert into summer_register 
values(301, 'Python');

insert into summer_price 
values('Python', 40000);
