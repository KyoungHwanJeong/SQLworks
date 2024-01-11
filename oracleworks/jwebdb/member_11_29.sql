-- jweb, member ���̺� ����
CREATE TABLE member(
    mno         INT,
    id          VARCHAR2(20) NOT NULL UNIQUE,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    email       VARCHAR2(50),
    gender      VARCHAR2(6),
    joindate    TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);
CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member (mno, id, passwd, name, email, gender)
VALUES(seq_mno.NEXTVAL, 'khit', 'm1234567!ab', '����ȯ', 'khit@gmail.com', '��');

-- id�� 'khit'�� ȸ���� ����
SELECT * FROM member WHERE id = 'khit';

-- id�� passwd�� ��ġ�ϴ� ȸ�� ã��
SELECT * FROM member 
WHERE id = 'khit' AND passwd='m1234567';

SELECT * FROM member ORDER BY mno;

-- result �� ��Ī������ Į�� ������ �Ѵ�
SELECT COUNT(*) as result
FROM member WHERE id = 'khit';

-- ���̵� ������(���̵��� ������ 1�̸� true), 1�� �ƴϸ� false�� ����ϱ�
SELECT DECODE(COUNT(*), 1, 'true', 'false') AS result
FROM member WHERE id = 'khit';

COMMIT;
SELECT * FROM member;

DROP SEQUENCE seq_mno;

DROP TABLE member;
