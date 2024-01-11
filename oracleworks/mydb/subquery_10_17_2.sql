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

--1. ������ ������ ���� ���� ������ �˻��Ͻÿ�
SELECT MAX(price) FROM book_2;

--2. �����߿��� ���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname FROM book_2
WHERE price = (SELECT MAX(price) FROM book_2);

--3. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT name FROM customer_2
WHERE custid IN(SELECT custid FROM orders_2);

--4. ������ ������ ���� �ִ� ���� �̸� ���(�������� �̿��ؼ�)
SELECT name FROM customer_2
WHERE custid IN(SELECT custid FROM orders_2);

--5. ������ ������ ���� ���� ���� �̸� ���(�������� �̿��ؼ�)
SELECT name FROM customer_2
WHERE custid NOT IN(SELECT custid FROM orders_2);

--6. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�(����)
SELECT DISTINCT cus.name 
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid;

--7. ���� �̸��� ���� �Ǹž��� ���� �˻�(customer, orders)
SELECT cus.name, SUM(ord.saleprice) total
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

--8. ���� �̸��� ���� �Ǹž��� ���� �˻�(customer, orders), �� ����ȣ�� 2 ������
SELECT cus.name, SUM(ord.saleprice) total
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid AND cus.custid <= 2
GROUP BY cus.name;

--9. 8���� ���� FROM ������ �������� ������� ����ϱ�
SELECT cus.name, SUM(ord.saleprice) total
FROM (SELECT * FROM customer_2
        WHERE custid <= 2) cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

--10. ��ǰ ���� ���̺� �ִ� ��ǰ�ڵ�� ��ǰ �̸�, �� ���̵�, ������ �˻�(SELECT ������ �������� �̿��ϱ�)
SELECT product_code,
    (SELECT b.product_name FROM product_2 b 
    WHERE a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review_2 a;