/*
-- �̺�Ʈ ���̺��� �����Ѵ�
    �̺�Ʈ��ȣ(PK), �̺�Ʈ�̸�(50 byte)(NOT NULL), ������(20 byte)(NOT NULL), ������(20 byte)(NOT NULL)
-- ������ ��ȣ�� �����Ѵ�
-- �̺�Ʈ ������
    (seq_eno.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20')
    (seq_eno.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-25')
    (seq_eno.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30')
    
-- 1. ���� ��¥�� ���� �ϰ� �ִ� �̺�Ʈ �̸�, ���̵�, ��ǰ�ı�, ��ϳ�¥�� ����Ͻÿ�
-- 2. ���� ��¥�� ���� �ϰ� �ִ� �̺�Ʈ �̸�, ���̵�, ��ǰ�ı�, ��ϳ�¥�� ����Ͻÿ�(ǥ�ع�� ������ �̿�)
*/

CREATE TABLE event_2(
    event_no    NUMBER PRIMARY KEY,         -- �̺�Ʈ ��ȣ
    event_name  VARCHAR2(50) NOT NULL,      -- �̺�Ʈ �̸�
    start_date  VARCHAR2(20) NOT NULL,      -- ������
    end_date    VARCHAR2(20) NOT NULL       -- ������
);
-- ������ ����
CREATE SEQUENCE seq_eno_2 NOCACHE;
-- �̺�Ʈ ������
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20');
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-25');
INSERT INTO event_2(event_no, event_name, start_date, end_date)
VALUES(seq_eno_2.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30');
COMMIT;
SELECT * FROM event_2;

-- 1. ���� ��¥�� ���� �ϰ� �ִ� �̺�Ʈ �̸�, ���̵�, ��ǰ�ı�, ��ϳ�¥�� ����Ͻÿ�
SELECT  a.event_name �̺�Ʈ�̸�,
        b.member_id ���̵�,
        b.content ��ǰ�ı�,
        b.regdate ��ϳ�¥
FROM event_2 a, product_review_2 b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

-- 2. ���� ��¥�� ���� �ϰ� �ִ� �̺�Ʈ �̸�, ���̵�, ��ǰ�ı�, ��ϳ�¥�� ����Ͻÿ�(ǥ�ع�� ������ �̿�)
SELECT  a.event_name �̺�Ʈ�̸�,
        b.member_id ���̵�,
        b.content ��ǰ�ı�,
        b.regdate ��ϳ�¥
FROM event_2 a INNER JOIN product_review_2 b
ON b.regdate >= a.start_date AND b.regdate <= a.end_date;


DROP TABLE event_2;
DROP SEQUENCE seq_eno_2;