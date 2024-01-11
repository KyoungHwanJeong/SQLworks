/*
1. employee 테이블에 사원 아이디(PK)(3 Byte), 사원 이름(20 Byte)(NOT NULL), 나이(3 Byte), 부서 아이디(FK)를 선언한다.
2. 사원 자료
    (101, '이강', 27, 10)
    (102, '김산', 34, 30)
    (103, '정들', 20)
    (104, '남한강', 41, 20)을 추가한다.
3. 사원의 모든 정보를 출력하기.
4. 사원의 이름과 나이를 출력하기.
5. 사원 이름이 '김산'인 사원의 데이터를 출력
6. 나이가 30 이상인 사원을 출력하기.
7. 부서 번호가 20인 사원을 출력하기.
8. 나이가 입력되지 않은 사원을 출력하기.
*/
CREATE TABLE employee_2(
    empid   NUMBER(3),
    empname VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    deptid  NUMBER,
    PRIMARY KEY(empid),
    FOREIGN KEY(deptid) REFERENCES department_2(deptid)
);

INSERT INTO employee_2(empid, empname, age, deptid) VALUES (101, '이강', 27, 10);
INSERT INTO employee_2(empid, empname, age, deptid) VALUES (102, '김산', 34, 30);
INSERT INTO employee_2(empid, empname, deptid) VALUES (103, '정들', 20);
INSERT INTO employee_2(empid, empname, age, deptid) VALUES (104, '남한강', 41, 20);

COMMIT;
SELECT * FROM employee_2;

SELECT empname, age FROM employee_2;

SELECT * FROM employee_2
WHERE empname = '김산';

SELECT * FROM employee_2
WHERE age >= 30;

SELECT * FROM employee_2
WHERE deptid = 20;

SELECT * FROM employee_2
WHERE age IS NULL;

COMMIT;