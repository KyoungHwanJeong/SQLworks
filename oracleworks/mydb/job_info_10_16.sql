/*
-- JOB_INFO ���̺��� �����Ѵ�.
    ���� ���̵�(10 byte), �����޿�, �ְ�޿�
-- JOB ������
    ('AD_PRES', 20000, 40000)
    ('AD_VP', 15000, 30000)
    ('AD_ASST', 3000, 6000)
    ('FI_MGR', 8000, 16000)
    ('FI_ACCOUNT', 4000, 9000)
    ('AC_MGR', 8000, 16000)
    ('AC_ACCOUNT', 4000, 9000)
    �� �����Ѵ�.
-- 1. �����޿�, �ְ�޿��� ����� ���Ͻÿ�
-- 2. �����޿��� 5000 �޷� �̻��� ���� ���̵� �˻��Ͻÿ�
-- 3. ���� �޿��� 5000 �޷� �̻��� ������ �˻��� �� �����Ͻÿ�
-- 4. �ְ� �޿��� ���� �޿��� ���� 10000 �޷� �̻��� ���� ���̵� ���� �˻��Ͻÿ�
-- 5. ���� ���̵� �̸��� FI�� �����ϴ� �ڷḦ �˻��Ͻÿ�(�信�� �˻�)
-- 6. �ְ� �޿��� ���� ���� ������ ���̵� �˻��Ͻÿ�
*/
-- JOB_INFO ���̺� ����
-- SALARY�� �޷� ������
CREATE TABLE JOB_INFO(
    JOB_ID      VARCHAR(10),        -- ���� ���̵�
    MIN_SALARY  NUMBER,             -- �����޿�
    MAX_SALARY  NUMBER              -- �ְ�޿�
);

INSERT INTO JOB_INFO VALUES('AD_PRES', 20000, 40000);
INSERT INTO JOB_INFO VALUES('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO VALUES('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO VALUES('FI_MGR', 8000, 16000);
INSERT INTO JOB_INFO VALUES('FI_ACCOUNT', 4000, 9000);
INSERT INTO JOB_INFO VALUES('AC_MGR', 8000, 16000);
INSERT INTO JOB_INFO VALUES('AC_ACCOUNT', 4000, 9000);

COMMIT;

SELECT * FROM JOB_INFO;

-- �����޿�, �ְ�޿��� ����� ���Ͻÿ�
SELECT  ROUND(AVG(MIN_SALARY), -1) �����޿����,
        ROUND(AVG(MAX_SALARY), -1) �ְ�޿����
FROM JOB_INFO;

/*
    �������
    1. FROM ��
    2. WHERE ��
    3. SELECT ��
    4. ORDER ��
*/
-- �����޿��� 5000 �޷� �̻��� ���� ���̵� �˻��Ͻÿ�
SELECT JOB_ID, MIN_SALARY AS MIN_SAL
FROM JOB_INFO
WHERE MIN_SALARY >= 5000;
     --MIN_SAL >= 5000;         -- �г��� �����ϴ� SELECT ���� ���߿� ����ǹǷ� �г��� ���̸� ������ ��

-- ���� �޿��� 5000 �޷� �̻��� ������ �˻��� �� �����Ͻÿ�
CREATE VIEW V_JOB_INFO
AS SELECT *
FROM JOB_INFO
WHERE MIN_SALARY >= 5000;

-- �ְ� �޿��� ���� �޿��� ���� 10000 �޷� �̻��� ���� ���̵� ���� �˻��Ͻÿ�
SELECT JOB_ID, COUNT(JOB_ID) �������̵��
FROM JOB_INFO
WHERE MAX_SALARY - MIN_SALARY >= 10000
GROUP BY JOB_ID;

SELECT COUNT(JOB_ID)
FROM JOB_INFO
WHERE SUB(MAX_SALARY, MIN_SALARY) >= 10000;

-- ���� ���̵� �̸��� FI�� �����ϴ� �ڷḦ �˻��Ͻÿ�(�信�� �˻�)
SELECT * FROM V_JOB_INFO
WHERE JOB_ID LIKE 'FI%';

-- �ְ� �޿��� ���� ���� ������ ���̵� �˻��Ͻÿ�
SELECT JOB_ID
FROM JOB_INFO
WHERE MAX_SALARY = (SELECT MAX(MAX_SALARY) FROM JOB_INFO);


COMMIT;

drop table JOB_INFO;
TRUNCATE TABLE JOB_INFO;

drop view V_JOB_INFO;