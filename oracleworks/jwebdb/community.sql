CREATE TABLE community(
    cno         NUMBER PRIMARY KEY,
    title       VARCHAR2(100) NOT NULL,
    content     CLOB NOT NULL,
    createdate  TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate  TIMESTAMP,
    hit         NUMBER DEFAULT 0,
    filename    VARCHAR2(50),
    id          VARCHAR2(20) NOT NULL,
    replycnt    NUMBER DEFAULT 0,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_cno NOCACHE;

INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '������1', '�۳���1�Դϴ�.', 'khit');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '������2', '�۳���2�Դϴ�.', 'cloud');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '������3', '�۳���3�Դϴ�.', 'today');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '������4', '�۳���4�Դϴ�.', 'cloud');

SELECT * FROM board
ORDER BY hit DESC;


DROP SEQUENCE seq_cno;

DROP TABLE community;

COMMIT;

SELECT * FROM community;