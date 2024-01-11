/*
-- product ���̺��� �����Ѵ�
    ��ǰ�ڵ�(6 byte)(PK), ��ǰ��(50 byte)(NOT NULL), ��ǰ����(NOT NULL)
-- ��ǰ ������
    ('100001', '������ ���� ���콺', 25000)
    ('100002', '���� ���̹� Ű����', 30000)
    ('100003', '������ �г� ���þ߰� �����', 1200000)
    
-- ����
-- 1. ��ǰ�� �� ���� �� ��ǰ ������ ����� ���Ͻÿ�(��հ����� ��� ������ �ݿø��ϱ�)
-- 2. ��ǰ �߿��� ���콺 �̸��� ���� �˻��ϱ�
-- 3. ��ǰ�� ���ݼ����� �����Ͻÿ� (��������)
*/
-- product ���̺� ����
CREATE TABLE product_2(
    product_code CHAR(6) PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    price NUMBER NOT NULL
);
INSERT INTO product_2(product_code, product_name, price)
VALUES('100001', '������ ���� ���콺', 25000);
INSERT INTO product_2(product_code, product_name, price)
VALUES('100002', '���� ���̹� Ű����', 30000);
INSERT INTO product_2(product_code, product_name, price)
VALUES('100003', '������ �г� ���þ߰� �����', 120000);

COMMIT;
SELECT * FROM product_2;

-- ����
-- 1. ��ǰ�� �� ���� �� ��ǰ ������ ����� ���Ͻÿ�(��հ����� ��� ������ �ݿø��ϱ�)
SELECT  COUNT(*) ��ǰ���Ѱ���, 
        ROUND(AVG(price), -2) ��հ��� 
FROM product_2;

-- 2. ��ǰ �߿��� ���콺 �̸��� ���� �˻��ϱ�
SELECT product_name, price FROM product_2
WHERE product_name LIKE '%���콺%';

-- 3. ��ǰ�� ���ݼ����� �����Ͻÿ� (��������)
SELECT * FROM product_2
ORDER BY price DESC;
