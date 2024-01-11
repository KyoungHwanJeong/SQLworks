/*
1. ex2 ���̺� ��¥ �ڷ��� col_date, ��¥�� �ð� �ڷ��� col_timestamp�� �����Ѵ�.
2. ���� ��¥�� �ð��� �ִ´�(SYSDATE, SYSTIMESTAMP)
3. Ŀ�� �� ��ü ������ ��ȸ�ϱ�
4. ���� ���� ����(20 Byte)�� �Ի���(hire_date) Į���� �߰��ϰ� '2023-09-01'�� �ְ� Ŀ�� �� ��ü ������ ��ȸ�ϱ�
*/
CREATE TABLE ex2_2(
    col_date DATE,
    col_timestamp TIMESTAMP
);

INSERT INTO ex2_2 VALUES(SYSDATE, SYSTIMESTAMP);

COMMIT;

SELECT * FROM ex2_2;

ALTER TABLE ex2_2 ADD hire_date VARCHAR2(20);

INSERT INTO ex2_2 (hire_date) VALUES('2023-09-01');

COMMIT;
SELECT *FROM ex2_2;

