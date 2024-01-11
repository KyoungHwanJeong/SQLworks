-- jweb, member ���̺� ����
CREATE TABLE member(
    user_no         INT,
    user_id         VARCHAR2(20) NOT NULL UNIQUE,
    user_passwd     VARCHAR2(20) NOT NULL,
    user_name       VARCHAR2(30) NOT NULL,
    user_phone      VARCHAR2(50),
    user_addr       VARCHAR2(50),
    user_joindate   TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(user_no)
);
CREATE SEQUENCE user_no NOCACHE;

INSERT INTO member (user_no, user_id, user_passwd, user_name, user_phone, user_addr)
VALUES(user_no.NEXTVAL, 'khit', 'm1234567!ab', '����ȯ', '010-1234-5678', '����� ���α�');


DROP SEQUENCE user_no;

DROP TABLE member;

SELECT * FROM member;