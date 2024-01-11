/*
����(join)
-- 1. �� �̸��� ���� �ֹ� ���ݿ� ���� �����͸� ��� �˻��Ͻÿ�
-- 2. �ֹ����� ���� �����͵� ��� �˻��ϰ� �̸� ������ �����ϱ�((+) : �ܺ� ����)
-- 3. ���� �̸�, �ֹ��� ���� �̸�, �ֹ���, �ֹ��ݾ��� �˻��ϱ�
-- 4. ��(customer)�� ���� �ֹ�(order)�� ���� ������(�ֹ����� ���� �� ����)�� ��� �˻��ؼ� �̸������� �����Ͻÿ�
-- 5. ������ ���� �ֹ�(order)�� ���� ������(�ֹ����� ���� �� ����)�� ��� �˻��ؼ� �̸������� �����Ͻÿ�
-- 6. ���� �ֹ� �ݾ��� �Ѿ��� �̸������� �����Ͽ� ����Ͻÿ�
-- 7. �迬�� ���� �ֹ� �� �ݾ��� ����Ͻÿ�(Having���� ������ ��)
-- 8. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�(��������)
-- 9. ��(customer)�� ���� �ֹ�(orders)�� ���� �������� �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ���
    ������ �ǸŰ����� �˻��Ͻÿ�(�ܺ�����)
*/
-- 1. ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- 2. �ֹ����� ���� �����͵� ��� �˻��ϰ� �̸� ������ �����ϱ�((+) : �ܺ� ����)
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- 3. ���� �̸�, �ֹ��� ���� �̸�, �ֹ���, �ֹ��ݾ��� �˻��ϱ�
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer_2 cus, book_2 bk, orders_2 ord
WHERE cus.custid = ord.custid AND bk.bookid = ord.bookid;

-- 4. ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��ؼ� �̸������� �����Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- 5. ������ ���� �ֹ�(order)�� ���� ������(�ֹ����� ���� �� ����)�� ��� �˻��ؼ� �̸������� �����Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+) AND cus.name = '������'
ORDER BY cus.name;

-- 6. ���� �ֹ� �ݾ��� �Ѿ��� �̸������� �����Ͽ� ����Ͻÿ�
SELECT cus.name, SUM(ord.saleprice)
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
ORDER BY cus.name;

-- 7. �迬�� ���� �ֹ� �� �ݾ��� ����Ͻÿ�(Having���� ������ ��)
SELECT cus.name, SUM(ord.saleprice)
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
    HAVING cus.name = '�迬��'
GROUP BY cus.name;

-- ��������
-- 8. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�(��������)
SELECT name, saleprice
FROM customer_2 cus INNER JOIN orders_2 ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- �ܺ�����
-- 9. ��(customer)�� ���� �ֹ�(orders)�� ���� �������� �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ���
--  ������ �ǸŰ����� �˻��Ͻÿ�(�ܺ�����)
SELECT name, saleprice
FROM customer_2 cus LEFT OUTER JOIN orders_2 ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
