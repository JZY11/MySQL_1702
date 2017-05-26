SELECT *
FROM scott.emp;

SELECT *
FROM mysql.user;-- 显示mysql数据库下的user表的数据内容，可显示用户信息，包括用户名

CREATE USER 'tester'@localhost -- @localhost本机服务器
IDENTIFIED BY 'test123'; -- 创建用户及赋予密码

GRANT CREATE ON scott.* to 'tester'@localhost;-- 添加权限
GRANT DROP ON scott.* to 'tester'@localhost;-- 添加权限
GRANT SELECT ON scott.* to 'tester'@localhost;
GRANT ALL ON scott.* TO 'tester'@localhost;

REVOKE SELECT ON scott.* FROM 'tester'@localhost;-- 撤销权限
REVOKE DROP ON scott.* FROM 'tester'@localhost;-- 撤销权限
REVOKE CREATE ON scott.* FROM 'tester'@localhost;

/*CREATE USER 'tester'@'%'
IDENTIFIED BY 'test123';*/-- 数据库在远程可以访问即另外一个人的机器可通过你的IP进行访问你的数据库，将localhost-->%

RENAME USER tester@localhost TO tester_new; -- 修改用户名
DROP USER tester_new@'%';
DROP USER 'tester_new'@'%';


# 修改用户名密码

DROP USER tester_new; -- 删除用户名

# 1.先由root用户创建一个数据库
# 2.再创建一个新的用户
# 3.授予这个用户在这个数据库上的一些权限或是全部权限
CREATE DATABASE db_test;-- 1

CREATE USER 'tester'@'localhost'
  IDENTIFIED BY 'test123';-- 2

GRANT ALL ON db_test.* TO 'tester'@'localhost';-- 3



# 函数
SELECT max(SAL),min(sal),sum(SAL),avg(SAL),count(SAL)
FROM scott.emp;

SELECT JOB
FROM scott.emp
GROUP BY JOB; -- group 分组查询，将job种类相同的归为一组，查询就有一限制

SELECT *
FROM db_1712.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10 OFFSET 0;-- 查询前十的密码

SELECT *
FROM scott.emp;


