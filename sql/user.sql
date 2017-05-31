DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;

DROP TABLE IF EXISTS db_user_user;
CREATE TABLE db_user_user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  email VARCHAR(255) UNIQUE COMMENT '邮箱',
  username VARCHAR(255) NOT NULL COMMENT '用户名',
  password VARCHAR(255) NOT NULL COMMENT '密码',
  role VARCHAR(255) NOT NULL DEFAULT 'user' COMMENT '角色：user-用户；admin-管理员'
)COMMENT '用户表';

DROP TABLE IF EXISTS db_user_message;
CREATE TABLE db_user_message(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT NOT NULL COMMENT '内容',
  time DATETIME NOT NULL DEFAULT now() COMMENT '时间',
  userId INT NOT NULL COMMENT 'FK 用户ID'
)COMMENT '留言表';

ALTER TABLE db_user_message
    ADD CONSTRAINT
message_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_user_user(id);

-- SQL
# 1.用户注册
INSERT INTO db_user_user(email, username, password) VALUE ('tester@qq.com','Tom','123');

SELECT *
FROM db_user_user;

# 2.登录判断
SELECT *
FROM db_user_user
WHERE email = 'tester@qq.com' AND password = '123'; -- 登录判断即是看加上where行检索（email和password）时是否有返回值

# 3.发布留言(即是添加Insert语句)
INSERT INTO db_user_message(content, userId) VALUE ('留言内容1.。。',1);
INSERT INTO db_user_message(content, userId) VALUE ('留言内容2.。。',1);

SELECT *
FROM db_user_message;

# 4.添加管理员(也是添加Insert语句)
INSERT INTO db_user_user VALUE (NULL, 'admin@qq.com', 'James', '123', 'admin');
SELECT *
FROM db_user_user;

# 5.查询留言表
# 5. 查询留言列表
SELECT
  u.username,
  m.content,
  m.time
FROM db_user_user u INNER JOIN db_user_message m
    ON u.id = m.userId;

# 6. 删除留言
DELETE FROM db_user_message
WHERE id = 2;