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
-- 5. ���� 'Python'���¸� ��û �� �л��� ����Ѵ�(�̻� �߻� ������?)
-- 6. (NULL, 'C++', 35000) ��ü�� �����Ѵ�(�̻� �߻� ������?)
-- 7. Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���.(�������� �ڵ�)
-- 8. �й� 101���� Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���. �̶� Java �������?(�̻� �߻� ������?)
*/
CREATE TABLE summer_class_2(
    sid     NUMBER,             -- �й�
    subject VARCHAR2(20),       -- ����
    price   NUMBER              -- ������
);
INSERT INTO summer_class_2 VALUES(100, 'C', 30000);
INSERT INTO summer_class_2 VALUES(101, 'Java', 45000);
INSERT INTO summer_class_2 VALUES(200, 'Python', 40000);
INSERT INTO summer_class_2 VALUES(201, 'Java', 45000);

COMMIT;
SELECT * FROM summer_class_2;

-- 1. �����б⸦ �����ϴ� �л��� �й��� �����ϴ� ������?
SELECT sid, subject
FROM summer_class_2;

-- 2. 'Python' ������ �������?
SELECT price ���̽������ FROM summer_class_2
WHERE subject LIKE 'Python';

-- 3. �����б⸦ ��� �л����� ������ �Ѿ���?
SELECT COUNT(sid) �л���, SUM(price) �������Ѿ� FROM summer_class_2;

-- 4. 200�� �л��� ���� ���(����)
DELETE FROM summer_class_2
WHERE sid = 200;

-- 5. ���� 'Python'���¸� ��û �� �л��� ����Ѵ�(�̻� �߻� ������?)
SELECT sid FROM summer_class_2                          -- ���� ������ ������ �����̻� �߻�
WHERE subject LIKE 'Python';

-- 6. (NULL, 'C++', 35000) ��ü�� �����Ѵ�(�̻� �߻� ������?)
INSERT INTO summer_class_2 VALUES(NULL, 'C++', 35000);  -- ��û�� �л��� NULL�ε� ������ �����̻� �߻�

-- 7. Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���.(�������� �ڵ�)
UPDATE summer_class_2 SET price = 40000
WHERE subject = 'Java';

-- 8. �й� 101���� Java �����ᰡ 45,000������ 40,000������ ���� �Ǿ���. �̶� Java �������?(�̻� �߻� ������?)
UPDATE summer_class_2 SET price = 40000
WHERE subject = 'Java' AND sid = 101;

SELECT price FROM summer_class_2                        -- Java�� �����ᰡ 2���� �����̻� �߻�
WHERE subject LIKE 'Java';

ROLLBACK;