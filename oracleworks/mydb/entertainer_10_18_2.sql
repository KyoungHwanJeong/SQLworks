/*
-- ��1����ȭ ���
-- 1. ������ ������ ��������?(entertainers ���̺�� �˻�, �˻��� ������� ���� ����ȭ �ʿ�)
-- 2. �������� �̸��� �������, ������ �˻��Ͻÿ�(��������)
-- 3. �������� �̸��� �������, ������ �˻��Ͻÿ�(��������)
*/
-- ������ ���̺�
CREATE TABLE entertainers_2(
    name        VARCHAR2(30),
    birthday    VARCHAR2(20),
    job         VARCHAR2(30)
);

INSERT INTO entertainers_2
VALUES ('�絿��', '19790601', '���, ����');
INSERT INTO entertainers_2
VALUES ('������', '19920904', '���');
INSERT INTO entertainers_2
VALUES ('�����', '19820220', '���, ����');
COMMIT;
SELECT * FROM entertainers_2;

-- ������ ���̺�, ���� ���̺�� ����(��2����ȭ)
CREATE TABLE entertainer_2(
    name        VARCHAR2(20),
    birthday    VARCHAR2(20)
);
INSERT INTO entertainer_2 VALUES ('�絿��', '19790601');
INSERT INTO entertainer_2 VALUES ('������', '19920904');
INSERT INTO entertainer_2 VALUES ('�����', '19820220');
COMMIT;

CREATE TABLE job_2(
    ename       VARCHAR2(20),
    jobname     VARCHAR2(30)
);
INSERT INTO job_2 VALUES ('�絿��', '���');
INSERT INTO job_2 VALUES ('�絿��', '����');
INSERT INTO job_2 VALUES ('������', '���');
INSERT INTO job_2 VALUES ('�����', '���');
INSERT INTO job_2 VALUES ('�����', '����');

SELECT * FROM entertainer_2;
SELECT * FROM job_2;

-- 1. ������ ������ ��������?(entertainers ���̺�� �˻�, �˻��� ������� ���� ����ȭ �ʿ�)
SELECT *
FROM entertainers_2
WHERE job LIKE '%����%';

-- 2. �������� �̸��� �������, ������ �˻��Ͻÿ�(��������)
SELECT  A.name,
        A.birthday,
        B.jobname
FROM entertainer_2 A, job_2 B
WHERE A.name = b.ename;

-- 3. �������� �̸��� �������, ������ �˻��Ͻÿ�(��������)
SELECT  A.name,
        A.birthday,
        B.jobname
FROM entertainer_2 A INNER JOIN job_2 B
    ON A.name = b.ename;


