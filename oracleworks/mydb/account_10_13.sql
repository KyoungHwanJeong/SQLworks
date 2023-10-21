-- 은행 계좌 테이블 생성
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '정경환', 10000);

-- 자료 변경(입, 출금)
UPDATE account
SET balance = 50000,
    owner = '박대박'
WHERE ano = '33-33-333';

DELETE account
WHERE ano = '11-11-111';

COMMIT;
SELECT * FROM account;

SELECT * FROM account
WHERE ano = '11-11-111' AND owner '정경환' AND balance 10000;

drop table account;
ROLLBACK;
TRUNCATE TABLE account;