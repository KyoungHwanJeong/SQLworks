/*
1. ex1 ���̺��� colum1, colum2�� �������� ����(10 Byte), �������� ����(10 Byte)�� �����Ѵ�.
2. colum1, colum2�� �� 'abc', 'abc'�� �ְ� '���', '���'�� �ִ´�
3. Ŀ�� �� ��ü ������ ��ȸ�ϱ�.
*/
-- ��Ű��:system
-- ���̺�
CREATE TABLE ex1(
    colum1 CHAR(10),    -- �������� ����(10 Byte)
    colum2 VARCHAR2(10) -- �������� ����(10 Byte)
);

-- ������ �߰�
INSERT INTO ex1(colum1, colum2) VALUES ('abc', 'abc');  -- SQL�� ' '�� ����
INSERT INTO ex1 VALUES ('���', '���');

-- ������ ��ȸ
SELECT colum1, LENGTH(colum1),colum2 ,LENGTH(colum2) FROM ex1;  -- LENGTH()�Լ�: colum�� ����.

-- Ʈ�����(������ ����ȭ, �ӽ�����) : COMMIT, ROLLBACK
COMMIT;

DROP TABLE ex1;