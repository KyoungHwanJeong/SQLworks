/*
-- 1. dept ���̺� �����ϱ�
    �μ� ���̵�(PK), �μ� �̸�(20 byte)(NOT NULL), ��ġ(20 byte)(NOT NULL)
-- 2. �μ� �ڷ� ������
    (10, '������', '����')
    (20, '������', '��õ')
    (30, '��������', '����')
-- 3. �μ� �̸����� '��'�� ������ �̸��� ����ϱ�(SUBSTR �̿�)
*/
CREATE TABLE dept_2(
    deptid   NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL
);

INSERT INTO dept_2 VALUES(10, '������', '����');
INSERT INTO dept_2 VALUES(20, '������', '��õ');
INSERT INTO dept_2 VALUES(30, '��������', '����');

COMMIT;
SELECT * FROM dept_2;

-- 3. �μ� �̸����� '��'�� ������ �̸��� ����ϱ�(SUBSTR �̿�)
SELECT deptname �μ��̸�,
        LENGTH(deptname) ���ڼ�,
        SUBSTR(deptname, 1, LENGTH(deptname)-1) ����1
FROM dept_2;

