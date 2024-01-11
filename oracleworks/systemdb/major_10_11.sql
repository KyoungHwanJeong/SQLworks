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
-- �б� �����ͺ��̽� ����
-- �а� ���̺� ����
CREATE TABLE major(
    mname   VARCHAR2(20) PRIMARY KEY,
    mphone  VARCHAR2(20) NOT NULL,  -- �ʼ� �Է�
    location VARCHAR2(30) NOT NULL
);

-- �а� �߰�
INSERT INTO major(mname, mphone, location)
VALUES('����Ʈ�����а�', '02-1234-5678', 'B�� 3��');
INSERT INTO major(mname, mphone, location)
VALUES('ȭ�а��а�', '02-2222-7777', 'B�� 4��');
INSERT INTO major(mname, mphone, location)
VALUES('�������ڰ��а�', '02-4444-7777', 'B�� 5��');

-- �а��� �ڷ��� ũ�� ����
ALTER TABLE major MODIFY mname VARCHAR2(30);

-- ��ü ������ ��ȸ
SELECT * FROM major;

-- ��Ī(as)�� �����ְ� �а���� ��ȭ��ȣ�� ���(��Ī�� ��� �� �� as�� ���)
SELECT mname AS �а���, mphone AS ��ȭ��ȣ FROM major;

-- Ʈ������
COMMIT;
