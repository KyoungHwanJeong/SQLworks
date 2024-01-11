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
-- event ���̺� ����
CREATE TABLE event(
    event_no    NUMBER PRIMARY KEY,         -- �̺�Ʈ ��ȣ
    event_name  VARCHAR2(50) NOT NULL,      -- �̺�Ʈ �̸�
    start_date  VARCHAR2(20) NOT NULL,      -- ������
    end_date    VARCHAR2(20) NOT NULL       -- ������
);

-- �ڵ� �Ϸù�ȣ
CREATE SEQUENCE seq_eno NOCACHE;

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-25');
INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES(seq_eno.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30');

COMMIT;
SELECT * FROM event;

-- �̺�Ʈ �Ⱓ ���ȿ� ���並 �ۼ��� ������ ����ǰ�� �ִ� ���
-- �������̺�� �̺�Ʈ ���̺� ����
-- �ϴ��(�̺�Ʈ�� ����)
-- �񵿵����� NON EQ(>=, <=, between and)
select  a.event_name �̺�Ʈ�̸�,
        b.member_id ���̵�,
        b.content ��ǰ�ı�,
        b.regdate ��ϳ�¥
from event a, product_review b
where b.regdate 
    between a.start_date and a.end_date;
    
-- ��������
select  a.event_name �̺�Ʈ�̸�,
        b.member_id ���̵�,
        b.content ��ǰ�ı�,
        b.regdate ��ϳ�¥
from event a INNER JOIN product_review b
--ON b.regdate
--    between a.start_date and a.end_date;
ON b.regdate >= a.start_date and b.regdate <= a.end_date;    


-- ���迡 ������ 2���� ��� ����!
