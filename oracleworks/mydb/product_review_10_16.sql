/*
-- product_review ���̺��� �����Ѵ�
    �����ȣ(PK), ��ǰ�ڵ�(6 byte)(NOT NULL), ȸ�����̵�(20 byte)(NOT NULL), ���䳻��(CLOB)(NOT NULL),
    �ۼ���(DATE DEFALUT)
    ��ǰ�ڵ�� �ܷ�Ű�̴�
-- ������ seq_rno �� ĳ�� �������� �����Ѵ�
-- ���� ������
    (seq_rno.NEXTVAL, '100001', 'today10', '�������ε� ������ ���� �ִ� ��...')
    (seq_rno.NEXTVAL, '100002', 'cloud100', '�����̶� ���� ���ϳ׿�!')
    (seq_rno.NEXTVAL, '100003', 'sky123', '������ �� ���ϴ�.')

-- 1. Ŀ�� �ϰ� ���� ���̺� �����ϰ� ������ ��ü �����ϱ�
-- 2. �������� �����ϰ� �ٽ� �����ϱ�
-- 3. ��ǰ�ڵ尡 '100001'�̰� ȸ�� ���̵� 'cloud100'�� ��ǰ�� ������ ����Ͻÿ�
-- 4. ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ�(����Ŭ ���, ��������)
-- 5. ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ�(ǥ�ع��, ���������� �̿�)
-- 6. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(����Ŭ ���)
-- 7. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(ǥ�ع��)
-- 8. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(ǥ�ع�� RIGHT JOIN���� )
*/
-- product_review ���̺� ����
-- clob(character large object) - �ſ� ū ���ڿ� �ڷ���(4�Ⱑ)
CREATE TABLE product_review(
    review_no       NUMBER PRIMARY KEY,         -- �����ȣ
    product_code    CHAR(6) NOT NULL,          -- ��ǰ�ڵ�
    member_id       VARCHAR2(20) NOT NULL,      -- ȸ�����̵�
    content         CLOB NOT NULL,             -- ���䳻��
    regdate         DATE DEFAULT SYSDATE,       -- �ۼ���
    FOREIGN KEY(product_code) REFERENCES product(product_code)  -- �ܷ�Ű
);
-- �ڵ� ����(nocache - �ʱ�ȭ �ϸ� 1���� ����, ���ϸ� ���� �������� �̾���)
CREATE SEQUENCE seq_rno NOCACHE;             -- ���� ����, �ʱ�ȭ �ǰ�
-- regdate �� DEFAULT ���� �����Ƿ� ������ �ʿ䰡 ����
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100001', 'today10', '�������ε� ������ ���� �ִ� ��...');
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100001', 'cloud100', '�����̶� ���� ���ϳ׿�!');
INSERT INTO product_review(review_no, product_code, member_id, content)     
VALUES(seq_rno.NEXTVAL, '100002', 'sky123', '������ �� ���ϴ�.');

COMMIT;
select * from product_review;

-- ���̺� �����ϰ� ������ ��ü ����
TRUNCATE TABLE product_review;
-- ������ ����
DROP SEQUENCE seq_rno;
drop table product_review;

-- ��ǰ�ڵ尡 '100001'�̰� ȸ�� ���̵� 'cloud100'�� ��ǰ�� ������ ����Ͻÿ�
SELECT * FROM product_review
WHERE product_code = 100001 AND member_id LIKE 'cloud100';

-- ��ǰ ������ - 3��, �����ִ� ������ - 2��
-- ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ�(��������)
-- ������ġ : a ���̺��� �⺻Ű = b ���̺��� �ܷ�Ű
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ǥ�ع�� -- ��������(INNER JOIN)
SELECT * FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�
-- �ܺ����� ���(Product �� ��ǰ�� ��� ��µǰ�,
-- ����� �ֵ� ���� �������, ���䰡 ������ NULL�� ��µ�)
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code(+);

-- ǥ�� ���(�ܺ����� - OUTER JOIN)
-- OUTER�� ���� �����ϴ�
SELECT * FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code;

-- RIGHT JOIN
SELECT  b.product_code, 
        b.product_name, 
        b.price, 
        a.member_id, 
        a.content, 
        a.regdate
FROM product_review a RIGHT JOIN product b
ON a.product_code = b.product_code;

