/*
-- ������ ���̺��� �����Ѵ�
    �����̸�(PK)(20 byte), ������
-- ������ ������
    ('C', 30000)
    ('Java', 45000)
    ('Python', 40000)
    �� �����Ѵ�.
-- �����б� ��� ���̺��� �����Ѵ�
    �й�(PK), �����̸�(FK)(20 byte)
-- �����б� ������
    (100, 'C')
    (101, 'Java')
    (200, 'Python')
    (201, 'Java')
    �� �����Ѵ�.
--1. Ŀ�� �� 200�� �л��� ���� ��û ���
--2. Python ������ �������?
--3. ������ ���̺� 'C++' ���¸� 35,000���� ����
--4. ������ ���� Ȯ���ϱ�
--5. Java �����ᰡ 45,000������ 40,000������ ����
--6. �����ᰡ ���� �� ������ �����̸��� ������?
*/
-- ������ ���̺�
CREATE TABLE summer_price(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

-- �����б� ��� ���̺�
CREATE TABLE summer_register(
    sid     NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY(subject) REFERENCES summer_price(subject)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

COMMIT;
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 200�� �л��� ���� ��û ���
-- ���� �̻� ����
DELETE FROM summer_register
WHERE sid = 200;

-- Python ������ �������?
SELECT price
FROM summer_price
WHERE subject = 'Python';

-- ������ ���̺� 'C++' ���¸� 35,000���� ����
INSERT INTO summer_price VALUES('C++', 35000);      -- ���� �̻� ����

-- ������ ���� Ȯ���ϱ�
SELECT * FROM summer_price;

-- Java �����ᰡ 45,000������ 40,000������ ����
UPDATE summer_price SET price = 40000               -- ���� �̻� ����
WHERE subject LIKE 'Java';


-- �����ᰡ ���� �� ������ �����̸��� ������?
SELECT subject, price FROM summer_price
WHERE price = (SELECT MIN(price)FROM summer_price);


COMMIT;

SELECT * FROM summer_register;

drop table summer_price;
drop table summer_register;