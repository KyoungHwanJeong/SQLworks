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

