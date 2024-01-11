-- voter 테이블 생성
CREATE TABLE voter(
    vno NUMBER PRIMARY KEY,
    mid VARCHAR2(20),
    bno NUMBER,
    FOREIGN KEY (mid) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (bno) REFERENCES board(bno) ON DELETE CASCADE
);

CREATE SEQUENCE seq_vno NOCACHE;

COMMIT;
SELECT * FROM voter;
SELECT * FROM voter WHERE bno = 1 AND mid = 'today';

INSERT INTO voter(vno, bno, mid) VALUES (seq_vno.NEXTVAL, 1, 'today');

-- 해당 게시글의 총개수
SELECT COUNT(*) FROM voter WHERE bno = 70;

TRUNCATE TABLE voter;

DELETE SEQUENCE seq_vno;
