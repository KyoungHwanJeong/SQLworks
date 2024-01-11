/*
-- 1. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(���������� �̿��ؼ�)
-- 2. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(���������� �̿��ؼ�)
-- 3. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(JOIN ~ USING�� �̿��ؼ�)
-- 4. �ֹ��� ���� ���Ḧ �����Ͽ� ��� �ֹ� ������ ����Ͻÿ�
*/
-- ���̺� ����, �ڷ� ����
CREATE TABLE drink_2(
    drink_code  VARCHAR2(3)  NOT NULL PRIMARY KEY,   -- ���� �ڵ�
    drink_name  VARCHAR2(30) NOT NULL                -- ���� �̸�
);

CREATE TABLE cafe_order_2(
    order_no    VARCHAR2(10) PRIMARY KEY,            -- �ֹ� ��ȣ
    drink_code  VARCHAR2(3) NOT NULL,                -- ���� �ڵ�
    order_cnt   NUMBER NOT NULL,                     -- �ֹ� ����
    FOREIGN KEY (drink_code) REFERENCES drink(drink_code)      -- �ܷ�Ű
);
// ����
INSERT INTO drink_2 VALUES('A01', '�Ƹ޸�ī��');
INSERT INTO drink_2 VALUES('B01', 'ī���');
INSERT INTO drink_2 VALUES('C01', '�ڸ�');
// �ֹ�
INSERT INTO cafe_order_2 VALUES('2023100101', 'A01', 3);
INSERT INTO cafe_order_2 VALUES('2023100102', 'B01', 1);
INSERT INTO cafe_order_2 VALUES('2023100123', 'A01', 2);

COMMIT;

SELECT * FROM drink_2;
SELECT * FROM cafe_order_2;

-- 1. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(���������� �̿��ؼ�)
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A, cafe_order_2 B
WHERE A.drink_code = B.drink_code;

-- 2. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(���������� �̿��ؼ�)
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A INNER JOIN cafe_order_2 B
    ON A.drink_code = B.drink_code;

-- 3. �ֹ� ��ȣ, ���� �ڵ�, ���� �̸�, �ֹ� ������ ����Ͻÿ�(JOIN ~ USING�� �̿��ؼ�)
SELECT B.order_no, drink_code, A.drink_name, B.order_cnt
FROM drink_2 A JOIN cafe_order_2 B
    USING (drink_code);
    
-- 4. �ֹ��� ���� ���Ḧ �����Ͽ� ��� �ֹ� ������ ����Ͻÿ�
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A LEFT OUTER JOIN cafe_order_2 B
    ON A.drink_code = B.drink_code;
