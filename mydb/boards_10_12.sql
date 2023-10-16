-- 게시판 테이블 생성
CREATE TABLE boards(
    bno       NUMBER PRIMARY KEY,
    btitle    VARCHAR2(100) NOT NULL,
    bcontent  CLOB NOT NULL, -- CLOB(CHARACTER Large Of Byte)
    bwriter   VARCHAR2(50) NOT NULL, 
    bdate     DATE DEFAULT SYSDATE,
    bfilename VARCHAR2(50), 
    bfiledata BLOB -- BLOB(Binary Large Of Byte)
);

-- 시퀀스 생성(NOCACHE - 저장하지 않음, 초기화되면 1부터 시작함, 재시작 해야 하기 때문에 씀)
CREATE SEQUENCE seq_bno NOCACHE;

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '삼성 갤럭시 s21입니다', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '삼성 갤럭시 s21입니다', 'today', 
        SYSDATE, null, null);

COMMIT;

SELECT * FROM boards ORDER BY bno DESC; -- 최신 글이 맨위에 오게...

-- sky123의 게시글
SELECT * FROM boards WHERE bwriter = 'sky123'
ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'cloud'
ORDER BY bno DESC;

-- 글번호 5번의 제목을 '아이폰 15'으로 변경(업데이트)
UPDATE  boards SET btitle = '아이폰 15',
        bcontent = '아이폰 15 제품입니다.'
WHERE bno = 5;

-- 1번 게시글 삭제
DELETE FROM boards
WHERE bno = 1;

SELECT * FROM boards;

ROLLBACK;
DROP TABLE boards;
