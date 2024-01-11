-- �Խ��� ���̺� ����
CREATE TABLE boards(
    bno       NUMBER PRIMARY KEY,
    btitle    VARCHAR2(100) NOT NULL,
    bcontent  CLOB NOT NULL, -- CLOB(CHARACTER Large Of Byte)
    bwriter   VARCHAR2(50) NOT NULL, 
    bdate     DATE DEFAULT SYSDATE,
    bfilename VARCHAR2(50), 
    bfiledata BLOB -- BLOB(Binary Large Of Byte)
);

-- ������ ����(NOCACHE - �������� ����, �ʱ�ȭ�Ǹ� 1���� ������, ����� �ؾ� �ϱ� ������ ��)
CREATE SEQUENCE seq_bno NOCACHE;

-- �Խñ� �߰�
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '�Ｚ ������ s21�Դϴ�', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '�Ｚ ������ s21�Դϴ�', 'today', 
        SYSDATE, null, null);

COMMIT;

SELECT * FROM boards ORDER BY bno DESC; -- �ֽ� ���� ������ ����...

-- sky123�� �Խñ�
SELECT * FROM boards WHERE bwriter = 'sky123'
ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'cloud'
ORDER BY bno DESC;

-- �۹�ȣ 5���� ������ '������ 15'���� ����(������Ʈ)
UPDATE  boards SET btitle = '������ 15',
        bcontent = '������ 15 ��ǰ�Դϴ�.'
WHERE bno = 5;

-- 1�� �Խñ� ����
DELETE FROM boards
WHERE bno = 1;

SELECT * FROM boards;

ROLLBACK;
DROP TABLE boards;