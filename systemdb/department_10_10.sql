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
-- 부서와 사원 테이블 생성
CREATE TABLE department(
    deptid    NUMBER PRIMARY KEY,   -- 기본키
    deptname VARCHAR2(20) NOT NULL, -- NULL 불허, 제약 조건
    location VARCHAR2(20) NOT NULL
);

/* 부서 자료 추가 */
INSERT INTO department(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO department(deptid, deptname, location)
VALUES (20, '관리팀', '인천');
INSERT INTO department(deptid, deptname, location)
VALUES (30, '마케팅팀', '수원');


-- 특정 칼럼 검색(자료 검색)

SELECT deptid, deptname FROM department;

-- 모든 칼럼 검색('*'을 사용한다)
SELECT * FROM department;

-- 특정한 데이터(행: row) 검색  --ㄴ-> WHERE 조건절을 사용
-- 부서 이름이 전산 팀인 row(레코드) 검색
SELECT * FROM department
WHERE deptname = '전산팀';

-- 자료 수정(Update), (부서 번호가 20번인 로우의 부서 이름을 관리팀 --> 경영팀)
UPDATE department SET deptname = '경영팀'
WHERE deptid = 20;

-- 자료 삭제(부서 번호가 30번인 마케팅팀 삭제)
DELETE FROM department
WHERE deptid = 30;


ROLLBACK;   -- COMMIT 이전에 실행하면 취소됨(마지막 실행 상태로 돌아감)

COMMIT;

