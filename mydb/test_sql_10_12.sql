/*
�ǽ�
--1. ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�
--2. ��� ���� �̸�, �ּ�, ��ȭ��ȣ�� �˻��Ͻÿ�
--3. �ּҰ� '����'�� ���� �˻��Ͻÿ�
--4. ���� �̸��� '�迬��' Ȥ�� ' �Ȼ�' �� ���� �˻��Ͻÿ�
--5. �ּҰ� '���ѹα�'�� �ƴ� ���� �˻��Ͻÿ�
--6. ��ȭ��ȣ�� ���� ���� �˻��Ͻÿ�
--7. ���� �̸������� �����Ͻÿ�.(��������)
--8. ���� �� �ο����� ���Ͻÿ�
*/
-- �ǽ� ����
--1. ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�
SELECT name, address
FROM customer;

--2. ��� ���� �̸�, �ּ�, ��ȭ��ȣ�� �˻��Ͻÿ�
SELECT name, address, phone
FROM customer;

--3. �ּҰ� '����'�� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE address LIKE '%����%';

--4. ���� �̸��� '�迬��' Ȥ�� ' �Ȼ�' �� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE name in('�迬��', '�Ȼ�');

SELECT * FROM customer
WHERE name = '�迬��' OR name = '�Ȼ�';

--5. �ּҰ� '���ѹα�'�� �ƴ� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE address NOT LIKE '%���ѹα�%';

SELECT * FROM customer
WHERE address <> '%���ѹα�%';  -- ���� ������ �� , �ѱ��� �ȵ�

--6. ��ȭ��ȣ�� ���� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE phone IS NULL;

--7. ���� �̸������� �����Ͻÿ�.(��������)
SELECT * FROM customer
order by name asc;

--8. ���� �� �ο����� ���Ͻÿ�
SELECT COUNT(custid) as ���ο� FROM customer;


