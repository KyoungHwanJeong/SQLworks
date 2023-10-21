-- 부서, 사원 테이블 생성
CREATE TABLE department2_2(
    deptid      INT PRIMARY KEY,
    deptname    VARCHAR2(30) NOT NULL,
    location    VARCHAR2(20) NOT NULL
);

INSERT INTO department2_2 VALUES (10, '개발팀', '서울');
INSERT INTO department2_2 VALUES (20, '디자인팀', '부천');

CREATE TABLE employee2_2(
    empid       INT PRIMARY KEY,
    empname     VARCHAR2(30) NOT NULL,
    age         INT NOT NULL,
    sal         INT,
    deptid      INT NOT NULL,
    FOREIGN KEY(deptid) REFERENCES department2(deptid)
);

INSERT INTO employee2_2 VALUES (101, '한강', 27, 2100000, 10);
INSERT INTO employee2_2 VALUES (102, '백두산', 32, 3200000, 20);
INSERT INTO employee2_2 VALUES (103, '오과장', 45, 5500000, 10);
INSERT INTO employee2_2 VALUES (104, '김대리', 38, 4300000, 10);
INSERT INTO employee2_2 VALUES (105, '양신입', 25, null, 10);

SELECT * FROM department2_2;
SELECT * FROM employee2_2;

DROP TABLE department2_2;
DROP TABLE employee2_2;
COMMIT;