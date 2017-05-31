SELECT *
FROM scott.dept;


CREATE OR REPLACE VIEW scott.v_emp_10
  AS
  SELECT *
  FROM scott.emp
WHERE DEPTNO = 10;

SELECT *
FROM scott.v_emp_10;

SHOW FULL TABLES IN scott;
SHOW FULL TABLES IN scott


WHERE table_type LIKE 'view'; -- 显示视图

DROP VIEW scott.v_emp_10; -- 删除视图

DESC scott.dept;-- 显示部门表的基本结构，没有下面这条语句显示的全
SHOW FULL COLUMNS FROM scott.dept;-- 显示表的所有列以及注释
SHOW TABLE STATUS FROM db_sc;-- 显示表的注释
SHOW CREATE TABLE db_sc.student;-- 显示的是建表语句，有列的注释还有表的注释

SHOW CREATE VIEW scott.v_emp_10;-- 显示建视图语句

SELECT *
FROM scott.v_emp_10
WHERE JOB = 'manager' ;


SELECT *
FROM scott.emp
WHERE DEPTNO = 10 AND JOB = 'manager';

CREATE OR REPLACE VIEW scott.v_emp_dept
  AS
  SELECT e.ENAME,d.DNAME
  FROM scott.emp e LEFT JOIN scott.dept d
on e.DEPTNO = d.DEPTNO;

SELECT *
FROM scott.v_emp_dept;

UPDATE scott.v_emp_dept
    SET scott.v_emp_dept.ENAME = 'scott'
WHERE scott.v_emp_dept.ENAME = 'scott new';


CREATE VIEW scott.v_max
  AS
  SELECT max(sal) max_sal  -- 聚合函数
  FROM scott.emp;

SELECT *
FROM scott.v_max;

UPDATE scott.v_max
    SET max_sal = 6000;



CREATE VIEW scott.v_union
AS
  SELECT ename
  FROM scott.emp
  WHERE DEPTNO = 10

  UNION

  SELECT ename
  FROM scott.emp
  WHERE DEPTNO = 20;

SELECT *
FROM scott.v_union;

UPDATE scott.v_union
    SET scott.v_union.ENAME = 'scott'
WHERE v_union.ENAME = 'SCOTT';





-- 嵌套 sub-queries
SELECT * -- 主查询
FROM scott.emp
WHERE SAL > (-- 子查询
  SELECT SAL
  FROM scott.emp
  WHERE ENAME = 'scott'
);

SELECT
  EMPNO,
  ENAME
FROM scott.emp AS e
WHERE sal > (
  SELECT AVG(sal)
  FROM scott.emp
  WHERE e.DEPTNO = e.DEPTNO
);


SELECT *
FROM scott.emp;
