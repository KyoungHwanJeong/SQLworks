/*
1. ex1 ���̺��� colum1, colum2�� �������� ����(10 Byte), �������� ����(10 Byte)�� �����Ѵ�.
2. colum1, colum2�� �� 'abc', 'abc'�� �ְ� '���', '���'�� �ִ´�
3. Ŀ�� �� ��ü ������ ��ȸ�ϱ�.
*/

CREATE TABLE ex1_2(
    colum1 CHAR(10),
    colum2 VARCHAR2(10)
);

INSERT INTO ex1_2(colum1, colum2) VALUES ('abc', 'abc');
INSERT INTO ex1_2 VALUES('���', '���');

-- Ŀ��
COMMIT;

-- ��ü ��ȸ
SELECT colum1, LENGTH(colum1), colum2, LENGTH(colum2) FROM  ex1_2;
