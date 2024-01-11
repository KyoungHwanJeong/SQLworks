-- voter ���̺� ����
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

-- �ش� �Խñ��� �Ѱ���
SELECT COUNT(*) FROM voter WHERE bno = 70;

TRUNCATE TABLE voter;

DELETE SEQUENCE seq_vno;
