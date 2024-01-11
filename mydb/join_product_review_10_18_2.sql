/*
-- 1. ���䰡 �ִ� ��ǰ�� ����(�����ȣ,��ǰ�ڵ�,��ǰ�̸�,���䳻��,�ۼ���)�� �˻��Ͻÿ�
-- 2. ���䰡 �ִ� ��ǰ�� ����(�����ȣ,��ǰ�ڵ�,��ǰ�̸�,���䳻��,�ۼ���)�� �˻��Ͻÿ�(���� ������ �̿��ؼ�)
-- 3. ������ ������ ������� ��� ��ǰ�� ������ �˻��Ͻÿ�
-- 4. ���䰡 ���� ��ǰ�� ����(�̸�, ��������)�� �˻��Ͻÿ�
-- 5. ��ǰ ���� ���̺� product_name Į���� �߰��ؼ� ����Ͻÿ�(��Į�� ���������� �̿��ؼ�)
*/
-- 1. ���䰡 �ִ� ��ǰ�� ����(�����ȣ,��ǰ�ڵ�,��ǰ�̸�,���䳻��,�ۼ���)�� �˻��Ͻÿ�
SELECT  b.review_no, 
        a.product_code, 
        a.product_name, 
        b.content, 
        b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

SELECT  a.product_code,
        a.product_name,
        a.price,
        b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 2. ���䰡 �ִ� ��ǰ�� ����(�����ȣ,��ǰ�ڵ�,��ǰ�̸�,���䳻��,�ۼ���)�� �˻��Ͻÿ�(���� ������ �̿��ؼ�)
SELECT  b.review_no,
        a.product_code,
        a.product_name,
        b.content,
        b.regdate
FROM product a INNER JOIN product_review b
    ON a.product_code = b.product_code;
    
-- 3. ������ ������ ������� ��� ��ǰ�� ������ �˻��Ͻÿ�
SELECT  b.review_no,
        a.product_code,
        a.product_name,
        b.content,
        b.regdate
FROM product a LEFT OUTER JOIN product_review b
    ON a.product_code = b.product_code;

-- 4. ���䰡 ���� ��ǰ�� ����(�̸�, ��������)�� �˻��Ͻÿ�
SELECT  a.product_name,
        b.content
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- 5. ��ǰ ���� ���̺� product_name Į���� �߰��ؼ� ����Ͻÿ�(��Į�� ���������� �̿��ؼ�)
SELECT  A.review_no,
        A.product_code,
        (SELECT B.product_name
        FROM product B
        WHERE A.product_code = B.product_code) product_name,
        A.member_ID,
        A.content,
        A.regdate
FROM product_review A;
