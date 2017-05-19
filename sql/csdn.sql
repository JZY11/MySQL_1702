DROP TABLE IF EXISTS db_1712.csdn;
CREATE TABLE db_1712.csdn (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID,PK',
  username VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码',
  email    VARCHAR(255) COMMENT '邮箱'
)
  COMMENT 'csdn用户表';

SELECT *
FROM db_1712.csdn;

# LOAD为导入数据最快的一种方式
LOAD DATA LOCAL INFILE '/Users/Tony.Jaa/Desktop/www.csdn.net.sql'
    INTO TABLE db_1712.csdn
FIELDS TERMINATED BY ' # '(username,password,email  )
SET id = NULL ;-- 主键我们自加的，实现自动增长