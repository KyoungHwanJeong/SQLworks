-- �μ�, ��� ���̺� ����
CREATE TABLE department2(
    deptid      INT PRIMARY KEY,
    deptname    VARCHAR2(30) NOT NULL,
    location    VARCHAR2(20) NOT NULL
);

INSERT INTO department2 VALUES (10, '������', '����');
INSERT INTO department2 VALUES (20, '��������', '��õ');

CREATE TABLE employee2(
    empid       INT PRIMARY KEY,
    empname     VARCHAR2(30) NOT NULL,
    age         INT NOT NULL,
    sal         INT,
    deptid      INT NOT NULL,
    FOREIGN KEY(deptid) REFERENCES department2(deptid)
);

INSERT INTO employee2 VALUES (101, '�Ѱ�', 27, 2100000, 10);
INSERT INTO employee2 VALUES (102, '��λ�', 32, 3200000, 20);
INSERT INTO employee2 VALUES (103, '������', 45, 5500000, 10);
INSERT INTO employee2 VALUES (104, '��븮', 38, 4300000, 10);
INSERT INTO employee2 VALUES (105, '�����', 25, null, 10);

SELECT * FROM department2;
SELECT * FROM employee2;

DROP TABLE department2;
DROP TABLE employee2;
COMMIT;