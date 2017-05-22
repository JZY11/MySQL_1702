SHOW DATABASES;
SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE COMM IS NULL; -- 判断是否为NULL

SELECT *
FROM scott.emp
WHERE COMM <=> NULL; -- 当两个操作数中可能含有NULL   可将其看作mysql的方言

SELECT
  ENAME,
  DNAME
FROM scott.emp
  JOIN scott.dept; -- 交错查询无意义，错误的查询

SELECT
  DNAME,
  ENAME
FROM scott.emp
  INNER JOIN scott.dept
  -- 有意义的内连接查询
    ON emp.DEPTNO = dept.DEPTNO; -- 联接条件(员工部门编号=部门编号)   联接了不同表的行
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
  d.DNAME -- 字段的查询也建议添加别名
FROM scott.dept AS d
  INNER JOIN scott.emp AS e -- 内联接员工表， 联合查询关键字ON
    ON e.DEPTNO = d.DEPTNO;

# 3. 返回员工和所属经理的姓名  (只需要一个员工表即可，经理也属于员工)
SELECT
  e1.ENAME 员工姓名,
  e2.ENAME 经理姓名
FROM scott.emp e1 INNER JOIN scott.emp e2 -- 一个表看成两个表，再进行联合查询称为自连接
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
# 5. 返回员工姓名及其所在的部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'clerk';

# 8. 返回销售部 sales 所有员工的姓名
SELECT e.ENAME
FROM scott.emp e
  JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# 10. 返回与 scott 从事相同工作的员工
SELECT e1.ENAME
FROM scott.emp e1
  JOIN scott.emp e2
    ON e1.JOB = e2.JOB
WHERE e2.ENAME = 'SCOTT';

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
  e.SAL,
  d.DNAME
FROM scott.emp e JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
# 16. 返回员工的详细信息，包括部门名
