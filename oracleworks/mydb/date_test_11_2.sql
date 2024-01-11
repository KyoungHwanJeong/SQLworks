-- ��¥ Į�� 
-- 1. DATE DEFAULT SYSTEM (���� ��¥�� �ð�)
-- 2. DATE (Ư����¥)

SELECT SYSDATE FROM DUAL;
-- ��¥
SELECT * FROM book;

-- ��¥�� �ð�
SELECT SYSTIMESTAMP FROM DUAL;

-- 20�� ���� ��¥ ���
SELECT SYSDATE - 20 FROM DUAL;

-- Ư���� ������ 20�� ���� ��¥ ���
SELECT TO_DATE('2023-10-25') - 20 FROM DUAL;

-- ������ �ֹ� Ȯ������
SELECT  orderid �ֹ���ȣ,
        orderdate �ֹ���,
        TO_DATE(orderdate) + 10 Ȯ����
FROM orders;

CREATE TABLE date_test1(
    reg_date    DATE,
    hire_date   DATE
);
-- �߰� 1.
INSERT INTO date_test1 VALUES (SYSDATE, '2023-11-01');
INSERT INTO date_test1 VALUES (SYSDATE, TO_DATE('2023-11-01'));

-- �ڹ� Ŭ������ �����ÿ� 
CREATE TABLE date_test2(
    reg_date    DATE DEFAULT SYSDATE,
    hire_date   DATE
);
-- �߰� 2.
INSERT INTO date_test2(hire_date) VALUES ('2023-11-01');
INSERT INTO date_test2 VALUES (SYSDATE, TO_DATE('2023-11-01'));

SELECT * FROM date_test1;
SELECT * FROM date_test2;

COMMIT;
DROP TABLE date_test1;
DROP TABLE date_test2;