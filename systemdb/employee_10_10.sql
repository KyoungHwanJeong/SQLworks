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
-- ��� ���̺� ����
CREATE TABLE employee(
    empid    NUMBER(3),
    empname  VARCHAR2(20) NOT NULL,
    age      NUMBER(3),
    deptid   NUMBER,
    PRIMARY KEY(empid),  -- �⺻Ű
    FOREIGN KEY(deptid) REFERENCES department(deptid)      -- �ܷ�Ű
);

-- ��� �ڷ� �߰�
INSERT INTO employee(empid, empname, age, deptid)
VALUES (101, '�̰�', 27, 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (102, '���', 34, 30); -- �μ� �ڵ尡 ��� �ܷ�Ű �������� ����
INSERT INTO employee(empid, empname, deptid)
VALUES (103, '����', 20); 
INSERT INTO employee(empid, empname, age, deptid)
VALUES (104, '���Ѱ�', 41, 20);

-- ����� ��� ���� ���
SELECT * FROM employee;


-- ��� �̸��� ���̸� ���
SELECT empname, age FROM employee;

-- ��� �̸��� '���'�� ������ ���
SELECT * FROM employee
WHERE empname = '���';

-- ���̰� 30�̻��� ����� �˻�
SELECT * FROM employee
WHERE age >= 30;

-- �μ� ��ȣ�� 20�� ��� �˻�
SELECT * FROM employee
WHERE deptid = 20;

-- ���̰� �Էµ��� ���� (null) ��� �˻�
SELECT * FROM employee
WHERE age IS NULL;

COMMIT;

DROP TABLE employee;