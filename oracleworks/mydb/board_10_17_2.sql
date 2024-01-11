--자바 게시판 구현할 board 테이블 생성
CREATE TABLE board2(
    bno       NUMBER PRIMARY KEY,
    btitle    VARCHAR2(100) NOT NULL,
    bcontent  CLOB NOT NULL, -- CLOB(CHARACTER Large Of Byte)
    bwriter   VARCHAR2(50) NOT NULL, 
    bdate     DATE DEFAULT SYSDATE
);
CREATE SEQUENCE seq2 NOCACHE;

INSERT INTO board2(bno, btitle, bcontent, bwriter)
VALUES (seq2.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다.', 'today10');
INSERT INTO board2(bno, btitle, bcontent, bwriter)
VALUES (seq2.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다.', 'admin0000');

ALTER SEQUENCE seq2 INCREMENT BY 1;

SELECT * FROM board2
ORDER BY bno DESC;

SELECT * FROM board2
WHERE bno = 1;

UPDATE board2 SET btitle = '가입인사2', bcontent = '안녕하세요', bwriter = 'sky123'
WHERE bno = 2;

DELETE FROM board2
WHERE bno = 1;

TRUNCATE TABLE board2;

SELECT bno, btitle FROM board2;

DROP SEQUENCE seq2;
DROP TABLE board2;

COMMIT;
ROLLBACK;