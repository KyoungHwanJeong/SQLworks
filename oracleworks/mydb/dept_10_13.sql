/*
1. dept 테이블 생성하기
    부서 아이디(PK), 부서 이름(20 byte)(NOT NULL), 위치(20 byte)(NOT NULL)
2. 부서 자료 데이터
    (10, '전산팀', '서울')
    (20, '관리팀', '인천')
    (30, '마케팅팀', '수원')
-- 3. 부서 이름에서 '팀'을 제외한 이름을 출력하기(SUBSTR 이용)
*/
-- dept 테이블 생성
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,   -- 기본키
    deptname VARCHAR2(20) NOT NULL, -- NULL 불허, 제약 조건
    location VARCHAR2(20) NOT NULL
);

/* 부서 자료 추가 */
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '관리팀', '인천');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '마케팅팀', '수원');

SELECT * FROM dept;
COMMIT;

-- 부서이름에서 팀을 제외한 이름을 출력하시오
SELECT SUBSTR(deptname, 1, LENGTH(deptname)-1) 팀 FROM dept;

SELECT deptname 부서이름,
        LENGTH(deptname) 글자수,
        SUBSTR(deptname, 1, LENGTH(deptname)-1) 팀명1
        --REPLACE(deptname, '팀', '') 팀명2
        FROM dept;

SELECT SUBSTR(deptname, -3, LENGTH(deptname)-1) 팀 FROM dept; -- 뒤에서부터 출력 ... 해결중...




