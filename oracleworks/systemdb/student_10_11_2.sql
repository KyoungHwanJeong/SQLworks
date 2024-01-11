/*
1. student ���̺� �����ϱ�
    �й�(PK), �л��̸�(20 byte)(NOT NULL), ����(2 byte)(NOT NULL), ����(6 byte)(NOT NULL), �ּ�(50 byte), �����̸�(30 byte)(FK)(NOT NULL)
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
7. Ŀ�� �ϰ�, �ּҰ� ���� �л��� ������ ��ȸ�ϱ�
8. �ּҰ� ���� �л��� �����ϰ� ��ü ��ȸ�ϱ�
9  �ּҿ� ���� ���ڸ� �ְ� ��ü ��ȸ�ϱ�, ������(1003, '�쿵��', 31, '����', ' ','�������ڰ��а�')
10. �ּҰ� ������ �л��� �����ϰ�, �ѹ��ϰ� ��ü ��ȸ�ϱ�
11. �ּҰ� ���� �л��� �����ϱ� �� ���¿��� Ŀ�� �� �ּҰ� NULL�� �����Ϳ� '������ ���뱸' �ְ� ��ü ��ȸ�ϱ�
12. �л��� ���̰� ���� ������ �����ϰ� ��ü ��ȸ�ϱ�
13. �а����� �������ڰ��а��� �л��� ���̰� ���� ������ �����ϰ� ��ü ��ȸ�ϱ�
*/
CREATE TABLE student_2(
    stuid   NUMBER PRIMARY KEY,                     -- PK
    stuname VARCHAR2(20) NOT NULL,
    age     NUMBER(2) NOT NULL,
    gender  VARCHAR2(6) NOT NULL,
    stuaddress VARCHAR(50),
    majorname VARCHAR2(30) NOT NULL,
    FOREIGN KEY(majorname) REFERENCES major_2       -- FK
);

INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES (1001, '�̰�', 22, '����', '����� ������', '����Ʈ�����а�');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1002, '�ڴ��', 34, '����', '��õ�� ����', '�������ڰ��а�');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '�쿵��', 31, '����', '','�������ڰ��а�');
INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '���', 29, '����', '����� ���빮��', 'ȸ���а�');                   -- ���Ἲ �������ǿ� ����

COMMIT;
SELECT * FROM student_2;

SELECT stuid, stuname, age
FROM student_2
WHERE stuname = '�̰�';

SELECT * FROM student_2
WHERE stuname LIKE '%��%';

SELECT * FROM student_2
WHERE age >= 30 AND gender = '����';

SELECT * FROM student_2
WHERE stuaddress IS NULL;

COMMIT;
DELETE FROM student_2
WHERE stuaddress IS NULL;
SELECT * FROM student_2;

INSERT INTO student_2(stuid, stuname, age, gender, stuaddress, majorname)
VALUES(1003, '�쿵��', 31, '����', ' ', '�������ڰ��а�');
SELECT * FROM student_2;

DELETE FROM student_2
WHERE stuaddress = ' ';
SELECT * FROM student_2;

ROLLBACK;
SELECT * FROM student_2;

UPDATE student_2 SET stuaddress = '������ ���뱸'
WHERE stuaddress IS NULL;
SELECT * FROM student_2;

SELECT * FROM student_2
ORDER BY age ASC;

SELECT * FROM student_2
WHERE majorname = '�������ڰ��а�'
ORDER BY age DESC;




