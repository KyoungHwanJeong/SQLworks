-- �ڹٿ� ������ ȸ�� ���̺� ����
CREATE TABLE users_2(
    userid      VARCHAR2(20) PRIMARY KEY,
    username    VARCHAR2(30) NOT NULL,
    userpassword VARCHAR2(20) NOT NULL,
    userage     NUMBER(3) NOT NULL,
    useremail   VARCHAR2(50) NOT NULL
);

-- ȸ�� �߰�
INSERT INTO users_2
VALUES ('today', '�����', '12345', 25, 'today@korea.kr');

SELECT userid, username, userpassword, userage, useremail FROM users_2;


SELECT * FROM users_2 WHERE userid = 'today';

COMMIT; -- �ڹٿ��� Ŀ�� ���ϸ� �ȳ��´�

DROP TABLE users_2;