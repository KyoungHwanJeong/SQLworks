/*
�� �����ϱ�
1. customer���� �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 �����Ѵ�
2. �� �̸��� '�迬��'�� ���� '������'���� ������Ʈ �ϰ� �� ������ ����ϱ�
3. �� ���̵� 3�� ���� �����ϰ� �� ������ ����ϱ�
*/
-- ��(VIEW) ����
-- UPDATE, DELELTE ����� ��� �� �� ����, ������ ������ �ִ�.
-- �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 ����ÿ�

CREATE VIEW vw_customer
AS SELECT * FROM customer
    WHERE address LIKE '���ѹα�%';

-- ������Ʈ
UPDATE vw_customer
    SET name = '������'
    WHERE name = '�迬��';
    
ROLLBACK;
    
-- �� ���̵� 3�� ���� ����
-- �����ϰ� �ִ� order ���̺��� �־ ���� �Ұ�
DELETE vw_customer
    WHERE custid = 3;


COMMIT;
SELECT * FROM vw_customer;

-- ���� ���� �ֹ��� ���� ������ �˻�
-- �� �����
CREATE VIEW vw_book_order AS
SELECT cs.name, bk.bookname, od.saleprice
FROM book bk, customer cs, orders od
WHERE bk.bookid = od.bookid
    AND cs.custid = od.custid;
    
SELECT * FROM vw_book_order;

SELECT COUNT(*) ��ü�Ǽ�
FROM vw_book_order;


-- VIEW ����
DROP VIEW vw_customer;
