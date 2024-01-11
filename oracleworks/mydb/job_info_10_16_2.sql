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

CREATE TABLE JOB_INFO_2(
    JOB_ID      VARCHAR2(10),
    MIN_SALARY  NUMBER,
    MAX_SALARY  NUMBER
);

INSERT INTO JOB_INFO_2 VALUES('AD_PRES', 20000, 40000);
INSERT INTO JOB_INFO_2 VALUES('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO_2 VALUES('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO_2 VALUES('FI_MGR', 8000, 16000);
INSERT INTO JOB_INFO_2 VALUES('FI_ACCOUNT', 4000, 9000);
INSERT INTO JOB_INFO_2 VALUES('AC_MGR', 8000, 16000);
INSERT INTO JOB_INFO_2 VALUES('AC_ACCOUNT', 4000, 9000);

COMMIT;
SELECT * FROM JOB_INFO_2;

-- 1. �����޿�, �ְ�޿��� ����� ���Ͻÿ�
SELECT  ROUND(AVG(MIN_SALARY), -2) �����޿����,
        ROUND(AVG(MAX_SALARY), -2) �ְ�޿����
FROM JOB_INFO_2;

-- 2. �����޿��� 5000 �޷� �̻��� ���� ���̵� �˻��Ͻÿ�
SELECT JOB_ID, MIN_SALARY FROM JOB_INFO_2
WHERE MIN_SALARY >= 5000;

-- 3. ���� �޿��� 5000 �޷� �̻��� ������ �˻��� �� �����Ͻÿ�
CREATE VIEW V_JOB_INFO_2
AS SELECT * FROM JOB_INFO_2
WHERE MIN_SALARY >= 5000;

-- 4. �ְ� �޿��� ���� �޿��� ���� 10000 �޷� �̻��� ���� ���̵� ���� �˻��Ͻÿ�
SELECT COUNT(JOB_ID)
FROM JOB_INFO_2
WHERE MAX_SALARY - MIN_SALARY >= 10000;

SELECT JOB_ID, COUNT(JOB_ID)
FROM JOB_INFO_2
WHERE MAX_SALARY - MIN_SALARY >= 10000
GROUP BY JOB_ID;

-- 5. ���� ���̵� �̸��� FI�� �����ϴ� �ڷḦ �˻��Ͻÿ�(�信�� �˻�)
SELECT * FROM V_JOB_INFO_2
WHERE JOB_ID LIKE 'FI%';

-- 6. �ְ� �޿��� ���� ���� ������ ���̵� �˻��Ͻÿ�
SELECT JOB_ID FROM JOB_INFO_2
WHERE MAX_SALARY = (SELECT MAX(MAX_SALARY) FROM JOB_INFO_2);

