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
-- 내부조인(JOIN)
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;

-- JOIN ~ USING(칼럼명) : 조인 칼럼 이름이 같은 경우
                        -- 별칭을 사용할 수 없음
SELECT  b.sid,
        subject,
        a.price 
FROM summer_price a JOIN summer_register b
    USING (subject);

-- 과목별 수강료 합계를 구하시오
insert into summer_register values(301, 'Python');

select  b.sid,
        b.subject,
        sum(a. price)
from summer_price a, summer_register b
where a.subject = b.subject;

-- 과목별 수강료 합계
SELECT  b.subject, 
        SUM(price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- java 과목의 수강료 합계를 구하시오
SELECT  b.subject, 
        SUM(price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- 과목별 수강료 합계 및 전체 총계를 구하시오
-- ROLLUP(), CUBE()
-- NVL(과목, '총계') 과목이 NULL이 아니면 과목을 출력하고, NULL이면 '총계'를 출력
SELECT  NVL(b.subject, '총계') 수강과목, 
        SUM(price) 수강료합계
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject                -- 이름이 같을 때는 USING을 써도 됨
GROUP BY ROLLUP(b.subject);




