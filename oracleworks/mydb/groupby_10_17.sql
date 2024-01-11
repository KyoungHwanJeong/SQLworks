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
CREATE TABLE department(
    deptno      VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office      VARCHAR2(20)
);

INSERT INTO department VALUES('1000', '�λ���', '����');
INSERT INTO department VALUES('1001', '������', '��õ');
INSERT INTO department VALUES('1002', '������', '����');
INSERT INTO department(deptno, deptname) VALUES('1003', '������');

-- employee ���̺� ����
CREATE TABLE employee(
    empno    NUMBER(3) PRIMARY KEY,
    empname  VARCHAR2(20) NOT NULL,
    sal   NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno   VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno)      -- �ܷ�Ű
);
INSERT INTO employee VALUES (100,'�̰�', 2500000, SYSDATE, '1000');
INSERT INTO employee VALUES (101,'���', 2000000, SYSDATE, '1001');
INSERT INTO employee VALUES (102,'�ڴ�', 3000000, SYSDATE, '1002');
INSERT INTO employee VALUES (103,'���¾�', 3500000, SYSDATE, '1000');
INSERT INTO employee VALUES (104,'�ֿ���', 5000000, SYSDATE, '1001');
INSERT INTO employee VALUES (105,'�쿵��', 4000000, SYSDATE, '1002');

SELECT * FROM department;
SELECT * FROM employee;

-- '1002'�� �μ� �̸��� '�ѹ���'���� �����ϱ�
UPDATE department SET deptname = '�ѹ���'
WHERE deptno = 1002;

-- �μ��� �޿� �Ѿ��� ���Ͻÿ�
SELECT deptno, SUM(sal) �޿��Ѿ�
FROM employee
GROUP BY deptno;

-- �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�
-- employee, department ���̺� ���(����)
SELECT  a.deptno,
        a.deptname, 
        SUM(b.sal) �޿��Ѿ�
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY a.deptno, a.deptname;

-- ROLLUP(Į��1, Į��2) : GROUP BY������ �Ұ�, �Ѱ踦 ����
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) �޿��Ѿ�
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY ROLLUP(a.deptno, a.deptname);

-- CUBE(Į��1, Į��2) : GROUP BY������ ��� �Ұ�, �Ѱ踦 ��ü������ ����
SELECT  a.deptno,
        a.deptname,
        SUM(b.sal) �޿��Ѿ�
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY CUBE(a.deptno, a.deptname)
ORDER BY a.deptno;

-- SUM(Į����) OVER(ORDER BY ������Į����) - �����հ�
-- Į���� ���� �ҹ��ڷ� ǥ���� �� �ֵ���ǥ(" ")�� �����ش�
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno) "sal_sum"
FROM employee;

-- '���¾�'�� �޿��� 3000000������ �����ϱ�
UPDATE employee SET sal = 3000000
WHERE empname = '���¾�';

-- ���� RANK() OVER(ORDER BY ������Į����) �Լ�
-- DENSE_RANK �չ� ������ ���� �� ���� �� ������ �÷��ش�
SELECT  empno,
        empname,
        sal,
        SUM(sal) OVER(ORDER BY empno) "sal_sum",
        DENSE_RANK() OVER(ORDER BY sal DESC) �޿�_RANK
FROM employee;

COMMIT;
SELECT * FROM employee;
DROP TABLE department;
DROP TABLE employee;