SELECT *
FROM scott.dept;


CREATE VIEW scott.v_emp_10
  AS
  SELECT *
  FROM scott.dept
WHERE DEPTNO = 10;

SHOW FULL TABLES IN scott
WHERE table_type LIKE 'view'; -- 显示视图

SHOW FULL TABLES IN scott;

DROP VIEW scott.v_emp_10;

DESC scott.dept;

SHOW FULL COLUMNS FROM scott.dept;
SHOW TABLE STATUS FROM db_sc;
SHOW CREATE TABLE db_sc.student;

SHOW CREATE VIEW scott.v_emp_10;-- 显示建视图语句

SELECT *
FROM scott.v_emp_10
WHERE JOB = 'manager';

SELECT *
FROM scott.emp;
