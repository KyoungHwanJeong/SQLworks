-- ���� ���� ���̺� ����
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '����ȯ', 10000);

-- �ڷ� ����(��, ���)
UPDATE account
SET balance = 50000,
    owner = '�ڴ��'
WHERE ano = '33-33-333';

DELETE account
WHERE ano = '11-11-111';

COMMIT;
SELECT * FROM account;

SELECT * FROM account
WHERE ano = '11-11-111' AND owner '����ȯ' AND balance 10000;

drop table account;
ROLLBACK;
TRUNCATE TABLE account;