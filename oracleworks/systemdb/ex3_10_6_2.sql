/*
1. ex3 ���̺� NULL�� ����� �������� ����(10 Byte) col_null, NULL �� ������� �ʴ� �������� ����(10 Byte) col_not_null��
�����Ѵ�.
2. �� (' ', 'hello')�� ('�ȳ�', '')�� �ְ� Ŀ�� �� ��ü ��ȸ�ϱ�
*/
CREATE TABLE ex3_2(
    col_null VARCHAR2(10),
    col_not_null VARCHAR2(10) NOT NULL
);

INSERT INTO ex3_2 VALUES (' ', 'hello');
INSERT INTO ex3_2 VALUES ('�ȳ�',  '');   -- null �� ���� �� ��� ����

COMMIT;

SELECT * FROM ex3_2;
