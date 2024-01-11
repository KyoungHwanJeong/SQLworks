-- ���� ó�� �Լ�
CREATE TABLE Mytest(
    class   VARCHAR2(1), -- ��
    name    VARCHAR2(6)  -- �̸�
);

INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('C', '����');
INSERT INTO Mytest VALUES ('C', '����');

CREATE TABLE Mytest2(
    COL1 NUMBER(1)
);

INSERT INTO Mytest2 VALUES (NULL);
INSERT INTO Mytest2 VALUES (0);
INSERT INTO Mytest2 VALUES (NULL);
INSERT INTO Mytest2 VALUES (0);
INSERT INTO Mytest2 VALUES (NULL);


-- ��ü �ο� �� ���
SELECT COUNT(name) ��ü�ο���
FROM Mytest
GROUP BY class;

-- �ݺ� �ο� �� ���
SELECT class, COUNT(name) �ο���
FROM Mytest
GROUP BY class;

-- �ݺ� �ο� �� ���
SELECT class, COUNT(DISTINCT name) �ο���
FROM Mytest
GROUP BY class;

-- DECODE(Į����, ����, ��, ����)�� �̿��� �ο��� ���
SELECT 
        COUNT(DECODE(class, 'A', 1)) A,
        COUNT(DECODE(class, 'B', 1)) B,
        COUNT(DECODE(class, 'C', 1)) C
FROM Mytest;

-- CASE ~ WHEN�� �̿��� �ο� �� ���
SELECT 
    COUNT(CASE WHEN class='A' THEN 1
    END) A,
    COUNT(CASE WHEN class='B' THEN 1
    END) B,
    COUNT(CASE WHEN class='C' THEN 1
    END) C
FROM Mytest;

-- Mytest2 ���� ó��
-- COL1�� �����Ͱ� NULL�̸� -1���� ǥ����
-- DECODE�� ũ�ų� ����(����)�� �ȵȴ� CASE ~ WHEN�� ������
SELECT (DECODE(T.COL1, NULL, -1, T.COL1)) DATA1
FROM Mytest2 T;


-- CASE ~ THEN
-- ��Ī Mytest2 -> T
SELECT 
    DECODE(T.COL1, NULL, -1, T.COL1) DATA1,
    CASE
        WHEN T.COL1 IS NULL THEN -1
        ELSE T.COL1
    END DATA2
FROM Mytest2 T;


COMMIT;
SELECT * FROM Mytest;
SELECT * FROM Mytest2;