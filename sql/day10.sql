START TRANSACTION ;

SELECT *
FROM scott.emp;

TRUNCATE TABLE scott.emp; -- truncate是比较危险的操作，彻底删除，删除后就rollback不回来了

DELETE FROM scott.emp;
ROLLBACK ; -- rollback回滚   在开启一次事物之后delete掉表中的数据后是可以rollback回来的

SHOW TABLES IN scott;

START TRANSACTION ;

UPDATE scott.emp
    SET SAL = SAL + 1000
WHERE ENAME = 'allen';

UPDATE scott.emp
    SET SAL = SAL - 2000
WHERE ENAME = 'ward';

COMMIT ; -- 事物的完成 （提交），事物有开启就要有完成

ROLLBACK ;-- 事物的完成

SELECT *
FROM scott.emp;

START TRANSACTION ;
UPDATE scott.emp
    SET DEPTNO = DEPTNO - 10
WHERE ENAME = 'allen';

UPDATE scott.emp
    SET DEPTNO = DEPTNO + 10
WHERE ENAME = 'ward';

COMMIT ;

ROLLBACK ;


START TRANSACTION ;
-- DML
UPDATE scott.emp
    SET ENAME = 'allen new'
WHERE ENAME = 'allen';

SELECT *
FROM scott.emp;

ROLLBACK ;
COMMIT ;




-- save point 保留点
START TRANSACTION ;

UPDATE scott.emp
    SET ENAME = 'allen'
WHERE EMPNO = 7499;

SAVEPOINT a;

DELETE FROM scott.emp
WHERE EMPNO = 7499;

SAVEPOINT b;


INSERT INTO scott.emp(EMPNO,ENAME)
    VALUE (1234,'tester');

SAVEPOINT c;

DELETE FROM scott.emp;

COMMIT ;
ROLLBACK TO a;
ROLLBACK ;

SELECT *
FROM scott.emp;