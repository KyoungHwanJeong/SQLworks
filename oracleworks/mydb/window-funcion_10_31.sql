-- 행순서 관련함수
-- lead(): 하위 행의 값을 상위 행에 출력함
-- lag(): 상위 행의 값을 하위 행에 출력함
CREATE TABLE EMP_INFO(
    EMP_NO  VARCHAR2(3),    -- 사원번호
    NAME    VARCHAR2(20),   -- 사원이름
    SAL     NUMBER          -- 급여(달러기준)
);

INSERT INTO EMP_INFO VALUES('100', '김하나', 24000);
INSERT INTO EMP_INFO VALUES('101', '이하나', 7000);
INSERT INTO EMP_INFO VALUES('102', '박하나', 8000);
INSERT INTO EMP_INFO VALUES('108', '정하나', 12000);
INSERT INTO EMP_INFO VALUES('109', '최하나', 6000);

INSERT INTO EMP_INFO VALUES('110', '오하나', 15000);
INSERT INTO EMP_INFO VALUES('111', '임하나', 21000);
INSERT INTO EMP_INFO VALUES('112', '고하나', 16000);
INSERT INTO EMP_INFO VALUES('113', '김하나', 9000);
INSERT INTO EMP_INFO VALUES('119', '윤하나', 13000);


COMMIT;
SELECT * FROM EMP_INFO;
TRUNCATE TABLE EMP_INFO;

-- SAL2 - 3행 위로 출력함
-- SAL3 - NULL인 경우 0으로 표기함
SELECT  EMP_NO,
        NAME,
        SAL,
        LEAD(SAL, 3) OVER(ORDER BY SAL DESC) SAL2,   /* 3행 올리기 */
        LEAD(SAL, 3, 0) OVER(ORDER BY SAL DESC) SAL3 /* NULL인 경우 0으로 처리 */
FROM EMP_INFO;

-- SAL2 - 3행 아래로 출력함
-- SAL3 - NULL인 경우 0으로 표기함
SELECT  EMP_NO,
        NAME,
        SAL,
        LAG(SAL, 3) OVER(ORDER BY SAL DESC) SAL2,   /* 3행 올리기 */
        LAG(SAL, 3, 0) OVER(ORDER BY SAL DESC) SAL3 /* NULL인 경우 0으로 처리 */
FROM EMP_INFO;