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
-- 1. �л��� ��� ���������� �˻��Ͻÿ�
SELECT  b.sid,
        a.subject,
        a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 2. �л��� ��� ���������� �˻��Ͻÿ�(���������� �̿��ؼ�)
SELECT  b.sid,
        a.subject,
        a.price
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject;
    
-- 3. �л��� ��� ���������� �˻��Ͻÿ�(�������� USING�� �̿��ؼ�)
SELECT  b.sid,
        subject,
        a.price
FROM summer_price a INNER JOIN summer_register b
    USING (subject);
    
-- 4. ���� ������ �հ踦 ���Ͻÿ�
SELECT b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- 5. ���� ������ �հ踦 ���Ͻÿ�(���������� �̿��ؼ�)
SELECT b.subject, SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject
GROUP BY b.subject;

-- 6. Java ������ ������ �հ踦 ���Ͻÿ�
SELECT b.subject, SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject AND a.subject = 'Java'
GROUP BY b.subject;

-- 7. ����� ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�(NULL�� '�Ѱ�'�� ���)
SELECT NVL(b.subject, '�Ѱ�'), SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- 8. ����� ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�(NULL�� '�Ѱ�'�� ���)(���� ������ �̿��Ͽ�)
SELECT NVL(b.subject, '�Ѱ�'), SUM(a.price)
FROM summer_price a INNER JOIN summer_register b
    ON a.subject = b.subject
GROUP BY ROLLUP(b.subject);

insert into summer_register 
values(301, 'Python');

insert into summer_price 
values('Python', 40000);
