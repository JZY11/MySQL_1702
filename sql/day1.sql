show DATABASES ;
CREATE DATABASE db_1712;
DROP DATABASE db_1712;
USE db_1712;
SHOW TABLES ;
CREATE TABLE t_student (
  sno   VARCHAR(10),
  sname VARCHAR(10),
  gender CHAR(1),
  age INT(2)
);
SELECT *
FROM t_student;

INSERT INTO t_student
    VALUE ('2017001','张三','男',18)


