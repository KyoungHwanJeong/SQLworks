/*
-- emp ���̺��� �����Ѵ�
    �����ȣ(PK)(3 byte), ����̸�(20 byte)(NOT NULL), ����(6 byte)(NOT NULL), �޿�(10 byte), �Ի���(20 byte)(NOT NULL)
-- ��� ������
    (100, '�̰�', '����', 3000000, '2019-01-01')
    (101, '���', '����', 2500000, '2020-05-15')
    (102, '�����', '����', 5000000, '2015-02-22')
    (103, '�ڽ���', '����', null, '2023-10-01')
    �� �����Ѵ�.
-- �ǽ� ����
--1. ����� �Ի��� ������ �����Ͻÿ�(�������� ����)
--2. ����� �޿� ������ �����Ͻÿ�(�������� ����)
--3. �޿��� 300���� ������ ����� �޿��� ���� ������ �����Ͻÿ�
--4. �޿��� ���� ����� �˻��Ͻÿ�
--5. ����� �� ���� ���Ͻÿ�
--6. ����� �޿� �հ�� ����� ���Ͻÿ�
--7. �̸��� ����� ����� ������ ���ڷ� �����Ͻÿ�
--8. �̸��� ������� ����� �����Ͻÿ�
--9. ����̸��� �޿�, �ϱ��� ����Ͻÿ�(���1: �����ڸ����� �ݿø�, ���2: �Ҽ� ù°�ڸ����� �ݿø�,
    ���3: �Ҽ� ��° �ڸ����� �ݿø�)
--10. �޿��� ���� ���� ����� �޿��� ���� ���� ����� �̸��� �޿��� �˻��Ͻÿ�(��������)
*/
CREATE TABLE emp_2(
    empno NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    gender VARCHAR2(6) NOT NULL,
    salary NUMBER(10),
    hire_date VARCHAR2(20) NOT NULL
);
INSERT INTO emp_2 VALUES(100, '�̰�', '����', 3000000, '2019-01-01');
INSERT INTO emp_2 VALUES(101, '���', '����', 2500000, '2020-05-15');
INSERT INTO emp_2 VALUES(102, '�����', '����', 5000000, '2015-02-22');
INSERT INTO emp_2 VALUES(103, '�ڽ���', '����', null, '2023-10-01');

COMMIT;
SELECT * FROM emp_2;

-- �ǽ� ����
--1. ����� �Ի��� ������ �����Ͻÿ�(�������� ����)
SELECT * FROM emp_2
ORDER BY hire_date ASC;

--2. ����� �޿� ������ �����Ͻÿ�(�������� ����)
SELECT * FROM emp_2
ORDER BY salary ASC;

--3. �޿��� 300���� ������ ����� �޿��� ���� ������ �����Ͻÿ�
SELECT * FROM emp_2
WHERE salary <= 3000000
ORDER BY salary DESC;

--4. �޿��� ���� ����� �˻��Ͻÿ�
SELECT * FROM emp_2
WHERE salary IS NULL;

--5. ����� �� ���� ���Ͻÿ�
SELECT COUNT(empno) AS ������Ѽ�
FROM emp_2;

--6. ����� �޿� �հ�� ����� ���Ͻÿ�
SELECT  SUM(salary) AS �޿��հ�, 
        AVG(salary) AS �޿����
FROM emp_2;

--7. �̸��� ����� ����� ������ ���ڷ� �����Ͻÿ�
UPDATE emp_2 SET gender = '����'
WHERE empname = '���';
SELECT * FROM emp_2;

SELECT REPLACE(gender, '����', '����')
FROM emp_2
WHERE empname = '���';
SELECT * FROM emp_2;

COMMIT;

--8. �̸��� ������� ����� �����Ͻÿ�
DELETE FROM emp_2
WHERE empname = '�����';
SELECT * FROM emp_2;

ROLLBACK;
SELECT * FROM emp_2;

--9. ����̸��� �޿�, �ϱ��� ����Ͻÿ�(���1: �����ڸ����� �ݿø�, ���2: �Ҽ� ù°�ڸ����� �ݿø�,
--  ���3: �Ҽ� ��° �ڸ����� �ݿø�)
SELECT  empname ����̸�,
        salary  �޿�,
        salary/30 �ϱ�,
        ROUND(salary/30, -1) ���1,
        ROUND(salary/30, 0) ���2,
        ROUND(salary/30, 1) ���3
FROM emp_2;

--10. �޿��� ���� ���� ����� �޿��� ���� ���� ����� �̸��� �޿��� �˻��Ͻÿ�(��������)
SELECT empname, salary
FROM emp_2
WHERE salary = (SELECT MAX(salary) FROM emp_2) 
    OR salary = (SELECT MIN(salary) FROM emp_2);
    