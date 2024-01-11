/*
1. ex4 ���̺� ����Ű(PRIMARY KEY) id(10 Byte)�� NULL ���� ������ �ʴ� passwd(10 Byte)�� �����Ѵ�.
2. ��   ('sky2003', 'u1234')
        ('sky2003', 'u54321')
        ('today123', 'u2345')�� �ְ� ����ϱ�
3. ���� age Į��(3 Byte)�� �߰��ϰ�, ��('today321', 'u2345', 25)�� �ְ� ����ϱ�
4. �н����� �ڷ����� ũ�⸦ 10 -> 12 Byte�� �����ϰ� �� ('today3210', 'u2345678910', 23)�� �ְ� ����ϱ�
*/

CREATE TABLE ex4_2(
    id VARCHAR2(10) PRIMARY KEY,
    passwd VARCHAR2(10) NOT NULL
);

INSERT INTO ex4_2 VALUES ('sky2003', 'u1234');
INSERT INTO ex4_2 VALUES ('sky2003', 'u54321');     -- ���Ἲ �������� ����
INSERT INTO ex4_2 VALUES ('today123', 'u2345');

COMMIT;
SELECT * FROM ex4_2;

ALTER TABLE ex4_2 ADD age NUMBER(3);
INSERT INTO ex4_2 VALUES ('today321', 'u2345', 25);
COMMIT;
SELECT * FROM ex4_2;

ALTER TABLE ex4_2 MODIFY passwd VARCHAR2(12);
INSERT INTO ex4_2 VALUES ('today3210', 'u2345678910', 23);
COMMIT;
SELECT * FROM ex4_2;