/*
�б� ������ ���̽�
1. major ���̺� �����̸�(PK)(20 byte), ��ȭ��ȣ(20 byte)(NOT NULL), ��ġ(20 byte)(NOT NULL)�� �����Ѵ�.
2. �а� ������
    ('����Ʈ�����а�', '02-1234-5678', 'B�� 3��')
    ('ȭ�а��а�', '02-2222-7777', 'B�� 4��')
    ('�������ڰ��а�', '02-4444-7777', 'B�� 5��')
    �� �ִ´�.
3. �а��� �ڷ��� ũ�⸦ 30 byte�� �����ϰ� �����͸� �ٽ� �ִ´�. 
4. ��ü �����͸� ��ȸ�ϱ�
5. '�а���', '��ȭ��ȣ'�� ��Ī�� �����ְ� ��ü �����͸� ��ȸ�ϱ�
*/
CREATE TABLE major_2(
    majorname   VARCHAR2(20) PRIMARY KEY,
    majornumber VARCHAR2(20) NOT NULL,
    location    VARCHAR2(20) NOT NULL
);

INSERT INTO major_2(majorname, majornumber, location)
VALUES('����Ʈ�����а�', '02-1234-5678', 'B�� 3��');
INSERT INTO major_2(majorname, majornumber, location)
VALUES('ȭ�а��а�', '02-2222-7777', 'B�� 4��');
INSERT INTO major_2(majorname, majornumber, location)
VALUES('�������ڰ��а�', '02-4444-7777', 'B�� 5��');

ALTER TABLE major_2 MODIFY majorname VARCHAR2(30);

SELECT * FROM major_2;

COMMIT;
SELECT majorname AS �а���, majornumber AS ��ȭ��ȣ FROM major_2;
