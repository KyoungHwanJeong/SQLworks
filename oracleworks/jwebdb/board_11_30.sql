-- board 테이블 생성
CREATE TABLE board(
    bno         NUMBER PRIMARY KEY,
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

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목1', '글내용1입니다.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목2', '글내용2입니다.', 'cloud');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목3', '글내용3입니다.', 'today');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목4', '글내용4입니다.', 'cloud');

-- 재귀 복사
INSERT INTO board (bno, title, content, id)
(SELECT seq_bno.NEXTVAL, title, content, id FROM board);

-- 페이지 처리
-- ROWNUM 은 1번부터 출력한다
SELECT ROWNUM, board.*
FROM board
WHERE ROWNUM >= 11 AND ROWNUM <= 20;    -- ROWNUM 은 반드시 1을 포함해서 검색해야 된다

-- 페이지 처리(서브쿼리로)
SELECT *
FROM (SELECT ROWNUM RN, board.* 
        FROM board ORDER BY bno DESC)
WHERE RN >= 11 AND RN <= 20;

-- 페이지 처리(서브쿼리로 - 2단계로 검색) -- bo 별칭 생성
-- 별칭 board = bo 를 생성한다
SELECT *
FROM (SELECT ROWNUM RN, bo.* 
        FROM(SELECT * FROM board ORDER BY bno DESC) bo)
WHERE RN >= 11 AND RN <= 20;

-- 전체 게시글 수
SELECT COUNT(*) AS total FROM board;

-- 문자열 검색(제목, 아이디)
SELECT * FROM board
--WHERE title LIKE '%2%';
WHERE id LIKE 'today';

-- 게시글 3번 삭제
DELETE FROM board;

-- 게시글 수정: 글 번호가 7번인 게시글의 제목을 '공지사항 수정', 내용을 '공지사항 수정입니다.' 로 변경
UPDATE board SET title = '공지사항 수정', content='공지사항 수정입니다'
WHERE bno = 7;

-- 번호가 8번인 게시글의 조회수를 1증가(변경)
UPDATE board SET hit = hit + 1
WHERE bno=6;

-- 번호가 1번인 게시글의 댓글 수를 가져오기

SELECT COUNT(rno)
FROM reply
WHERE bno=2;

UPDATE board SET replycnt = (SELECT count(rno) FROM reply WHERE bno = 1)
WHERE bno = 1;

SELECT * FROM board
ORDER BY hit DESC;


DROP SEQUENCE seq_bno;

DROP TABLE board;

COMMIT;

SELECT * FROM board;