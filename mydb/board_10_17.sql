--자바 게시판 구현할 board 테이블 생성
CREATE TABLE board(
    bno       NUMBER PRIMARY KEY,
    btitle    VARCHAR2(100) NOT NULL,
    bcontent  CLOB NOT NULL, -- CLOB(CHARACTER Large Of Byte)
    bwriter   VARCHAR2(50) NOT NULL, 
    bdate     DATE DEFAULT SYSDATE
);
CREATE SEQUENCE seq NOCACHE;

INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다.', 'today10');
INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다.', 'admin0000');

SELECT * FROM board
ORDER BY bno DESC;

COMMIT;