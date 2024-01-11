-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �л��� ��� ���������� �˻��Ͻÿ�
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- �л��� ��� ���������� �˻��Ͻÿ�
-- ��������(JOIN)
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;

-- JOIN ~ USING(Į����) : ���� Į�� �̸��� ���� ���
                        -- ��Ī�� ����� �� ����
SELECT  b.sid,
        subject,
        a.price 
FROM summer_price a JOIN summer_register b
    USING (subject);

-- ���� ������ �հ踦 ���Ͻÿ�
insert into summer_register values(301, 'Python');

select  b.sid,
        b.subject,
        sum(a. price)
from summer_price a, summer_register b
where a.subject = b.subject;

-- ���� ������ �հ�
SELECT  b.subject, 
        SUM(price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- java ������ ������ �հ踦 ���Ͻÿ�
SELECT  b.subject, 
        SUM(price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- ROLLUP(), CUBE()
-- NVL(����, '�Ѱ�') ������ NULL�� �ƴϸ� ������ ����ϰ�, NULL�̸� '�Ѱ�'�� ���
SELECT  NVL(b.subject, '�Ѱ�') ��������, 
        SUM(price) �������հ�
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject                -- �̸��� ���� ���� USING�� �ᵵ ��
GROUP BY ROLLUP(b.subject);




