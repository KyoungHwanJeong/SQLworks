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
CREATE TABLE summer_price_2(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER
);
INSERT INTO summer_price_2 VALUES('C', 30000);
INSERT INTO summer_price_2 VALUES('Java', 45000);
INSERT INTO summer_price_2 VALUES('Python', 40000);

CREATE TABLE summer_register_2(
    sid     NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY (subject) REFERENCES summer_price_2(subject)    
);

INSERT INTO summer_register_2 VALUES(100, 'C');
INSERT INTO summer_register_2 VALUES(101, 'Java');
INSERT INTO summer_register_2 VALUES(200, 'Python');
INSERT INTO summer_register_2 VALUES(201, 'Java');

COMMIT;
SELECT * FROM summer_price_2;
SELECT * FROM summer_register_2;

--1. Ŀ�� �� 200�� �л��� ���� ��û ���
DELETE FROM summer_register_2
WHERE sid = 200;

--2. Python ������ �������?
SELECT price FROM summer_price_2
WHERE subject LIKE 'Python';

--3. ������ ���̺� 'C++' ���¸� 35,000���� ����
INSERT INTO summer_price_2 VALUES('C++', 35000);

--4. ������ ���� Ȯ���ϱ�
SELECT * FROM summer_price_2;

--5. Java �����ᰡ 45,000������ 40,000������ ����
UPDATE summer_price_2 SET price = 40000
WHERE subject LIKE 'Java';

--6. �����ᰡ ���� �� ������ �����̸��� ������?
SELECT subject, price
FROM summer_price_2
WHERE price = (SELECT MIN(price) FROM summer_price_2);