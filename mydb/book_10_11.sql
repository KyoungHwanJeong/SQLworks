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

-- bookmall ����
-- book ���̺� ����
CREATE TABLE book(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(60) NOT NULL,
    publisher   VARCHAR2(60) NOT NULL,
    price       NUMBER NOT NULL
);

-- ���� �ڷ� �߰�
INSERT INTO book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES(6, '����� ����', '�½�����', 7000);
INSERT INTO book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES(10, 'Olympic Champions', 'Person', 13000);

-- ��� ������ �˻��Ͻÿ�
COMMIT;
SELECT * FROM book;

-- ��� ������ ���� ��ȣ�� �̸��� ������ �˻��Ͻÿ�
SELECT bookid, bookname, price FROM book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ�����)
-- DISTINCT�� �ߺ��� �����ִ� ��ɾ�
SELECT DISTINCT publisher FROM book;

-- ������ 20000�� �̸��� ������ �˻��Ͻÿ�(�������� �����ϱ�)
SELECT * FROM book
WHERE price < 20000
ORDER BY price ASC;

-- ������ 10000�� �̻� �̰� 20000�� ������ ������ �˻��Ͻÿ�
-- Į���� BETWEEN A AND B(>=, <=)
SELECT * FROM book
WHERE price >= 10000 AND price <= 20000;

SELECT * FROM book
WHERE price BETWEEN 10000 AND 20000;

--'�౸�� ����'�� �Ⱓ�� ���ǻ�
SELECT publisher FROM book
WHERE bookname = '�౸�� ����';

SELECT publisher FROM book
WHERE bookname LIKE '�౸�� ����';

-- ���� �̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
SELECT bookname, publisher FROM book
WHERE bookname LIKE '%�౸%';

-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE price >= 20000 AND bookname LIKE '%�౸%';

-- ����
-- ������ �̸������� �����Ͻÿ�(��������)
SELECT * FROM book
ORDER BY bookname ASC;

-- ������ ���ݼ����� �˻��Ͻÿ�(��������)
-- ������ ������ �̸��� ������������ �����Ͻÿ�
SELECT * FROM book
ORDER BY price ASC, bookname DESC;

-- ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

-- ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �˻��Ͻÿ�
-- IN() �Լ� ���
SELECT * FROM book
WHERE publisher IN('�½�����', '���ѹ̵��');

-- ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �����ϰ� �˻��Ͻÿ�
-- NOT IN() �Լ� ���
SELECT * FROM book
WHERE publisher NOT IN('�½�����', '���ѹ̵��');


-- ������ 13000���� ������ �˻��Ͻÿ�( =, LIKE)
SELECT * FROM book
WHERE price = 13000
ORDER BY price ASC;

-- ������ 13000���� �ƴ� ������ �˻��Ͻÿ�( <>, NOT LIKE, != )
SELECT * FROM book
WHERE price <> 13000
ORDER BY price ASC;

-- ������ 13000���� �ƴ� ������ �˻��Ͻÿ�( <>, NOT LIKE, != )
SELECT * FROM book
WHERE price != 13000
ORDER BY price ASC;

-- ���� �̸��� '�౸'�� ���Ե��� ���� ���� �̸��� ���ǻ縦 �˻��Ͻÿ�.
SELECT bookname, publisher FROM book
WHERE bookname NOT LIKE '%�౸%';

-- Ʈ������
COMMIT;

DROP TABLE book;
