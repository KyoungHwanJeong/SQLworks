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
CREATE TABLE product_review_2(
    review_no       NUMBER PRIMARY KEY,     -- ���� ��ȣ
    product_code    CHAR(6) NOT NULL,       -- ��ǰ �ڵ�
    member_id       VARCHAR2(20) NOT NULL,  -- ȸ�� ���̵�
    content         CLOB NOT NULL,          -- ���� ����
    regdate         DATE DEFAULT SYSDATE,    -- �ۼ���
    FOREIGN KEY(product_code) REFERENCES product_2(product_code)
);
-- ������ ����
CREATE SEQUENCE seq_rno_2 NOCACHE;
-- ���� ������
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100001', 'today10', '�������ε� ������ ���� �ִµ�...');
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100001', 'cloud100', '�����̶� ���� ���ϳ׿�!');
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100002', 'sky123', '������ �� ���ϴ�.');
COMMIT;
SELECT * FROM product_review_2;

-- 1. Ŀ�� �ϰ� ���� ���̺� �����ϰ� ������ ��ü �����ϱ�
TRUNCATE TABLE product_review_2;
ROLLBACK;                                  -- �ѹ��� �ȵ�

-- 2. �������� �����ϰ� �ٽ� �����ϱ�
DROP SEQUENCE seq_rno_2;
DROP TABLE product_review_2;

-- 3. ��ǰ�ڵ尡 '100001'�̰� ȸ�� ���̵� 'cloud100'�� ��ǰ�� ������ ����Ͻÿ�
SELECT * FROM product_review_2
WHERE product_code = 100001 AND member_id LIKE 'cloud100';

-- 4. ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ�(����Ŭ ���, ��������)
SELECT * FROM product_2 a, product_review_2 b
WHERE a.product_code = b.product_code;

-- 5. ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ�(ǥ�ع��, ���������� �̿�)
SELECT * FROM product_2 a INNER JOIN product_review_2 b
ON a.product_code = b.product_code;

-- 6. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(����Ŭ ���)
SELECT * FROM product_2 a, product_review_2 b
WHERE a.product_code = b.product_code(+);

-- 7. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(ǥ�ع��)
SELECT * FROM product_2 a LEFT OUTER JOIN product_review_2 b
ON a.product_code = b.product_code;

-- 8. ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�(ǥ�ع�� RIGHT JOIN���� )
SELECT  a.product_code,
        a.product_name,
        a.price,
        b.member_id,
        b.content,
        b.regdate
FROM product_review_2 b RIGHT OUTER JOIN product_2 a
ON a.product_code = b.product_code;