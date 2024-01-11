/*
-- 1. �ֹ����̺� Į���� �ڷ��� ���� ����ϱ�
-- 2. ��Ī '���ǸŰǼ�'�� �־ �� �ǸŰǼ��� ����ϱ�
-- 3. ��Ī '���Ǹž�', '����վ�'�� �־ ���� �ֹ��� ������ �� �Ǹžװ� �� ��վ��� ����ϱ�
-- 4. ��Ī '���Ǹž�'�� �־ ���� �ֹ��� ������ �� �Ǹž��� ����ϱ�
-- 5. ���� ������ 3���̻��� ���� �� ���̵�, ��������, ���Ǹž�(��Ī)�� ����ϰ� ����ϱ�(GROUP BY��, HAVING�� �̿�)
-- 6. ���� ������ 3���̻��̰� �� �Ǹž��� 35000 �̻��� ������ �� ���̵�� �� �Ǹžװ� ���� ������ ����ϱ�
-- 7. �� �� ���� ��ȭ��ȣ ���� �˻��ϱ�
-- 8. ���� �߿��� �ִ밡��, �������� �� ����ϱ�
-- 9. '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž��� ����ϱ�
--10. 3�� ���� ���̵�� �ֹ� ������ �˻��ϱ�
--11. ���� ���̵�� �����̸��� �ֹ� ������ �˻��ϱ�
--12. ���� �̸��� ���� �ֹ��� �ֹ� ������ �˻��ϱ�(customer, order ����)
--13. 12���� ��Ī('cus', 'ord')�� ����Ͽ� �����ϱ�
--14. 12���� ��Ī('cus', 'ord')�� ����Ͽ� �����ϰ�, �� �̸����� 1�� ����(��������), �ֹ� ���ݺ��� 2�� ����(��������)�Ͻÿ�
--15. 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻��ϱ�
--16. 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻��ϱ�(���̺� 3�� ���� customer, book, order)
*/
-- �ֹ� ���̺��� Į��, �ڷ��� ����
SELECT * FROM orders;
DESC orders;

-- ��� �Լ� - ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
-- COUNT(*) : '*' - Į����
-- COUNT(Į����) : 
SELECT COUNT(*) AS ���ǸŰǼ� -- ��Ī�� �ٿ��� ����
FROM orders;

-- ���� �ֹ��� ������ �� �Ǹžװ� �� ��վ� ���
SELECT  SUM(saleprice) AS ���Ǹž�,
        AVG(saleprice) AS ����վ�
FROM orders;

-- ���� �ֹ��� ������ �� �Ǹž� ���
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders;

-- ������ �ֹ��� ������ �� �Ǹžװ� ���� ������ ���
-- ���� ������ 3�� �̻��� �ڷ� �˻�(HAVING)
-- HAVING �� ��� - GROUP BY������ ������ ���� �� ����Ѵ�.
-- GROUP BY Į����
SELECT  custid,
        COUNT(*) AS ��������,
        SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3;

-- ���� ������ 3���̻��̰� �� �Ǹž��� 35000 �̻��� ������ �� ���̵�� �� �Ǹžװ� ���� ������ ���
SELECT  custid,
        COUNT(*) AS ��������,
        SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3
    AND SUM(saleprice) > 35000;

-- �� �� ���� ��ȭ��ȣ ���� �˻�
SELECT COUNT(*) AS �Ѱ���, COUNT(phone) AS ��ȭ��ȣ��
FROM customer;

-- ���� �߿��� �ִ밡��, �������� �˱�
SELECT MAX(price) �ְ���, MIN(price) ��������
FROM book;

-- '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž� ���ϱ�
SELECT SUM(saleprice) AS ���Ǹž�
from orders
where custid = 3;

-- 3�� ���� ���̵�� �ֹ� ������ �˻�
select custid, saleprice
from orders
where custid = 3;

-- ���� ���̵�� �����̸��� �ֹ� ������ �˻�
select custid, bookname, saleprice
from orders, book
where orders.bookid = book.bookid;

-- ����(Join)
-- ��������(EQUI JOIN): equal(=)�� ����ϴ� ����
-- ���̺�A.Į���� = ���̺�B.Į���� (�̶� Į�� - �ܷ�Ű)

-- ���� �̸��� ���� �ֹ��� �ֹ� ������ �˻��Ͻÿ�(customer, order ����)
select customer.name, orders.saleprice
from customer, orders
where customer.custid = orders.custid;

-- ��Ī ��� ����
select cus.name, ord.saleprice
from customer cus, orders ord   -- as ��������
where cus.custid = ord.custid;

-- ��Ī ��� ����
-- �� �̸��� 1�� ����(��������, asc), �ֹ� ���ݺ� �������� 2�� ����(desc)
select cus.name, ord.saleprice
from customer cus, orders ord   -- as ��������
where cus.custid = ord.custid
order by cus.name, ord.saleprice desc;

-- 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻�
select custid, bookname, saleprice
from orders, book
where orders.bookid = book.bookid
    and orders.custid = 3;

-- 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻�(���̺� 3�� ����)
select customer.custid, book.bookname, orders.saleprice
from orders, customer, book
where orders.custid = customer.custid
and orders.bookid = book.bookid
and customer.name = '�Ȼ�';

-- ��ü ���
select * from orders;   -- ��ü ��ȸ�� *�� ����Ѵ�