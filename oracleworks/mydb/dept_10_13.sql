/*
1. dept ���̺� �����ϱ�
    �μ� ���̵�(PK), �μ� �̸�(20 byte)(NOT NULL), ��ġ(20 byte)(NOT NULL)
2. �μ� �ڷ� ������
    (10, '������', '����')
    (20, '������', '��õ')
    (30, '��������', '����')
-- 3. �μ� �̸����� '��'�� ������ �̸��� ����ϱ�(SUBSTR �̿�)
*/
-- dept ���̺� ����
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,   -- �⺻Ű
    deptname VARCHAR2(20) NOT NULL, -- NULL ����, ���� ����
    location VARCHAR2(20) NOT NULL
);

/* �μ� �ڷ� �߰� */
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '������', '��õ');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '��������', '����');

SELECT * FROM dept;
COMMIT;

-- �μ��̸����� ���� ������ �̸��� ����Ͻÿ�
SELECT SUBSTR(deptname, 1, LENGTH(deptname)-1) �� FROM dept;

SELECT deptname �μ��̸�,
        LENGTH(deptname) ���ڼ�,
        SUBSTR(deptname, 1, LENGTH(deptname)-1) ����1
        --REPLACE(deptname, '��', '') ����2
        FROM dept;

SELECT SUBSTR(deptname, -3, LENGTH(deptname)-1) �� FROM dept; -- �ڿ������� ��� ... �ذ���...




