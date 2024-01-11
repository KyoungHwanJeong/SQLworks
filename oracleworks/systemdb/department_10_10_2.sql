/*
1. department 테이블에 부서 아이디(PK) deptid, 부서 이름(20 Byte)(NOT NULL) deptname, 위치(20 Byte)(NOT NOLL)를 선언한다.
2. 부서 자료
    (10, '전산팀', '서울')
    (20, '관리팀', '인천')
    (30, '마케팅팀', '수원')
    을 추가한다.
3. 특정 칼럼 부서 아이디와 부서 이름을 검색하기
4. 모든 칼럼을 검색하기
5. 부서 이름이 '전산팀'인 모든 데이터를 검색하기
6. 부서 번호가 20번인 팀을 '경영팀'으로 수정하고 전체 조회하기
7. 부서 번호가 30번인 팀을 삭제 하고 전체 조회하기(COMMIT을 안하면 ROLLBACK으로 실행 취소 됨)
*/
CREATE TABLE department_2(
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL
);

INSERT INTO department_2 VALUES (10, '전산팀', '서울');
INSERT INTO department_2 VALUES (20, '관리팀', '인천');
INSERT INTO department_2 VALUES (30, '마케팅팀', '수원');

SELECT deptid, deptname FROM department_2;
SELECT * FROM department_2;

SELECT *
FROM department_2
WHERE deptname = '전산팀';

UPDATE department_2 SET deptname = '경영팀'
WHERE deptid = 20;
SELECT * FROM department_2;

COMMIT;

DELETE FROM department_2
WHERE deptid = 30;
SELECT * FROM department_2;

ROLLBACK;
SELECT * FROM department_2;

DROP TABLE department_2;
