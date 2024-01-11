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

-- ���� : �� ���̺��� ���� �����Ͽ� ����ϴ� ���
-- ���� ����(equi join) : ���� ������ ��Ȯ�� ��ġ�ϴ� ��쿡 ��� ���
-- �ܺ� ����(outer join) : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ����� ���
-- 

select * from book;
select * from customer;
select * from orders;

-- ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
-- �� �̸����� ����(�ڵ����� �׷�ȭ ��)
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid       -- ī�׽þȰ�: customer(6��) X orders(10��), id �ߺ����Ÿ� ���� ������ ���� �ߺ��Ǿ� ��µȴ�
ORDER BY cus.name;

-- �ֹ����� ���� �����͵� ��� �˻�((+) : �ܺ� ����)
-- ������ ��ġ���� ���� ���̺� +�� �־���
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- ���� �̸�, �ֹ��� ���� �̸�, �ֹ���, �ֹ��ݾ�
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid       -- �⺻Ű = �ܷ�Ű
    AND bk.bookid = ord.bookid;
    
-- ��(customer)�� ���� �ֹ�(order)�� ���� ������(�ֹ����� ���� �� ����)�� ��� �˻��Ͻÿ�    
-- ���� : '������' ���� �ֹ������� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+) 
    --AND cus.name = '������'
ORDER BY cus.name;

-- ���� �ֹ� �ݾ��� �Ѿ��� ���
-- SUM�� �׷��Լ��̱� ������ GROUP BY ����� ��
SELECT cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
ORDER BY cus.name asc;

-- �迬�� ���� �ֹ� �� �ݾ��� ���(Having���� ������ ��)
SELECT cus.custid, cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.custid, cus.name
    HAVING cus.name = '�迬��'
ORDER BY cus.name asc;

-- ǥ������(ANSI SQL)
-- ��������(INNER JOIN)
-- ���� �̸�(customer)�� ���� �ֹ�(orders)�� ���� �����͸� ��� �˻��Ͻÿ�
-- ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord     -- INNER �� ���� ����
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- �ܺ� ����(OUTER JOIN)
-- JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϾ ����ϴ� ���
-- ��(customer)�� ���� �ֹ�(orders)�� ���� ��������
-- �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ���
-- ������ �ǸŰ����� �˻��Ͻÿ�

SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord -- ���� �� ������ �Ϸ��� ���� ���ʿ� �����Ƿ� LEFT OUTER JOIN�� �Ѵ�. �ֹ��� �� ������ �Ϸ��� RIGHT OUTER JOIN�� �Ѵ�.
    ON cus.custid = ord.custid
ORDER BY cus.name;
