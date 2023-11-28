-- 조건 처리 함수
CREATE TABLE Mytest(
    class   VARCHAR2(1), -- 반
    name    VARCHAR2(6)  -- 이름
);

INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('B', '유비');
INSERT INTO Mytest VALUES ('B', '관우');
INSERT INTO Mytest VALUES ('C', '여포');
INSERT INTO Mytest VALUES ('C', '여포');

CREATE TABLE Mytest2(
    COL1 NUMBER(1)
);

INSERT INTO Mytest2 VALUES (NULL);
INSERT INTO Mytest2 VALUES (0);
INSERT INTO Mytest2 VALUES (NULL);
INSERT INTO Mytest2 VALUES (0);
INSERT INTO Mytest2 VALUES (NULL);


-- 전체 인원 수 계산
SELECT COUNT(name) 전체인원수
FROM Mytest
GROUP BY class;

-- 반별 인원 수 계산
SELECT class, COUNT(name) 인원수
FROM Mytest
GROUP BY class;

-- 반별 인원 수 계산
SELECT class, COUNT(DISTINCT name) 인원수
FROM Mytest
GROUP BY class;

-- DECODE(칼럼명, 조건, 참, 거짓)를 이용한 인원수 계산
SELECT 
        COUNT(DECODE(class, 'A', 1)) A,
        COUNT(DECODE(class, 'B', 1)) B,
        COUNT(DECODE(class, 'C', 1)) C
FROM Mytest;

-- CASE ~ WHEN을 이용한 인원 수 계산
SELECT 
    COUNT(CASE WHEN class='A' THEN 1
    END) A,
    COUNT(CASE WHEN class='B' THEN 1
    END) B,
    COUNT(CASE WHEN class='C' THEN 1
    END) C
FROM Mytest;

-- Mytest2 조건 처리
-- COL1의 데이터가 NULL이면 -1으로 표기함
-- DECODE는 크거나 같다(범위)는 안된다 CASE ~ WHEN은 가능함
SELECT (DECODE(T.COL1, NULL, -1, T.COL1)) DATA1
FROM Mytest2 T;


-- CASE ~ THEN
-- 별칭 Mytest2 -> T
SELECT 
    DECODE(T.COL1, NULL, -1, T.COL1) DATA1,
    CASE
        WHEN T.COL1 IS NULL THEN -1
        ELSE T.COL1
    END DATA2
FROM Mytest2 T;


COMMIT;
SELECT * FROM Mytest;
SELECT * FROM Mytest2;