/*
�����Լ� 
-- 1. -10�� ���밪�� ���ϱ�
-- 2. 127.67�� �ݿø��ϱ�(�Ҽ� ��° �ڸ����� �ݿø�, �Ҽ� ù° �ڸ����� �ݿø�,
--                      ���� �ڸ����� �ݿø�, ���� �ڸ����� �ݿø�)
-- 3. 127.67�� �����ϱ�(�Ҽ� ��° �ڸ����� ����, �Ҽ� ù°�ڸ� ���� ����,
--                      ���� �ڸ����� ����, ���� �ڸ����� ����)
-- 4. 127.67�� ������ �����ϱ�
-- 5. 2�� 3�� �ŵ����� ���ϱ�
-- 6. 'ABCD'�� �ҹ��ڷ� ����ϱ�
-- 7. 'abcd'�� �빮�ڷ� ����ϱ�
-- 8. 'abc'�� 1��° ���� 2���� ���ڿ� �����ϱ�(SUBSTR �̿�)
-- 9. 'abcd'���� 'c'�� 'e'�� �ٲٱ�
--10. 'abcd' ���ڿ��� ���̸� ���ϱ�
--11. ��ü ���̰� 8 byte �� today ���ڿ��� ������ *�� ����ŷ�ϱ�
--12. ��ü ���̰� 8 byte �� today ���ڿ��� �������� *�� ����ŷ�ϱ�
-- ���� ���̺� �̿�
--13. ����ȣ, �հ�ݾ�, �ֹ� �Ǽ��� ����ϰ�, ���� ��� �ֹ� �ݾ��� ��������� �ݿø��Ͽ� ����ϱ�
--14. å ������ ���ڼ��� ����Ʈ ����ϱ�
--15. å ���� '�౸'�� �ִ� å�� ������ '��'�� �����ϱ�
--16. �� �̸��� ���� ���� ���� ���� �ο����� ���ϱ�
*/
-- 1. -10�� ���밪�� ���ϱ�
SELECT ABS(-10) FROM dual;

-- 2. 127.67�� �ݿø��ϱ�(�Ҽ� ��° �ڸ����� �ݿø�, �Ҽ� ù° �ڸ����� �ݿø�,
--                      ���� �ڸ����� �ݿø�, ���� �ڸ����� �ݿø�)
SELECT ROUND(127.67, 1) FROM dual;
SELECT ROUND(127.67, 0) FROM dual;
SELECT ROUND(127.67, -1) FROM dual;
SELECT ROUND(127.67, -2) FROM dual;

-- 3. 127.67�� �����ϱ�(�Ҽ� ��° �ڸ����� ����, �Ҽ� ù°�ڸ� ���� ����,
--                      ���� �ڸ����� ����, ���� �ڸ����� ����)
SELECT TRUNC(127.67,1) FROM dual;
SELECT TRUNC(127.67,0) FROM dual;
SELECT TRUNC(127.67,-1) FROM dual;
SELECT TRUNC(127.67,-2) FROM dual;

-- 4. 127.67�� ������ �����ϱ�
SELECT FLOOR(127.67) FROM dual;

-- 5. 2�� 3�� �ŵ����� ���ϱ�
SELECT POWER(2, 3) FROM dual;

-- 6. 'ABCD'�� �ҹ��ڷ� ����ϱ�
SELECT LOWER('ABCD') FROM dual;

-- 7. 'abcd'�� �빮�ڷ� ����ϱ�
SELECT UPPER('abcd') FROM dual;

-- 8. 'abc'�� 1��° ���� 2���� ���ڿ� �����ϱ�(SUBSTR �̿�)
SELECT SUBSTR('abc', 1, 2) FROM dual;

-- 9. 'abcd'���� 'c'�� 'e'�� �ٲٱ�
SELECT REPLACE('abcd', 'c', 'e') FROM dual;

--10. 'abcd' ���ڿ��� ���̸� ���ϱ�
SELECT LENGTH('abcd') FROM dual;

--11. ��ü ���̰� 8 byte �� today ���ڿ��� ������ *�� ����ŷ�ϱ�
SELECT LPAD('today', 8, '*') FROM dual;

--12. ��ü ���̰� 8 byte �� today ���ڿ��� �������� *�� ����ŷ�ϱ�
SELECT RPAD('today', 8, '*') FROM dual;

--13. ����ȣ, �հ�ݾ�, �ֹ� �Ǽ��� ����ϰ�, ���� ��� �ֹ� �ݾ��� ��������� �ݿø��Ͽ� ����ϱ�
SELECT  custid AS ����ȣ,
        SUM(saleprice) AS �հ�ݾ�,
        COUNT(saleprice) AS �ֹ��Ǽ�,
        ROUND(AVG(saleprice), -2) AS ����ֹ��ݾ�
FROM orders_2
GROUP BY custid;

--14. å ������ ���ڼ��� ����Ʈ ����ϱ�
SELECT  bookname AS å����,
        LENGTH(bookname) AS ���ڼ�,
        LENGTHB(bookname) AS ����Ʈ��
FROM book_2;

--15. å ���� '�౸'�� �ִ� å�� ������ '��'�� �����ϱ�
SELECT bookname, REPLACE(bookname, '�౸', '��') AS bookname FROM book_2;

COMMIT;

UPDATE book_2 SET bookname = '��'
WHERE bookname LIKE '�౸';
SELECT * FROM book_2;

--16. �� �̸��� ���� ���� ���� ���� �ο����� ���ϱ�
SELECT  SUBSTR(name, 1, 1) AS ��,
        COUNT(*) AS �ο�
FROM customer_2
GROUP BY SUBSTR(name, 1, 1);