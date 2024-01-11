-- ��¥�� �ð� �Լ� 
-- ���� ��¥ ���
SELECT SYSDATE FROM dual;

-- ���� ��¥ ������ ��ȯ
-- TO_CHAR(��¥, ����)
SELECT  TO_CHAR(SYSDATE, 'YYYY') �⵵,
        TO_CHAR(SYSDATE, 'MM') ��,
        TO_CHAR(SYSDATE, 'DD') ��,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD') ��¥
FROM dual;

-- ���� ��¥�� �ð�
SELECT SYSTIMESTAMP FROM dual;

-- �ð� ���� ��ȯ
SELECT  TO_CHAR(SYSDATE, 'HH:MI:SS') �ð�,
        TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD HH:MI:SS') ��¥�ͽð�
FROM DUAL;

-- 10�� ���� ��¥ ���
-- ���� ���ϰ� ����
-- ���� ��¥���� 10�� �� , ���� ��¥ ���
SELECT SYSDATE -10 FROM DUAL;
SELECT SYSDATE +10 FROM DUAL;

-- Ư�� ��¥���� 10�� ��, �� ���
-- TO_DATE(���ڿ�[��¥])
SELECT TO_DATE('2023-09-01') + 10 FROM DUAL;

-- ���� ���ϰ� ����
-- ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3) ��� FROM DUAL;     -- 3���� ��
SELECT ADD_MONTHS(SYSDATE, -3) ��� FROM DUAL;    -- 3���� ��
SELECT ADD_MONTHS(TO_DATE('2023/5/1'), -3) ��� FROM DUAL;    --Ư����¥���� 3���� ��

-- ���� �� ����ϱ�
-- MONTHS_BETWEEN(������, ������)
-- �Ѱ����� �ݿø� - ROUND() ���
SELECT 
    ROUND(MONTHS_BETWEEN(SYSDATE,               -- ���� ��¥���� �Ѱ�����
        TO_DATE('2023-1-1')), 0) �Ѱ�����
FROM DUAL;

SELECT 
    ROUND(MONTHS_BETWEEN(TO_DATE('2023-12-31'), -- 2023.1.1 ���� 2023.12.31���� �Ѱ�����
        TO_DATE('2023-1-1')), 0) �Ѱ�����
FROM DUAL;

-- orders ���̺��� ��¥ �ð��Լ� ����ϱ�
-- ������ �ֹ��Ϸκ��� 10���� ������ Ȯ���Ѵ�.
-- �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
SELECT  orderid �ֹ���ȣ,
        orderdate �ֹ���,
        TO_CHAR(TO_DATE(orderdate) + 10, 'YYYY-MM-DD') Ȯ����
FROM orders;

-- �ֹ��Ͽ� 3���� ���ϰ�, ����
-- �ֹ���ȣ�� 6���� 10�� ���� ����Ͻÿ�
SELECT  orderid �ֹ���ȣ,
        orderdate �ֹ���,
        TO_CHAR(ADD_MONTHS(orderdate, 3), 'YYYY-MM-DD') ���ϱ���,
        TO_CHAR(ADD_MONTHS(orderdate, -3), 'YYYY-MM-DD') ������
FROM orders
--WHERE orderid >=6 AND orderid <= 10;
WHERE orderid BETWEEN 6 AND 10;

-- �ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ����� �� �������� ���Ͻÿ�
SELECT  orderid �ֹ���ȣ,
        orderdate �ֹ���,
        TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) �Ѱ�����
FROM orders
WHERE orderid = 10;

-- ��ȯ �Լ� : TO_NUMBER() : ���ڸ� ���ڷ� ��ȯ����
SELECT TO_NUMBER('320') FROM DUAL; -- �ڹ��� INTEGER.parseInt()
