/*
1. ex3 ���̺� NULL�� ����� �������� ����(10 Byte) col_null, NULL �� ������� �ʴ� �������� ����(10 Byte) col_not_null��
�����Ѵ�.
2. �� (' ', 'hello')�� ('�ȳ�', '')�� �ְ� Ŀ�� �� ��ü ��ȸ�ϱ�
*/
-- ex3 ���̺� ����
CREATE TABLE ex3(
    col_null VARCHAR2(10),  -- NULL ���.
    col_not_null VARCHAR2(10) NOT NULL  -- NULL ����.

);
INSERT INTO ex3 VALUES(' ', 'hello');
INSERT INTO ex3 VALUES('�ȳ�', '');   -- null ����(null�� ���� �� ����)

COMMIT;

SELECT * FROM ex3;

DROP TABLE ex3;