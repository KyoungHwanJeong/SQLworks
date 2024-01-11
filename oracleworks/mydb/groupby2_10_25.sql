-- ROLLUP(), CUBE(), GROUPING SETS()
CREATE TABLE tbl_dept(
    dept_no     varchar2(3),
    job_nm      varchar2(30),
    salary      number
);

INSERT INTO tbl_dept VALUES('100', '���ǻ�', 33000000);
INSERT INTO tbl_dept VALUES('100', '������', 43000000);
INSERT INTO tbl_dept VALUES('100', '������', 25000000);
INSERT INTO tbl_dept VALUES('200', '���ǻ�', 50000000);
INSERT INTO tbl_dept VALUES('200', '�����ͺм���', 40000000);
INSERT INTO tbl_dept VALUES('200', '������', 60000000);

-- �μ� ��ü�� �ο� ���� �޿� �հ�.
SELECT * FROM tbl_dept;

-- �μ� ��ü �ο�, �޿� �հ�
SELECT COUNT(*) �ο���,
        SUM(salary) �޿��հ�
FROM tbl_dept;

-- �μ���, �����̸��� �ο��� �� �޿� �հ�
SELECT  dept_no,
        job_nm,
        COUNT(*) �ο���,
        SUM(salary) �޿��հ�
FROM tbl_dept
GROUP BY dept_no, job_nm;

-- �μ���, �����̸��� �ο��� �� �޿� �հ�(�Ѱ�)
SELECT  dept_no,
        job_nm,
        COUNT(*) �ο���,
        SUM(salary) �޿��հ�
FROM tbl_dept
GROUP BY ROLLUP (dept_no, job_nm);

-- �μ���, �����̸��� �ο��� �� �޿� �հ�(�Ұ�, �Ѱ�)
SELECT  dept_no,
        job_nm,
        COUNT(*) �ο���,
        SUM(salary) �޿��հ�
FROM tbl_dept
GROUP BY CUBE (dept_no, job_nm)
ORDER BY dept_no;

-- �μ���, �����̸��� �ο��� �� �޿� �հ�(�Ұ�, �Ѱ谡 ������ ����)
-- �μ���, �����̸����θ� ����.
SELECT  dept_no,
        job_nm,
        COUNT(*) �ο���,
        SUM(salary) �޿��հ�
FROM tbl_dept
GROUP BY GROUPING SETS(dept_no, job_nm)
ORDER BY dept_no;

COMMIT;
DROP TABLE tbl_dept;