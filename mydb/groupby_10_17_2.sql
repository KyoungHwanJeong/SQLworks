/*

--1. '1002'�� �μ� �̸��� '�ѹ���'���� �����ϱ�
--2. �μ��� �޿� �Ѿ��� ���Ͻÿ�
--3. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�
--4. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�(ROLLUP�� �̿��ؼ�)
--5. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�(CUBE�� �̿��ؼ�)
--6. ���� �̸��� ����, ������ ������ ����Ͻÿ�
--7. '���¾�'�� �޿��� 3000000������ �����ϱ�
--8. ���� �̸��� ����, ������ ����, ������ ������ ���� ������ ������ �Űܼ� ����Ͻÿ�
*/
-- department ���̺� ����
CREATE TABLE department_2(
    deptno      VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office      VARCHAR2(20)
);

INSERT INTO department_2 VALUES('1000', '�λ���', '����');
INSERT INTO department_2 VALUES('1001', '������', '��õ');
INSERT INTO department_2 VALUES('1002', '������', '����');
INSERT INTO department_2(deptno, deptname) VALUES('1003', '������');

-- employee ���̺� ����
CREATE TABLE employee_2(
    empno    NUMBER(3) PRIMARY KEY,
    empname  VARCHAR2(20) NOT NULL,
    sal   NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno   VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno)      -- �ܷ�Ű
);
INSERT INTO employee_2 VALUES (100,'�̰�', 2500000, SYSDATE, '1000');
INSERT INTO employee_2 VALUES (101,'���', 2000000, SYSDATE, '1001');
INSERT INTO employee_2 VALUES (102,'�ڴ�', 3000000, SYSDATE, '1002');
INSERT INTO employee_2 VALUES (103,'���¾�', 3500000, SYSDATE, '1000');
INSERT INTO employee_2 VALUES (104,'�ֿ���', 5000000, SYSDATE, '1001');
INSERT INTO employee_2 VALUES (105,'�쿵��', 4000000, SYSDATE, '1002');

COMMIT;
SELECT * FROM department_2;
SELECT * FROM employee_2;

--1. '1002'�� �μ� �̸��� '�ѹ���'���� �����ϱ�
UPDATE department_2 SET deptname = '�ѹ���'
WHERE deptno = 1002;

--2. �μ��� �޿� �Ѿ��� ���Ͻÿ�
SELECT deptno �μ���ȣ, SUM(sal) �޿��Ѿ�
FROM employee_2
GROUP BY deptno;

--3. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�
SELECT  a.deptno, 
        a.deptname, 
        SUM(b.sal) �޿��Ѿ�
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY a.deptno, a.deptname;

--4. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�(ROLLUP�� �̿��ؼ�)
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) �޿��Ѿ�
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY ROLLUP(a.deptno, a.deptname);

--5. �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�(CUBE�� �̿��ؼ�)
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) �޿��Ѿ�
FROM department_2 a, employee_2 b
WHERE a.deptno = b.deptno
GROUP BY CUBE(a.deptno, a.deptname);

--6. ���� �̸��� ����, ������ ������ ����Ͻÿ�
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno) "sal_sum"
FROM employee_2;

--7. '���¾�'�� �޿��� 3000000������ �����ϱ�
UPDATE employee_2 SET sal = 3000000
WHERE empname = '���¾�';

--8. ���� �̸��� ����, ������ ����, ������ ������ ���� ������ ������ �Űܼ� ����Ͻÿ�
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno),
        DENSE_RANK() OVER(ORDER BY sal DESC)
FROM employee_2;

COMMIT;