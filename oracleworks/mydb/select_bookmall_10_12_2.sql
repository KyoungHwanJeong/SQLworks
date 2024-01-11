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

-- 1. �ֹ����̺� Į���� �ڷ��� ���� ����ϱ�
SELECT * FROM orders_2;
DESC orders_2;

-- 2. ��Ī '���ǸŰǼ�'�� �־ �� �ǸŰǼ��� ����ϱ�
SELECT count(*) AS ���ǸŰǼ�
FROM orders_2;

-- 3. ��Ī '���Ǹž�', '����վ�'�� �־ ���� �ֹ��� ������ �� �Ǹžװ� �� ��վ��� ����ϱ�
SELECT  SUM(saleprice) AS ���Ǹž�,
        AVG(saleprice) AS ����վ�
FROM orders_2;

-- 4. ��Ī '���Ǹž�'�� �־ ���� �ֹ��� ������ �� �Ǹž��� ����ϱ�
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders_2;

-- 5. ���� ������ 3���̻��� ���� �� ���̵�, ��������, ���Ǹž�(��Ī)�� ����ϰ� ����ϱ�(GROUP BY��, HAVING�� �̿�)
SELECT  custid AS �����̵�,
        COUNT(*) AS ��������,
        SUM(saleprice) AS ���Ǹž�
FROM orders_2
GROUP BY custid
HAVING COUNT(*) >= 3;

-- 6. ���� ������ 3���̻��̰� �� �Ǹž��� 35000 �̻��� ������ �� ���̵�� �� �Ǹžװ� ���� ������ ����ϱ�
SELECT  custid AS �����̵�,
        SUM(saleprice) AS ���Ǹž�,
        COUNT(*) AS ��������
FROM orders_2
GROUP BY custid
HAVING COUNT(*) >= 3 AND SUM(saleprice) >= 35000;

-- 7. �� �� ���� ��ȭ��ȣ ���� �˻��ϱ�
SELECT COUNT(*) AS �Ѱ���, COUNT(phone) AS ��ȭ��ȣ��
FROM customer_2;

-- 8. ���� �߿��� �ִ밡��, �������� �� ����ϱ�
SELECT MAX(price) �ְ���, MIN(price) ��������
FROM book_2;

-- 9. '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž��� ����ϱ�
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders_2
WHERE custid = 3;

--10. 3�� ���� ���̵�� �ֹ� ������ �˻��ϱ�
SELECT custid, saleprice
FROM orders_2
WHERE custid = 3;

--11. ���� ���̵�� �����̸��� �ֹ� ������ �˻��ϱ�
SELECT custid, bookname, saleprice
FROM orders_2, book_2
WHERE orders_2.bookid = book_2.bookid;

--12. ���� �̸��� ���� �ֹ��� �ֹ� ������ �˻��ϱ�(customer, order ����)
SELECT customer_2.name, orders_2.saleprice
FROM customer_2, orders_2
WHERE customer_2.custid = orders_2.custid;

--13. 12���� ��Ī('cus', 'ord')�� ����Ͽ� �����ϱ�
SELECT cus.name , ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid;

--14. 12���� ��Ī('cus', 'ord')�� ����Ͽ� �����ϰ�, �� �̸����� 1�� ����(��������), �ֹ� ���ݺ��� 2�� ����(��������)�Ͻÿ�
SELECT cus.name , ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
ORDER BY cus.name ASC, ord.saleprice DESC;

--15. 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻��ϱ�
SELECT custid, bookname, saleprice
FROM orders_2, book_2
WHERE orders_2.bookid = book_2.bookid AND orders_2.custid = 3;
