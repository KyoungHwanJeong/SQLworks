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
-- �μ��� ��� ���̺� ����
CREATE TABLE department(
    deptid    NUMBER PRIMARY KEY,   -- �⺻Ű
    deptname VARCHAR2(20) NOT NULL, -- NULL ����, ���� ����
    location VARCHAR2(20) NOT NULL
);

/* �μ� �ڷ� �߰� */
INSERT INTO department(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO department(deptid, deptname, location)
VALUES (20, '������', '��õ');
INSERT INTO department(deptid, deptname, location)
VALUES (30, '��������', '����');


-- Ư�� Į�� �˻�(�ڷ� �˻�)

SELECT deptid, deptname FROM department;

-- ��� Į�� �˻�('*'�� ����Ѵ�)
SELECT * FROM department;

-- Ư���� ������(��: row) �˻�  --��-> WHERE �������� ���
-- �μ� �̸��� ���� ���� row(���ڵ�) �˻�
SELECT * FROM department
WHERE deptname = '������';

-- �ڷ� ����(Update), (�μ� ��ȣ�� 20���� �ο��� �μ� �̸��� ������ --> �濵��)
UPDATE department SET deptname = '�濵��'
WHERE deptid = 20;

-- �ڷ� ����(�μ� ��ȣ�� 30���� �������� ����)
DELETE FROM department
WHERE deptid = 30;


ROLLBACK;   -- COMMIT ������ �����ϸ� ��ҵ�(������ ���� ���·� ���ư�)

COMMIT;

