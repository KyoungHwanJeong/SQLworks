/*
���� �����б� ���̺�
-- 1. �л��� ��� ���������� �˻��Ͻÿ�
-- 2. �л��� ��� ���������� �˻��Ͻÿ�(���������� �̿��ؼ�)
-- 3. �л��� ��� ���������� �˻��Ͻÿ�(�������� USING�� �̿��ؼ�)
-- 4. ���� ������ �հ踦 ���Ͻÿ�
-- 5. ���� ������ �հ踦 ���Ͻÿ�(���������� �̿��ؼ�)
-- 6. java ������ ������ �հ踦 ���Ͻÿ�
-- 7. ����� ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�(NULL�� '�Ѱ�'�� ���)
-- 8. ����� ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�(NULL�� '�Ѱ�'�� ���)(���� ������ �̿��Ͽ�)
*/
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
-- JOIN ~ ON
SELECT  b.sid,
        b.subject,
        a.price
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;

-- �л��� ��� ���������� �˻��Ͻÿ�
-- JOIN ~ USING(Į����) : ���� Į�� �̸��� ���� ���
                        -- ��Ī�� ����� �� ����
SELECT  b.sid,
        subject,
        a.price 
FROM summer_price a JOIN summer_register b
    USING (subject);

-- ���� ������ �հ踦 ���Ͻÿ�
SELECT  b.subject,
        sum(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- ���� ������ �հ踦 ���Ͻÿ�(���������� �̿��ؼ�)
SELECT  b.subject, 
        SUM(a.price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- java ������ ������ �հ踦 ���Ͻÿ�
SELECT  b.subject, 
        SUM(a.price)
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- ����� ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- ROLLUP(), CUBE()
-- NVL(����, '�Ѱ�') ������ NULL�� �ƴϸ� ������ ����ϰ�, NULL�̸� '�Ѱ�'�� ���
SELECT  NVL(b.subject, '�Ѱ�') ��������, 
        SUM(a.price) �������հ�
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- ���������� �̿��Ͽ�
SELECT  NVL(b.subject, '�Ѱ�') ��������, 
        SUM(a.price) �������հ�
FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject                -- �̸��� ���� ���� USING�� �ᵵ ��
GROUP BY ROLLUP(b.subject);

insert into summer_register 
values(301, 'Python');

insert into summer_price 
values('Python', 40000);


