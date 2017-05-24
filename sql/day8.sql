SHOW DATABASES;
SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE COMM IS NULL; -- 判断是否为NULL

SELECT *
FROM scott.emp
WHERE COMM <=> NULL; -- COMM <=> NULL值为1，而在MySQL数据库中1认为真。当两个操作数中可能含有NULL   可将其看作mysql的方言

SELECT
  ENAME,
  DNAME
FROM scott.emp
  JOIN scott.dept; -- 交错查询无意义，错误的查询
# 内连接查询第一个有意义的查询
SELECT
  DNAME,
  ENAME
FROM scott.emp
  INNER JOIN scott.dept
  -- 有意义的内连接查询
    ON emp.DEPTNO = dept.DEPTNO; -- 联接条件(员工部门编号=部门编号)   联接了不同表的行
# 连接条件并不都是-->某一个表的外键列 = 另一个表的主键列    联合查询发生在至少两个表，联合查询的联合条件并不要求必须是一个外键等于一个主键
# 但一般情况下总是外键等于主键
SHOW FULL COLUMNS FROM scott.emp;
SHOW FULL COLUMNS FROM scott.dept;

SELECT *
FROM scott.dept;
SELECT *
FROM scott.emp;
# 1. 返回拥有员工的部门名、部门号   (部门表要与员工表有关联)
SELECT *
FROM scott.dept; -- 与员工没有关联

SELECT
  DISTINCT
  d.DEPTNO,
  d.DNAME -- 字段的查询也建议添加别名，可提高查询效率
FROM scott.dept AS d
  INNER JOIN scott.emp AS e -- 内联接员工表， 联合查询关键字ON，别名可简化语句
    ON e.DEPTNO = d.DEPTNO;

# 2. 工资多于 scott 的员工信息
SELECT e1.*
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.SAL + ifnull(e1.COMM,0) > e2.SAL + ifnull(e2.COMM,0)
WHERE e2.ENAME = 'scott'; -- (1)联合查询

SELECT *
FROM scott.emp
WHERE SAL + ifnull(COMM,0) >(
  SELECT SAL + ifnull(COMM,0)
  FROM scott.emp
WHERE ENAME = 'scott'
); -- (2)SELECT子句查询

# 3. 返回员工和所属经理的姓名  (只需要一个员工表即可，经理也属于员工，两个别名来模拟两个表)
SELECT            -- 自联结
  e1.ENAME 员工姓名,
  e2.ENAME 经理姓名
FROM scott.emp e1 INNER JOIN scott.emp e2 -- 一个表看成两个表，再进行联合查询称为自连接，内连接的一种特殊情况，靠别名的不同将其看成两个表
    ON e1.MGR = e2.EMPNO;

-- left outer join
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e LEFT OUTER JOIN scott.dept d -- 左外联接，显示左表落选记录，左和右是相对而言
    ON e.DEPTNO = d.DEPTNO
UNION -- 并集查询显示两个表的落选记录,可自动删除重复的行，UNION ALL显示所有的行包括重复的行
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e RIGHT OUTER JOIN scott.dept d -- 右外联接
    ON e.DEPTNO = d.DEPTNO;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
SELECT *
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.MGR = e2.EMPNO
WHERE e1.HIREDATE < e2.HIREDATE;-- 联合查询

SELECT *
FROM scott.emp
WHERE HIREDATE < (
  SELECT HIREDATE
  FROM scott.emp
  WHERE JOB = 'MANAGER'
);
# 5. 返回员工姓名及其所在的部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'clerk';

# 7. 返回部门号及其本部门的最低工资


# 8. 返回销售部 sales 所有员工的姓名
SELECT e.ENAME
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;


SELECT ENAME
FROM scott.emp
WHERE DEPTNO = (
  SELECT dept.DEPTNO
  FROM scott.dept
WHERE DNAME ='sales'
);
# 9. 返回工资多于平均工资的员工
-- 子查询
SELECT *
FROM scott.emp
WHERE emp.SAL + ifnull(COMM,0) >(
  SELECT avg(SAL + ifnull(COMM,0))
  FROM scott.emp
);
# 10. 返回与 scott 从事相同工作的员工
SELECT *
FROM scott.emp e1
  INNER JOIN scott.emp e2
    ON e1.JOB = e2.JOB
WHERE e2.ENAME = 'SCOTT';-- 联合查询

-- 子查询
SELECT *
FROM scott.emp
WHERE JOB = (
  SELECT JOB
  FROM scott.emp
  WHERE ENAME = 'scott'
);

# 11. 返回比 30 部门员工平均工资高的员工姓名与工资

# 12. 返回工资高于30部门所有员工工资水平的员工信息


# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
SELECT
  d.DEPTNO,
  d.DNAME,
  d.LOC,
  count(e.EMPNO)
FROM scott.dept d
  JOIN scott.emp e
    ON e.DEPTNO = d.DEPTNO;

# 14. 返回员工的姓名、所在部门名及其工资
SELECT DISTINCT
  e.ENAME,
  e.SAL + ifnull(e.COMM,0), -- 工资
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息**
SELECT e1.ENAME,e2.ENAME
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.JOB = e2.JOB
WHERE e1.DEPTNO <> e2.DEPTNO;

# 16. 返回员工的详细信息，包括部门名**
SELECT e.*,d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;

# 17. 返回员工工作及其从事此工作的最低工资
# 18. 返回不同部门经理的最低工资
# 19. 计算出员工的年薪，并且以年薪排序 **
SELECT ENAME,(SAL + ifnull(COMM,0)) * 12 年薪
FROM scott.emp
ORDER BY 2 DESC ;

# 20. 返回工资处于第 4 级别的员工的姓名
SELECT *
FROM scott.emp e INNER JOIN scott.salgrade s
ON (e.SAL + ifnull(e.COMM,0)) BETWEEN s.LOSAL AND s.HISAL
WHERE s.GRADE = 4;

SELECT *
FROM scott.salgrade;


DROP DATABASE scott;
CREATE DATABASE scott;


# 创建视图，本质是被存储的查询
CREATE VIEW scott.v_emp
  AS
  SELECT
    JOB,
    HIREDATE,
    SAL
    FROM scott.emp
  WHERE DEPTNO = 20; -- 创建视图

USE scott;
SHOW TABLES;

DROP VIEW v_emp;  -- 删除视图

SELECT *
FROM scott.v_emp; -- 查询视图的所有行所有列


SELECT *
FROM scott.v_emp
WHERE JOB = 'manager';

UPDATE scott.emp
    SET HIREDATE = '1981-5-1'
WHERE HIREDATE = '1981-4-2';


UPDATE scott.v_emp
SET HIREDATE = '1981-6-1'
WHERE HIREDATE = '1981-5-1';-- 透过视图可修改表里的数据

CREATE OR REPLACE VIEW v_emp_dept  -- 视图不存在的话就CREATE,存在的话就更新REPLACE
  AS
  SELECT e.ENAME,d.DNAME
  FROM scott.emp e  INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO
WHERE d.DEPTNO = 20;

SHOW FULL TABLES IN scott WHERE table_type LIKE 'view';
SHOW TABLES IN scott;

DESC scott.dept; -- =SHOW FULL COLUMNS FROM scott.dept看表所有列及注释
SHOW TABLE STATUS FROM db_sc;-- 返回表的注释

SELECT *
FROM scott.dept;
