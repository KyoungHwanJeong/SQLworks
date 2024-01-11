/*
1. employee ���̺� ��� ���̵�(PK)(3 Byte), ��� �̸�(20 Byte)(NOT NULL), ����(3 Byte), �μ� ���̵�(FK)�� �����Ѵ�.
2. ��� �ڷ�
    (101, '�̰�', 27, 10)
    (102, '���', 34, 30)
    (103, '����', 20)
    (104, '���Ѱ�', 41, 20)�� �߰��Ѵ�.
3. ����� ��� ������ ����ϱ�.
4. ����� �̸��� ���̸� ����ϱ�.
5. ��� �̸��� '���'�� ����� �����͸� ���
6. ���̰� 30 �̻��� ����� ����ϱ�.
7. �μ� ��ȣ�� 20�� ����� ����ϱ�.
8. ���̰� �Էµ��� ���� ����� ����ϱ�.
*/
CREATE TABLE employee_2(
    empid   NUMBER(3),
    empname VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    deptid  NUMBER,
    PRIMARY KEY(empid),
    FOREIGN KEY(deptid) REFERENCES department_2(deptid)
);

INSERT INTO employee_2(empid, empname, age, deptid) VALUES (101, '�̰�', 27, 10);
INSERT INTO employee_2(empid, empname, age, deptid) VALUES (102, '���', 34, 30);
INSERT INTO employee_2(empid, empname, deptid) VALUES (103, '����', 20);
INSERT INTO employee_2(empid, empname, age, deptid) VALUES (104, '���Ѱ�', 41, 20);

COMMIT;
SELECT * FROM employee_2;

SELECT empname, age FROM employee_2;

SELECT * FROM employee_2
WHERE empname = '���';

SELECT * FROM employee_2
WHERE age >= 30;

SELECT * FROM employee_2
WHERE deptid = 20;

SELECT * FROM employee_2
WHERE age IS NULL;

COMMIT;