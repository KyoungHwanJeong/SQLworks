-- board ���̺� ����
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
VALUES (seq_bno.NEXTVAL, '������1', '�۳���1�Դϴ�.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������2', '�۳���2�Դϴ�.', 'cloud');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������3', '�۳���3�Դϴ�.', 'today');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������4', '�۳���4�Դϴ�.', 'cloud');

-- ��� ����
INSERT INTO board (bno, title, content, id)
(SELECT seq_bno.NEXTVAL, title, content, id FROM board);

-- ������ ó��
-- ROWNUM �� 1������ ����Ѵ�
SELECT ROWNUM, board.*
FROM board
WHERE ROWNUM >= 11 AND ROWNUM <= 20;    -- ROWNUM �� �ݵ�� 1�� �����ؼ� �˻��ؾ� �ȴ�

-- ������ ó��(����������)
SELECT *
FROM (SELECT ROWNUM RN, board.* 
        FROM board ORDER BY bno DESC)
WHERE RN >= 11 AND RN <= 20;

-- ������ ó��(���������� - 2�ܰ�� �˻�) -- bo ��Ī ����
-- ��Ī board = bo �� �����Ѵ�
SELECT *
FROM (SELECT ROWNUM RN, bo.* 
        FROM(SELECT * FROM board ORDER BY bno DESC) bo)
WHERE RN >= 11 AND RN <= 20;

-- ��ü �Խñ� ��
SELECT COUNT(*) AS total FROM board;

-- ���ڿ� �˻�(����, ���̵�)
SELECT * FROM board
--WHERE title LIKE '%2%';
WHERE id LIKE 'today';

-- �Խñ� 3�� ����
DELETE FROM board;

-- �Խñ� ����: �� ��ȣ�� 7���� �Խñ��� ������ '�������� ����', ������ '�������� �����Դϴ�.' �� ����
UPDATE board SET title = '�������� ����', content='�������� �����Դϴ�'
WHERE bno = 7;

-- ��ȣ�� 8���� �Խñ��� ��ȸ���� 1����(����)
UPDATE board SET hit = hit + 1
WHERE bno=6;

-- ��ȣ�� 1���� �Խñ��� ��� ���� ��������

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