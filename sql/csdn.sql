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
LOAD DATA LOCAL INFILE 'C:\\Users\\Tony.Jaa\\Desktop\\www.csdn.net.sql'
    INTO TABLE db_1712.csdn
FIELDS TERMINATED BY ' # '(username,password,email  )
SET id = NULL ;-- 主键我们自加的，实现自动增长



# 各列值的快速模糊查询;
SELECT *
FROM db_1712.csdn
WHERE username LIKE '%tester%';

SELECT *
FROM db_1712.csdn
WHERE username LIKE '%tester%';

SELECT *
FROM db_1712.csdn
WHERE username LIKE '%test@qq.com%';
# 排名前十的密码
SELECT *
FROM db_1712.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10 OFFSET 0;-- 查询前十的密码
# 排名前十的邮箱
# 用户名和邮箱名相同的数据
# 密码可能是生日的数据
SELECT *
FROM db_1712.csdn
WHERE password REGEXP '^19[0-9]{2}0[0-9]{1}[0-3]{1}[0-9]{1}$'
UNION
SELECT *
FROM db_1712.csdn
WHERE password REGEXP '^19[0-9]{2}1[0-2]{1}[0-3]{1}[0-9]{1}$';
# 哪一年出生的用户最多

# 哪个星座的用户最多
# 密码是 QQ 号的
# 密码是手机号的
# 哪个运营商的用户最多
# 弱密码用户数据
# 短密码
# 纯数字密码
# 纯字母密码
# 强密码用户数据
# 长密码
# 字母和数字
# 含特殊符号