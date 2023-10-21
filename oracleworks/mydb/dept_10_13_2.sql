/*
-- 1. dept 테이블 생성하기
    부서 아이디(PK), 부서 이름(20 byte)(NOT NULL), 위치(20 byte)(NOT NULL)
-- 2. 부서 자료 데이터
    (10, '전산팀', '서울')
    (20, '관리팀', '인천')
    (30, '마케팅팀', '수원')
-- 3. 부서 이름에서 '팀'을 제외한 이름을 출력하기(SUBSTR 이용)
*/
CREATE TABLE dept_2(
    deptid   NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL
);

INSERT INTO dept_2 VALUES(10, '전산팀', '서울');
INSERT INTO dept_2 VALUES(20, '관리팀', '인천');
INSERT INTO dept_2 VALUES(30, '마케팅팀', '수원');

COMMIT;
SELECT * FROM dept_2;

-- 3. 부서 이름에서 '팀'을 제외한 이름을 출력하기(SUBSTR 이용)
SELECT deptname 부서이름,
        LENGTH(deptname) 글자수,
        SUBSTR(deptname, 1, LENGTH(deptname)-1) 팀명1
FROM dept_2;

