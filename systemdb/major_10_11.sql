/*
학교 데이터 베이스
1. major 테이블에 과목이름(PK)(20 byte), 전화번호(20 byte)(NOT NULL), 위치(20 byte)(NOT NULL)을 선언한다.
2. 학과 데이터
    ('소프트웨어학과', '02-1234-5678', 'B동 3층')
    ('화학공학과', '02-2222-7777', 'B동 4층')
    ('전기전자공학과', '02-4444-7777', 'B동 5층')
    을 넣는다.
3. 학과명 자료의 크기를 30 byte로 변경하고 데이터를 다시 넣는다. 
4. 전체 데이터를 조회하기
5. '학과명', '전화번호'로 별칭을 지어주고 전체 데이터를 조회하기
*/
-- 학교 데이터베이스 구축
-- 학과 테이블 생성
CREATE TABLE major(
    mname   VARCHAR2(20) PRIMARY KEY,
    mphone  VARCHAR2(20) NOT NULL,  -- 필수 입력
    location VARCHAR2(30) NOT NULL
);

-- 학과 추가
INSERT INTO major(mname, mphone, location)
VALUES('소프트웨어학과', '02-1234-5678', 'B동 3층');
INSERT INTO major(mname, mphone, location)
VALUES('화학공학과', '02-2222-7777', 'B동 4층');
INSERT INTO major(mname, mphone, location)
VALUES('전기전자공학과', '02-4444-7777', 'B동 5층');

-- 학과명 자료의 크기 변경
ALTER TABLE major MODIFY mname VARCHAR2(30);

-- 전체 데이터 조회
SELECT * FROM major;

-- 별칭(as)을 지어주고 학과명과 전화번호만 출력(별칭을 사용 할 때 as를 사용)
SELECT mname AS 학과명, mphone AS 전화번호 FROM major;

-- 트렌젝션
COMMIT;
