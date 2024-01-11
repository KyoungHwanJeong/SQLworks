/*
bookmall �����ϱ�
1. book ���̺� �����ϱ�
    å ���̵�(PK), å �̸�(60 byte)(NOT NULL), ���ǻ�(60 byte)(NOT NULL), ����(NOT NULL)
2. ���� �ڷ� ������
    (1, '�౸�� ����', '�½�����', 7000)
    (2. '�౸�ƴ� ����', '������', 13000)
    (3. '�౸�� ����', '���ѹ̵��', 22000)
    (4. '���� ���̺�', '���ѹ̵��', 35000)
    (5. '�ǰ� ����', '�½�����', 8000)
    (6. '����� ����', '�½�����', 7000)
    (7. '�߱��� �߾�', '�̻�̵��', 20000)
    (8. '�߱��� ��Ź��', '�̻�̵��', 13000)
    (9. '�ø��� �̾߱�', '�Ｚ��', 7500)
    (10. 'Olympic Champions', 'Person', 13000)
    �� �߰��Ѵ�.
3. Ŀ�� �� ��� ������ ����ϱ�.
4. ��� ������ ���� ��ȣ�� �̸��� ������ �˻��ϱ�.
5. ���� ���̺� �ִ� ��� ���ǻ縦 �˻��ϱ�(�ߺ� ����)
6. ������ 20000�� �̸��� ������ �˻��Ͻÿ�(��������)
7. ������ 10000�� �̻��̰�, 20000�� ������ ������ �˻��Ͻÿ�(BETWEEN)
8. '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
9. ���� �̸��� '�౸'�� ���Ե� å�� ���ǻ縦 �˻��Ͻÿ�
10. '�౸'�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
11. ������ �̸������� �����Ͻÿ�(��������)
12. ������ ���ݼ����� �����Ͻÿ�(��������), ������ ������ �̸��� ������������ �����Ͻÿ�
13. ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �˻��Ͻÿ�(IN �Լ�)
14. ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �����ϰ� �˻��Ͻÿ�(NOT IN �Լ�)
15. ������ 13000���� ������ �˻��Ͻÿ�
16. ������ 13000���� �ƴ� ������ �˻��Ͻÿ�
17. ���� �̸��� '�౸'�� ���Ե��� ���� ���� �̸��� ���ǻ縦 �˻��Ͻÿ�
*/

-- 1. book ���̺� �����ϱ�
CREATE TABLE book_2(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(60) NOT NULL,
    publisher   VARCHAR2(60) NOT NULL,
    price       NUMBER NOT NULL
);
-- 2. ���� �ڷ� ������
INSERT INTO book_2 VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book_2 VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book_2 VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book_2 VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book_2 VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book_2 VALUES(6, '����� ����', '�½�����', 7000);
INSERT INTO book_2 VALUES(7, '�߱��� �߾�', '�̻�̵��', 13000);
INSERT INTO book_2 VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book_2 VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book_2 VALUES(10, 'Olympic Champions', 'Person', 13000);

-- 3. Ŀ�� �� ��� ������ ����ϱ�.
COMMIT;
SELECT * FROM book_2;

-- 4. ��� ������ ���� ��ȣ�� �̸��� ������ �˻��ϱ�.
SELECT bookid, bookname, price FROM book_2;

-- 5. ���� ���̺� �ִ� ��� ���ǻ縦 �˻��ϱ�(�ߺ� ����)
SELECT DISTINCT publisher FROM book_2;

-- 6. ������ 20000�� �̸��� ������ �˻��Ͻÿ�(��������)
SELECT * FROM book_2
WHERE price < 20000;

-- 7. ������ 10000�� �̻��̰�, 20000�� ������ ������ �˻��Ͻÿ�(BETWEEN)
SELECT * FROM book_2
WHERE price BETWEEN 10000 AND 20000;

-- 8. '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher FROM book_2
WHERE bookname = '�౸�� ����';

SELECT publisher FROM book_2
WHERE bookname LIKE '�౸�� ����';

-- 9. ���� �̸��� '�౸'�� ���Ե� å�� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher FROM book_2
WHERE bookname LIKE '%�౸%';

-- 10. '�౸'�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
SELECT * FROM book_2
WHERE bookname LIKE '%�౸%' AND price >= 20000;

-- 11. ������ �̸������� �����Ͻÿ�(��������)
SELECT * FROM book_2
ORDER BY bookname ASC;

-- 12. ������ ���ݼ����� �����Ͻÿ�(��������), ������ ������ �̸��� ������������ �����Ͻÿ�
SELECT * FROM book_2
ORDER BY price ASC, bookname DESC;

-- 13. ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �˻��Ͻÿ�(IN �Լ�)
SELECT * FROM book_2
WHERE publisher IN('�½�����', '���ѹ̵��');

SELECT * FROM book_2
WHERE publisher LIKE '�½�����' OR publisher LIKE '���ѹ̵��';

-- 14. ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �����ϰ� �˻��Ͻÿ�(NOT IN �Լ�)
SELECT * FROM book_2
WHERE publisher NOT IN('�½�����', '���ѹ̵��');

-- 15. ������ 13000���� ������ �˻��Ͻÿ�
SELECT * FROM book_2
WHERE price = 13000;

SELECT * FROM book_2
WHERE price LIKE 13000;

-- 16. ������ 13000���� �ƴ� ������ �˻��Ͻÿ�
SELECT * FROM book_2
WHERE price != 13000;

SELECT * FROM book_2
WHERE price NOT LIKE 13000;

-- 17. ���� �̸��� '�౸'�� ���Ե��� ���� ���� �̸��� ���ǻ縦 �˻��Ͻÿ�
SELECT bookname, publisher FROM book_2
WHERE bookname NOT LIKE '%�౸%';

DROP TABLE book_2;
