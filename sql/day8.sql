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
    ON emp.DEPTNO = dept.DEPTNO; -- 联接条件   联接了不同表的行

# 1. 返回拥有员工的部门名、部门号
SELECT *
FROM scott.dept; -- 与员工没有关联

SELECT
  DISTINCT
  d.DEPTNO,
  d.DNAME -- 字段的查询也建议添加别名
FROM scott.dept AS d
  INNER JOIN scott.emp AS e -- 内联接员工表， 联合查询关键字ON
    ON e.DEPTNO = d.DEPTNO;

# 3. 返回员工和所属经理的姓名
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
UNION -- 并集查询显示两个表的落选记录
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e RIGHT OUTER JOIN scott.dept d -- 右外联接
    ON e.DEPTNO = d.DEPTNO;


