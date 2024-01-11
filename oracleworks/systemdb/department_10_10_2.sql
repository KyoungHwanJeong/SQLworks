/*
1. department ���̺� �μ� ���̵�(PK) deptid, �μ� �̸�(20 Byte)(NOT NULL) deptname, ��ġ(20 Byte)(NOT NOLL)�� �����Ѵ�.
2. �μ� �ڷ�
    (10, '������', '����')
    (20, '������', '��õ')
    (30, '��������', '����')
    �� �߰��Ѵ�.
3. Ư�� Į�� �μ� ���̵�� �μ� �̸��� �˻��ϱ�
4. ��� Į���� �˻��ϱ�
5. �μ� �̸��� '������'�� ��� �����͸� �˻��ϱ�
6. �μ� ��ȣ�� 20���� ���� '�濵��'���� �����ϰ� ��ü ��ȸ�ϱ�
7. �μ� ��ȣ�� 30���� ���� ���� �ϰ� ��ü ��ȸ�ϱ�(COMMIT�� ���ϸ� ROLLBACK���� ���� ��� ��)
*/
CREATE TABLE department_2(
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL
);

INSERT INTO department_2 VALUES (10, '������', '����');
INSERT INTO department_2 VALUES (20, '������', '��õ');
INSERT INTO department_2 VALUES (30, '��������', '����');

SELECT deptid, deptname FROM department_2;
SELECT * FROM department_2;

SELECT *
FROM department_2
WHERE deptname = '������';

UPDATE department_2 SET deptname = '�濵��'
WHERE deptid = 20;
SELECT * FROM department_2;

COMMIT;

DELETE FROM department_2
WHERE deptid = 30;
SELECT * FROM department_2;

ROLLBACK;
SELECT * FROM department_2;

DROP TABLE department_2;
