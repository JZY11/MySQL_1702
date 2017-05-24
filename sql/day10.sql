START TRANSACTION ;
SELECT *
FROM scott.emp;

TRUNCATE TABLE scott.emp; -- truncate是比较危险的操作，彻底删除，删除后就rollback不回来了

DELETE FROM scott.emp;
ROLLBACK ; -- rollback回滚   在开启一次事物之后delete掉表中的数据后是可以rollback回来的