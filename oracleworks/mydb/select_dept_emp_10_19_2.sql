/*
-- 1. employee2 ���̺� (106, '�����', 25, null, 30)�� �����Ͻÿ�. -- ���� ����?
-- 2. �޿��� 400���� �̻��̰� �μ���ȣ�� 10�� ����� �˻��Ͻÿ�.
-- 3. �޿��� ���� ������ �����Ͻÿ�.
-- 4. �޿��� ���� ����� �˻��Ͻÿ�.
-- 5. ����� ���ο��� ���Ͻÿ�.
-- 6. ����� �޿� �Ѿװ� �޿� ����� ���Ͻÿ�.
-- 7. ����� ���ο�, �޿� �Ѿװ� �޿� ����� ���Ͻÿ�.
-- 8. �μ��� �޿� �Ѿ��� ���Ͻÿ�.
-- 9. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(��������)
-- 10. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(��������)
-- 11. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(join ~ using)
-- 12. �μ����̵�, �μ��̸��� �޿� �Ѿ�, ���
-- 13. �μ����̵�, �μ��̸��� �޿� �Ѿ�, ���(ROLLUP �̿��ؼ�)
-- 14. �ְ� �޿��� ���� �޿��� �޴� ����� ������ �˻��Ͻÿ�
-- 15. '��λ�' ����� �޿��� 430�������� �����ϼ���.
-- 16. ����� �޿� ������ ���Ͻÿ�
*/

-- 1. employee2 ���̺� (106, '�����', 25, null, 30)�� �����Ͻÿ�. -- ���� ����?
INSERT INTO employee2_2 VALUES(106, '�����', 25, null, 30);       -- �θ�Ű�� ��� ���Ἲ ���� ���� �߻�

-- 2. �޿��� 400���� �̻��̰� �μ���ȣ�� 10�� ����� �˻��Ͻÿ�.
SELECT * FROM employee2_2
WHERE sal >= 4000000 AND deptid = 10;

-- 3. �޿��� ���� ������ �����Ͻÿ�.
SELECT * FROM employee2_2
ORDER BY sal DESC;

-- 4. �޿��� ���� ����� �˻��Ͻÿ�.
SELECT * FROM employee2_2
WHERE sal IS NULL;

-- 5. ����� ���ο��� ���Ͻÿ�.
SELECT COUNT(*) ���ο� FROM employee2_2;

-- 6. ����� �޿� �Ѿװ� �޿� ����� ���Ͻÿ�.
SELECT  ROUND(SUM(sal), 0) �޿��Ѿ�, 
        ROUND(AVG(sal), 0) �޿����
FROM employee2_2;

-- 7. ����� ���ο�, �޿� �Ѿװ� �޿� ����� ���Ͻÿ�.
SELECT  COUNT(*)          ���ο�,
        ROUND(SUM(sal), 0) �޿��Ѿ�,
        ROUND(AVG(sal), 0) �޿����
FROM employee2_2;

-- 8. �μ��� �޿� �Ѿ��� ���Ͻÿ�.
SELECT  a.deptid, 
        a.deptname, 
        SUM(b.sal)
FROM department2_2 a, employee2_2 b
WHERE a.deptid = b.deptid
GROUP BY a.deptid, a.deptname;

-- 9. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(��������)
SELECT  a.deptid,
        a.deptname,
        b.empid,
        b.empname,
        age,
        sal
FROM department2_2 a, employee2_2 b
WHERE a.deptid = b.deptid;

-- 10. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(��������)
SELECT  a.deptid,
        a.deptname,
        b.empid,
        b.empname,
        age,
        sal
FROM department2_2 a INNER JOIN employee2_2 b
    ON a.deptid = b.deptid;
    
-- 11. �μ��̸��� ������ ����� ��� ����(�μ����̵�, �μ��̸�, ������̵�, ����̸�, ��� ����, ����)�� �˻��Ͻÿ�(join ~ using)
SELECT  deptid,
        a.deptname,
        b.empid,
        b.empname,
        age,
        sal
FROM department2_2 a JOIN employee2_2 b
    USING (deptid);
    
-- 12. �μ����̵�, �μ��̸��� �޿� �Ѿ�, ���
SELECT  a.deptid,
        a.deptname,
        ROUND(SUM(b.sal), 0),
        ROUND(AVG(b.sal), -2)
FROM department2_2 a INNER JOIN employee2_2 b
    ON a.deptid = b.deptid
    GROUP BY a.deptid, a.deptname;
    
-- 13. �μ����̵�, �μ��̸��� �޿� �Ұ�, �Ѱ�(ROLLUP �̿��ؼ�)
SELECT  a.deptid,
        a.deptname,
        ROUND(SUM(b.sal), 0),
        ROUND(AVG(b.sal), -2)
FROM department2_2 a INNER JOIN employee2_2 b
    ON a.deptid = b.deptid
GROUP BY ROLLUP(a.deptid, a.deptname);

-- 14. �ְ� �޿��� ���� �޿��� �޴� ����� ������ �˻��Ͻÿ�
SELECT * FROM employee2_2
WHERE sal = (SELECT Max(sal) FROM employee2_2) 
    OR sal = (SELECT MIN(sal) FROM employee2_2);
    
-- 15. '��λ�' ����� �޿��� 430�������� �����ϼ���.
UPDATE employee2_2 SET sal =4300000
WHERE empname = '��λ�';
SELECT * FROM employee2_2;

-- 16. ����� �޿� ������ ���Ͻÿ�
SELECT  empid,
        empname,
        RANK() OVER(ORDER BY sal),
        DENSE_RANK()OVER(ORDER BY sal)
FROM employee2_2;
