-- USER ���� 
DROP USER c##sample;

-- USER ���� ���� �����ͱ��� ����
DROP USER c##sample CASCADE;

-- ���ο� �����(user) ����
CREATE USER c##mydb IDENTIFIED BY pwmydb;

--  ����(������ ����)�� ������ ���� �ο�
GRANT CREATE SESSION TO c##mydb;

-- ���̺�, �ڿ�(resource) ������ ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##mydb;

-- DBA�� ����(����)�� ���� �ο�
GRANT CONNECT, DBA TO c##mydb;
