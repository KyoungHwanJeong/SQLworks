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
VALUES (seq_cno.NEXTVAL, '글제목1', '글내용1입니다.', 'khit');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '글제목2', '글내용2입니다.', 'cloud');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '글제목3', '글내용3입니다.', 'today');
INSERT INTO community (cno, title, content, id)
VALUES (seq_cno.NEXTVAL, '글제목4', '글내용4입니다.', 'cloud');

SELECT * FROM board
ORDER BY hit DESC;


DROP SEQUENCE seq_cno;

DROP TABLE community;

COMMIT;

SELECT * FROM community;