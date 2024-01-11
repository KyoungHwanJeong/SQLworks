/*
-- ���� �б� ���̺��� �����Ѵ�
    �й�, ����(20 byte), ������
-- ���� �б� ������
    (100, 'C', 30000)
    (101, 'Java', 45000)
    (200, 'Python', 40000)
    (201, 'Java', 45000)
    �� �����Ѵ�.
-- 1. �����б⸦ �����ϴ� �л��� �й��� �����ϴ� ������?
-- 2. 'Python' ������ �������?
-- 3. �����б⸦ ��� �л����� ������ �Ѿ���?
-- 4. 200�� �л��� ���� ���(����)
-- 5. ���� 'Python'���¸� ��û �� �л��� �����Ѵ�(�̻� �߻� ������?)
-- 6. (NULL, 'C++', 35000) ��ü�� �����Ѵ�(�̻� �߻� ������?)
-- 7. Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���.(�������� �ڵ�)
-- 8. �й� 101���� Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���. �̶� Java �������?(�̻� �߻� ������?)
*/
-- ���� �б� ���̺�
CREATE TABLE summer_class(
    sid     NUMBER,                     -- �й�
    subject VARCHAR2(20),               -- ����
    price   NUMBER                      -- ������
);
-- ���� �б� ������
INSERT INTO summer_class(sid, subject, price) VALUES(100, 'C', 30000);
INSERT INTO summer_class(sid, subject, price) VALUES(101, 'Java', 45000);
INSERT INTO summer_class(sid, subject, price) VALUES(200, 'Python', 40000);
INSERT INTO summer_class(sid, subject, price) VALUES(201, 'Java', 45000);

-- �����б⸦ �����ϴ� �л��� �й��� �����ϴ� ������?
SELECT sid, subject FROM summer_class;

-- 'Python' ������ �������?
SELECT price FROM summer_class
WHERE subject LIKE 'Python';

-- �����б⸦ ��� �л����� ������ �Ѿ���?
SELECT COUNT(sid) �л���, SUM(price) �������Ѿ�
FROM summer_class;

-- 200�� �л��� ���� ���(����)
DELETE FROM summer_class
WHERE sid = 200;

-- ���� 'Python'���¸� ��û �� �л��� ����ϸ� �����̻��� �߻�
--
SELECT price FROM summer_class          -- ���� �̻� �߻�(�й�, ����, ������ ����� �����)
WHERE subject LIKE 'Python';            

-- ���� �̻�
-- C++ ���� ���� : ��û�� �л��� ����
INSERT INTO summer_class VALUES(NULL, 'C++', 35000);        -- ���� �̻� �߻�

-- �л� 3��, Ʃ���� 4��
SELECT COUNT(*) �����ο�
FROM summer_class;

SELECT COUNT(sid) �����ο�                        -- ����ġ(NULL���� ���Ե�)
FROM summer_class;

-- ���� �̻�
-- Java �����ᰡ 45,000������ 40,000������ ����
UPDATE summer_class SET price = 40000           -- ���� ���� �ڵ�
WHERE subject LIKE 'Java';

-- ���� UPDATE���� ����ó�� �ϸ� �̻� ���� �߻�
-- 1�Ǹ� ����
UPDATE summer_class SET price = 40000           
WHERE subject LIKE 'Java'
    AND sid = 101;

-- Java �������?
-- ���� �̻� ���� �߻�, �����ᰡ 2�� ��µ�
SELECT price FROM summer_class
WHERE subject LIKE 'Java';

SELECT * FROM summer_class;
drop table summer_class;

COMMIT;
ROLLBACK;