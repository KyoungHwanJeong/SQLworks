-- ROWNUM(�ο��ȣ, ���ȣ)
-- �� ���� �����ϰ� ���� �� ���, SUDO COLUMNE�̶� ��
CREATE TABLE ex_score(
    name    VARCHAR2(20),
    score   NUMBER(3)
);

INSERT INTO ex_score VALUES('���ϳ�', 94);
INSERT INTO ex_score VALUES('���ϳ�', 85);
INSERT INTO ex_score VALUES('���ϳ�', 100);
INSERT INTO ex_score VALUES('���ϳ�', 97);
INSERT INTO ex_score VALUES('���ϳ�', 87);

INSERT INTO ex_score VALUES('���ϳ�', 87);
INSERT INTO ex_score VALUES('���ϳ�', 91);
INSERT INTO ex_score VALUES('���ϳ�', 77);
INSERT INTO ex_score VALUES('���ϳ�', 80);
INSERT INTO ex_score VALUES('���ϳ�', 95);

-- 5����� ���� ���
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM <= 5;

-- 1���� 5����� ������ �˻�(AND �̿��ؼ�)
-- ROWNUM�� 1���� �����ؾ� ��
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM >=1 AND ROWNUM <= 5;

SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM BETWEEN 1 AND 5;

-- ������ ������������ �����Ͻÿ�
SELECT name, score 
FROM ex_score
    ORDER BY score DESC;
    
-- ������ ���� ������ 5���� �˻��Ͻÿ�
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM <=5
    ORDER BY score DESC;
    
SELECT ROWNUM, name, score 
FROM ex_score
WHERE ROWNUM >=1 AND ROWNUM <= 5;

-- ������ ������������ ������ �Ŀ� 5���� �˻�
SELECT ROWNUM, name, score 
FROM (SELECT *
        FROM ex_score
        ORDER BY score DESC
        ) ex_score1
WHERE ROWNUM <=5;
    

SELECT * FROM ex_score;
COMMIT;