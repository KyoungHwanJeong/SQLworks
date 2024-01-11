-- ���ǿ� ���� �Լ� : 
-- DECODE(Į����, ����, ���ΰ�, �����ΰ�)
-- ������ �����̸� 'M', �����̸� 'F'�� ���
SELECT  ename ����̸�,
        gender ����,
        DECODE(gender, '����', 'M', 'F') gender
FROM emp;

-- ���� ����(IF~THEN�� ����)
/*
    CASE
        WHEN ����1 THEN ���1 
        WHEN ����2 THEN ���2
        ELSE ���3
    END Į����
*/
SELECT  ename �����ȣ,
        gender ����,
        CASE
            WHEN gender = '����' THEN 'M'
            ELSE 'F'
        END gender
FROM emp;

-- �޿��� ���� ���� ǥ��
-- �޿��� 350���� �̻��̸� ������ '����'���� ǥ���ϰ�
-- �޿��� 250���� �̻��̸� ������ '�븮'�� ǥ���ϰ�
-- �������� '���'���� ǥ��
SELECT  ename,
        salary,
        CASE
            WHEN salary >= 3500000 THEN '����'
            WHEN salary >= 2500000 THEN '�븮' -- AND salary <= 3500000
            ELSE '���'
        END ����
FROM emp;

-- salary �� ����
SELECT COUNT(salary)
FROM emp;

-- null ���� 0�� ǥ��
-- NVL(�μ�1, �μ�2)
-- �μ�1�� NULL�� �ƴϸ� �μ�1 �� ���
-- �μ�1�� NULL�̸� �μ�2 �� ���

SELECT ename,
    NVL(salary, 0)
FROM emp;

-- ������ 3���� (���̴� �͸� 4��)
SELECT COUNT(salary)
FROM emp;

-- NVL() 0���� ó���� ������ ���� ī��Ʈ��
SELECT COUNT(NVL(salary,0))
FROM emp;

-- �ǽ� ���̺� ����
CREATE TABLE K1(
    ID  VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 10);

COMMIT;

SELECT NVL(CNT, 0) FROM K1;  --�׳���
SELECT COUNT(CNT) FROM K1;   --���� 3
SELECT COUNT(NVL(CNT, 0)) FROM K1;  --���� 5

SELECT ROUND(SUM(CNT) /COUNT(CNT),1) FROM K1; --6.7
SELECT SUM(CNT) /COUNT(NVL(CNT, 0)) FROM K1; --4

-- �ּҰ� ���ϱ�
SELECT MIN(NVL(CNT, 5)) FROM K1; --5

-- �ִ밪 ���ϱ�
SELECT MAX(NVL(CNT, 5)) FROM K1; --5


DROP TABLE K1;
