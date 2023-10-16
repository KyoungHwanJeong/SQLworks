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
CREATE TABLE major_2(
    majorname   VARCHAR2(20) PRIMARY KEY,
    majornumber VARCHAR2(20) NOT NULL,
    location    VARCHAR2(20) NOT NULL
);

INSERT INTO major_2(majorname, majornumber, location)
VALUES('소프트웨어학과', '02-1234-5678', 'B동 3층');
INSERT INTO major_2(majorname, majornumber, location)
VALUES('화학공학과', '02-2222-7777', 'B동 4층');
INSERT INTO major_2(majorname, majornumber, location)
VALUES('전기전자공학과', '02-4444-7777', 'B동 5층');

ALTER TABLE major_2 MODIFY majorname VARCHAR2(30);

SELECT * FROM major_2;

COMMIT;
SELECT majorname AS 학과명, majornumber AS 전화번호 FROM major_2;
