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
-- 계절학기 수강료, 등록 테이블
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 학생의 모든 수강정보를 검색하시오
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 학생의 모든 수강정보를 검색하시오
-- JOIN ~ ON
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;

-- 학생의 모든 수강정보를 검색하시오
-- JOIN ~ USING(칼럼명) : 조인 칼럼 이름이 같은 경우
                        -- 별칭을 사용할 수 없음
SELECT  b.sid,
        subject,
        a.price 
FROM summer_price a JOIN summer_register b
    USING (subject);

-- 과목별 수강료 합계를 구하시오
SELECT  b.subject,
        sum(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- 과목별 수강료 합계를 구하시오(내부조인을 이용해서)
SELECT  b.subject, 
        SUM(a.price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- java 과목의 수강료 합계를 구하시오
SELECT  b.subject, 
        SUM(a.price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- 과목과 과목별 수강료 합계 및 전체 총계를 구하시오
-- ROLLUP(), CUBE()
-- NVL(과목, '총계') 과목이 NULL이 아니면 과목을 출력하고, NULL이면 '총계'를 출력
SELECT  NVL(b.subject, '총계') 수강과목, 
        SUM(a.price) 수강료합계
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- 내부조인을 이용하여
SELECT  NVL(b.subject, '총계') 수강과목, 
        SUM(a.price) 수강료합계
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject                -- 이름이 같을 때는 USING을 써도 됨
GROUP BY ROLLUP(b.subject);

insert into summer_register 
values(301, 'Python');

insert into summer_price 
values('Python', 40000);


