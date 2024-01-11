/*
1. student ���̺� �����ϱ�
    �й�(PK), �л��̸�(20 byte)(NOT NULL), ����(2 byte)(NOT NULL), ����(6 byte)(NOT NULL), �ּ�(50 byte), �����̸�(30 byte)(FK)
2. �л� ������
    (1001, '�̰�', 22, '����', '����� ������', '����Ʈ�����а�')
    (1002, '�ڴ��', 34, '����', '��õ�� ����', '�������ڰ��а�')
    (1003, '�쿵��', 31, '����', '', '�������ڰ��а�')
    (1003, '���', 29, '����', '����� ���빮��', 'ȸ���а�')
    �� �ִ´�.
3. ��ü �л���ȸ�ϱ�
4. �̸��� �̰��� �л��� �й��� �̸��� ���̸� ��ȸ�ϱ�
5. �̸��� '��'�� �� �л��� ��� ������ ��ȸ�ϱ�
6. ���̰� 30�� �̻��̰� ������ ������ �л��� ��� ������ ��ȸ�ϱ�
7. �ּҰ� ���� �л��� ������ ��ȸ�ϱ�
8. �ּҰ� ���� �л��� �����ϰ� ��ü ��ȸ�ϱ�
9  �ּҿ� ���� ���ڸ� �ְ� ��ü ��ȸ�ϱ�, ������(1003, '�쿵��', 31, '����', ' ','�������ڰ��а�')
10. �ּҰ� ������ �л��� �����ϰ�, �ѹ��ϰ� ��ü ��ȸ�ϱ�
11. �ּҰ� ���� �л��� �����ϱ� �� ���¿��� Ŀ�� �� �ּҰ� NULL�� �����Ϳ� '������ ���뱸' �ְ� ��ü ��ȸ�ϱ�
12. �л��� ���̰� ���� ������ �����ϰ� ��ü ��ȸ�ϱ�
13. �а����� �������ڰ��а��� �л��� ���̰� ���� ������ �����ϰ� ��ü ��ȸ�ϱ�
*/
-- �л� ���̺� ����
CREATE TABLE student(
    snumber NUMBER PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(2)NOT NULL,
    gender  VARCHAR2(6)NOT NULL,
    address VARCHAR2(50),
    mname   VARCHAR2(30) NOT NULL,
    FOREIGN KEY(mname)REFERENCES major(mname)      -- �ܷ�Ű
);

-- �л� �߰�
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1001, '�̰�', 22, '����', '����� ������', '����Ʈ�����а�');
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1002, '�ڴ��', 34, '����', '��õ�� ����', '�������ڰ��а�');
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '�쿵��', 31, '����', '', '�������ڰ��а�');

-- �θ� Ű�� ���� �����ʹ� ���� �̻��� �߻��Ѵ�.
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '���', 29, '����', '����� ���빮��', 'ȸ���а�');  -- ���� �̻�


-- ��ü �л� ��ȸ
SELECT * FROM student;

-- �̸��� �̰��� �л��� �й��� �̸��� ���̸� ��ȸ�ϱ�
SELECT snumber, sname, age FROM student
WHERE sname = '�̰�';

-- �̸��� '��'�� ���Ե� �л��� ��� ������ ����Ͻÿ�
SELECT * FROM student
WHERE sname LIKE '%��%';

-- ���̰� 30�� �̻��̰�, ������ ������ �л��� ��� ������ ����Ͻÿ�
SELECT * FROM student
WHERE age >= 30 AND gender = '����';

-- �ּҰ� ���� �л��� ������ ����Ͻÿ�(IS)
SELECT * FROM student
WHERE address IS NULL;

-- �ּҰ� ���� �л��� ����
DELETE FROM student
WHERE address IS NULL;
SELECT * FROM student;

-- address �� ��ĭ ���(����) ������ �ֱ�
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '�쿵��', 31, '����', ' ', '�������ڰ��а�');
SELECT * FROM student;


-- �ּҰ� ������ �л��� ����(NULL�� �ƴ�)
DELETE FROM student
WHERE address = ' ';
SELECT * FROM student;

-- �ּҰ� NULL �� �����Ϳ� '������ ���뱸'�� �Է��ϱ�
UPDATE student SET address = '������ ���뱸'
WHERE address IS NULL;

-- �����ϱ�(��������-ASC, ��������_DESC)
-- �л��� ���̰� ���� ������ �����Ͽ� ����Ͻÿ�
SELECT * FROM student
ORDER BY age;   -- ASC ����.

-- �����ϱ�(��������-ASC, ��������_DESC)
-- �а����� �������ڰ��а� �л��߿��� ���̰� ���� ������ �����Ͽ� ����Ͻÿ�
SELECT * FROM student
WHERE mname = '�������ڰ��а�'
ORDER BY age DESC; -- ���� �ʰ� ������ ��

-- �ѹ�
ROLLBACK;

-- Ʈ�����(�ѹ��� Ŀ�� �ϱ� ���� �����ϸ� ��Ұ� �ȴ�, ������ ��)
COMMIT;

DROP TABLE student;
