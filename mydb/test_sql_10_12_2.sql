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
--1. ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�
SELECT name, address
FROM customer_2;

--2. ��� ���� �̸�, �ּ�, ��ȭ��ȣ�� �˻��Ͻÿ�
SELECT name, address, phone
FROM customer_2;

--3. �ּҰ� '����'�� ���� �˻��Ͻÿ�
SELECT * FROM customer_2
WHERE address LIKE '%����%';

--4. ���� �̸��� '�迬��' Ȥ�� ' �Ȼ�' �� ���� �˻��Ͻÿ�
SELECT * FROM customer_2
WHERE name IN('�迬��', '�Ȼ�');

SELECT * FROM customer_2
WHERE name LIKE '�迬��' OR name LIKE '�Ȼ�';

--5. �ּҰ� '���ѹα�'�� �ƴ� ���� �˻��Ͻÿ�
SELECT * FROM customer_2
WHERE address NOT LIKE '%���ѹα�%';

--6. ��ȭ��ȣ�� ���� ���� �˻��Ͻÿ�
SELECT * FROM customer_2
WHERE phone IS NULL;

--7. ���� �̸������� �����Ͻÿ�.(��������)
SELECT * FROM customer_2
ORDER BY name ASC;

--8. ���� �� �ο����� ���Ͻÿ�
SELECT COUNT(custid) AS ���ο��� FROM customer_2;