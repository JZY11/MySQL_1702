DROP TABLE IF EXISTS db_1712.student;

SHOW FULL COLUMNS FROM db_1712.student;

# DML   INSERT  UPDATA  DELETE

SELECT *
FROM db_1712.student;

-- 三中INSERT插入语句
INSERT INTO db_1712.student -- 插入所有列都加入具体信息（记录），要与建表之初的数据类型要一致
VALUES (NULL, '002', 'tester', 'I\m...', 'F', 19, 1.7, 1234567.890, '1998-1-2', '2017-5-18 9:01:02');


INSERT INTO db_1712.student (NAME)  -- 在某一具体列插入数据，其他列的值将为默认值或空值，但非空列必须要有值(插入若干列)
VALUES ('Tom');


INSERT INTO db_1712.student (name) -- 一条语句可插入多条记录
VALUES ('N1'), ('N2'), ('N3');
SHOW CREATE TABLE db_1712.student; -- 显示建表语句

-- 两种UPDATE语句
UPDATE db_1712.student
SET gender = '女', name = 'Lucas'; -- 不加WHERE修改的是所有列

UPDATE db_1712.student
SET height = 1.6
WHERE id = 1; -- 修改具体的列


DELETE FROM db_1712.student
WHERE sno IS NULL;

DELETE FROM db_1712.student
WHERE age <= 19; -- BETWEEN 19 AND 22

DELETE FROM db_1712.student;

DELETE FROM db_1712.student
WHERE name = 'tom'; -- 不区分大小写  在'tom'前BINARY则区分大小写

# COLLATE = utf8_bin 在建表语句末尾加上后就可区分大小写


DROP TABLE IF EXISTS db_1712.case_test;
CREATE TABLE db_1712.case_test (
  col VARCHAR(255)
)
  COLLATE = utf8_bin; -- binary

INSERT INTO db_1712.case_test VALUES ('test');
SELECT *
FROM db_1712.case_test;

DELETE FROM db_1712.case_test
WHERE col = 'test';


SELECT *
FROM db_1712.ip;

SHOW DATABASES;

USE db_1712;
SHOW TABLES;

# SHOW TABLES statu


SHOW TABLE STATUS FROM db_1712
WHERE Name = 'student';

SHOW FULL COLUMNS FROM db_1712.student;

SHOW FULL TABLES FROM db_1712;

SHOW VARIABLES LIKE 'char%';
SHOW VARIABLES LIKE 'coll%';

SHOW VARIABLES;

SHOW CREATE TABLE db_1712.student;

SELECT *
FROM db_1712.student;

SELECT
  min,
  geo
FROM db_1712.ip; -- 投影操作

SELECT count(DISTINCT geo) -- DISTINCT 去掉重复的数据
FROM db_1712.ip;


SHOW TABLES;

SHOW TABLE STATUS FROM scott;

SHOW FULL COLUMNS FROM scott.dept;
SHOW FULL COLUMNS FROM scott.emp;
SHOW FULL COLUMNS FROM scott.salgrade;

SELECT *
FROM scott.dept;

SELECT *
FROM scott.emp;

SELECT *
FROM scott.salgrade;

SELECT
  ENAME,
  HIREDATE,
  DEPTNO
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE JOB = 'salesman';

SELECT *
FROM scott.emp
WHERE HIREDATE <> '1987 -01-01';

SELECT *
FROM scott.emp
WHERE SAL > 1000 AND JOB = 'salesman';

SELECT *
FROM scott.emp
ORDER BY HIREDATE; -- ASC升序  DESC降序  默认升序

SELECT *
FROM scott.emp
ORDER BY DEPTNO DESC, SAL; -- 部门降序，工资升序   null值作为最小值

SELECT
  DEPTNO,
  SAL
FROM scott.emp
ORDER BY 1 DESC, 2; -- 效果同上

SELECT DEPTNO
FROM scott.emp
ORDER BY 1 DESC, SAL; -- 效果同上

SELECT *
FROM scott.emp
WHERE DEPTNO = 30;-- 1

SELECT EMPNO,ENAME,DEPTNO
FROM scott.emp
WHERE JOB = 'clerk';-- 2

SELECT *
FROM scott.emp
WHERE COMM > emp.SAL;-- 3

SELECT *
FROM scott.emp
WHERE COMM > emp.SAL* 0.3;-- 4

SELECT *
FROM scott.emp
WHERE DEPTNO = 10 AND JOB = 'manager'OR DEPTNO = 30 AND JOB = 'clerk';-- 5

SELECT *
FROM scott.emp
WHERE (DEPTNO = 10 AND JOB = 'manager'AND DEPTNO = 30 AND emp.JOB = 'clerk') OR (emp.JOB !='manager'AND JOB !='clerk'AND emp.SAL>2000);

SELECT JOB
FROM scott.emp
WHERE COMM > 0;-- 7

SELECT *
FROM scott.emp
WHERE COMM<100 OR COMM<0;-- 8

SELECT *
FROM scott.emp
WHERE HIREDATE REGEXP '_30$';

SELECT *
FROM scott.emp
WHERE ENAME ;

SELECT *
FROM scott.emp
WHERE ENAME LIKE 'A%'OR 'B%'OR 'S%';