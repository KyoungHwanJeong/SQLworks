/*
�����Լ� 
-- 1. -10�� ���밪�� ���ϱ�
-- 2. 127.67�� �ݿø��ϱ�(�Ҽ� ��° �ڸ����� �ݿø�, �Ҽ� ù° �ڸ����� �ݿø�,
                        ���� �ڸ����� �ݿø�, ���� �ڸ����� �ݿø�)
-- 3. 127.67�� �����ϱ�(�Ҽ� ��° �ڸ����� ����, �Ҽ� ù°�ڸ� ���� ����,
                        ���� �ڸ����� ����, ���� �ڸ����� ����)
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
-- ���� Ÿ�� ���� �Լ�
-- ���밪 ���ϱ� : ABS()
-- ���� ���̺� : dual
SELECT ABS(-10) FROM dual;

-- �ݿø� : ROUND(����, �ڸ���)
SELECT ROUND(127.67, 1) FROM dual;  -- 127.7 �Ҽ� ��° �ڸ����� �ݿø�
SELECT ROUND(127.67, 0) FROM dual;  -- 128 �Ҽ� ù° �ڸ����� �ݿø�
SELECT ROUND(127.67, -1) FROM dual; -- 120 ���� �ڸ����� �ݿø�
SELECT ROUND(127.67, -2) FROM dual; -- 100 ���� �ڸ����� �ݿø�

-- ����(����) : TRUNC(����, �ڸ���)
SELECT TRUNC(127.67, 1) FROM dual;  -- 127.6 �Ҽ� ù°�ڸ����� ǥ��(���� ����)
SELECT TRUNC(127.67, 0) FROM dual;  -- 127
SELECT TRUNC(127.67, -1) FROM dual; -- 120
SELECT TRUNC(127.67, -2) FROM dual; -- 100

-- ����(����) : FLOOR(����) - ������ �����Ѵ�.
SELECT FLOOR(127.67) FROM dual; -- �Ҽ� ���� ����(����)
SELECT FLOOR(127.6) FROM dual;

-- �ŵ����� : POWER(��, ����)
SELECT POWER(2, 3) FROM dual;

-- ���� Ÿ��
-- �ҹ��ڷ� �����ϱ� : LOWER('ABCD')
-- �빮�ڷ� �����ϱ� : UPPER('abcd')
SELECT LOWER('ABCD') FROM dual;
SELECT UPPER('abcd') FROM dual;

-- ���ڿ��� �Ϻκ��� ���� : SUBSTR(���ڿ�, �ε���, �ڸ���)
-- �ε����� 1������ ����
SELECT SUBSTR('abc', 1, 2) FROM dual;   -- 1������ 2���� ���ڸ� ����

-- ���ڿ��� ã�� �ٲٱ� : REPLACE(���ڿ�, ���� �� ����, ���� �� ����)
SELECT REPLACE('abcd', 'c', 'e') FROM dual; -- 'c'�� 'e'�� �ٲٱ�

-- ���ڿ��� ���� : LENGTH(���ڿ�)
SELECT LENGTH('abcd') FROM dual;

-- ����ŷ ó�� 
-- LPAD(���ڿ�, ��ü����, Ư������) -- ���ʺ��� Ư�� ���ڷ� ��ĭ ä���
-- RPAD(���ڿ�, ��ü����, Ư������) -- �����ʺ��� Ư�� ���ڷ� ��ĭ ä���
SELECT LPAD('Today', 8, '*') FROM dual;
SELECT RPAD('Today', 8, '*') FROM dual;

-- �ֹ����̺�
-- ���� ��� �ֹ� �ݾ��� ��������� �ݿø�
SELECT  custid AS ����ȣ,
        SUM(saleprice) AS �հ�ݾ�,
        COUNT(saleprice) AS �ֹ��Ǽ�,
        ROUND(AVG(saleprice), -2) AS ����ֹ��ݾ�
FROM orders
GROUP BY custid;

-- �������̺�
-- å������ ���ڼ�
-- å������ ����Ʈ �� : �ѱ� - 3byte, ����, Ư������ - 1byte
SELECT  bookname,
        LENGTH(bookname) as ���ڼ�,
        LENGTHB(bookname) as ����Ʈ��
FROM book;

--'�౸'�� �󱸷� �����Ͽ� �˻��ϱ�
SELECT bookname,
    REPLACE(bookname, '�౸', '��') as bookname
FROM BOOK;

-- �� ���̺�
-- �� �̸��� ���� ���� ���� ���� �ο����� ���Ͻÿ�.
SELECT SUBSTR(name, 1, 1) ��,
    COUNT(*) �ο�
FROM customer
GROUP BY SUBSTR(name, 1, 1);

--


