-- addrbook table ����
CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username    VARCHAR2(20) NOT NULL,
    tel         VARCHAR2(20),
    email       VARCHAR2(30) UNIQUE,    -- UNIQUE �� ������ �ߺ��� üũ���ش�
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE;   -- �ڵ� ���� �ֱ�

INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '����ȯ', '010-1234-5678', 'test@test.com', '��');

-- email �ߺ��� üũ�ϱ� ����
INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES(seq_bnum.NEXTVAL, '���̷�', '010-2345-6789', 'test@test.com', '��');

COMMIT;

TRUNCATE TABLE addrbook;

-- �̸����� khit@kh.kr�� �̸��� ã��
SELECT email FROM addrbook
WHERE email = 'khit@kh.kr';
-- �ּ� ����
DELETE FROM addrbook WHERE bnum = 6;
-- �ּ� ����
UPDATE addrbook 
SET username = '�ݰ�', tel='010-6666-7777', gender='��'
WHERE bnum = 5;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;

SELECT * FROM addrbook;