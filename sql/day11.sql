SELECT *
FROM scott.emp;

SELECT *
FROM mysql.user;-- 可显示用户信息，包括用户名

CREATE USER 'tester'@localhost
IDENTIFIED BY 'test123'; -- 创建用户及密码

GRANT CREATE ON scott.* to 'tester'@localhost;
GRANT SELECT ON scott.* to 'tester'@localhost;
GRANT ALL ON scott.* TO 'tester'@localhost;

REVOKE SELECT ON scott.* FROM 'tester'@localhost;

/*CREATE USER 'tester''%'@localhost
IDENTIFIED BY 'test123';*/

RENAME USER 'tester'@localhost TO tester_new; -- 修改用户名


# 修改用户名密码

DROP USER tester_new; -- 删除用户名
