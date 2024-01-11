/*
--1. ������ ������ ���� ���� ������ �˻��Ͻÿ�
--2. �����߿��� ���� ��� ������ �̸��� ���� ������ �˻��Ͻÿ�
--3. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
--4. ������ ������ ���� �ִ� ���� �̸� ���(�������� �̿��ؼ�)
--5. ������ ������ ���� ���� ���� �̸� ���(�������� �̿��ؼ�)
--6. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�(����)
--7. ���� �̸��� ���� �Ǹž��� ���� �˻�(customer, orders)
--8. ���� �̸��� ���� �Ǹž��� ���� �˻�(customer, orders), �� ����ȣ�� 2 ������
--9. 8���� ���� FROM ������ �������� ������� ����ϱ�
--10. ��ǰ ���� ���̺� �ִ� ��ǰ�ڵ�� ��ǰ �̸�, �� ���̵�, ������ �˻�(SELECT ������ �������� �̿��ϱ�)
--11. ���䰡 ���� ��ǰ�� �˻��Ͻÿ�
*/
-- ���� ����(Sub Query): �μ�����(��ø ����)
-- SELECT�� ���ο� �� SELECT���� ������

-- ������ ������ ���� ���� ������ �˻��Ͻÿ�
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- �����߿��� ���� ��� ������ �̸��� ���� ������ �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = 
      (SELECT MAX(price) FROM book);
      
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT custid FROM orders;
/*
SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);
*/
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- ������ �������� (WHERE ��)
-- ������ ������ ���� �ִ� ���� �̸� ���
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- ������ �������� (WHERE ��)
-- ������ ������ ���� ���� ���� �̸� ���
SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);

-- ���� ��� : customer, orders
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- FROM���� �ִ� �������� - �ζ��κ� ��� ��
-- ���� �̸��� ���� �Ǹž��� ���� �˻�(customer, orders)
-- �׷캰 : Groub by
-- �� , �� ��ȣ�� 2 ������

-- ���� ����
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid = od.custid 
    AND cs.custid <= 2
GROUP BY cs.name;

SELECT cus.name, SUM(ord.saleprice) total
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;
/*
-- HAVING�� ��...?
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid = od.custid 
    AND cs.custid <= 2
GROUP BY cs.name;
    HAVING SUM(od.saleprice) >= 30000;
*/
/*
 �������
 1. FROM �� ���̺��
 2. WHERE, GROUP BY
 3. SELECT ��
 4. ORDER ��
*/
-- ���� ����(FROM ��)
SELECT cs.name, SUM(od.saleprice)
FROM (SELECT * FROM customer
        WHERE custid <= 2) cs, 
     orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

--
SELECT * FROM product;
SELECT * FROM product_review;

-- ��Į�� ��������
--��ǰ ���� ���̺� �ִ� ��ǰ�ڵ�� ��ǰ �̸�, �� ���̵�, ������ �˻�(SELECT ��)
SELECT  a.product_code,
        (select b.product_name 
         from product b
         where a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review a;

-- ���䰡 ���� ��ǰ�� �˻��Ͻÿ�
SELECT *
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code
WHERE b.content IS NULL;