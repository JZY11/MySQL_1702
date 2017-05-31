DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;
DROP TABLE IF EXISTS db_test_user;

USE db_test;
# 1
CREATE TABLE db_test_user (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID,PK',
  mailbox       VARCHAR(255) COMMENT '邮箱',
  accountNumber       INT COMMENT '账号',
  password VARCHAR(255) COMMENT '密码'
)COMMENT '用户表';

INSERT INTO db_test_user VALUE (NULL ,'1291813139@qq.com',1291813139,'agggdaz123');
INSERT INTO db_test_user VALUE (NULL ,'1391813139@qq.com',1391813139,'agggdaz123');
INSERT INTO db_test_user VALUE (NULL ,'1491813139@qq.com',1491813139,'agggdaz123');

SELECT *
FROM db_test_user;

SELECT accountNumber,password
FROM db_test_user;


# 2
DROP TABLE IF EXISTS db_test_leaveMessage;
CREATE TABLE db_test_leaveMessage(
  -- id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID,PK',
  ii INT COMMENT '用户昵称',
  info VARCHAR(255) COMMENT '用户留言信息',
  time  TIME COMMENT '用户留言时间'
)COMMENT '用户留言表';

INSERT INTO db_test_leaveMessage VALUE (1,'那好滴好滴发的孤儿网案例杜卡迪好的奥比岛哈','2017-01-17 10:57:30');
INSERT INTO db_test_leaveMessage VALUE (2,'加厚的藊那好滴好滴发的孤儿网案例杜卡迪好的奥比岛哈','2017-11-17 10:57:30');
INSERT INTO db_test_leaveMessage VALUE (3,'那好阏安徽的搭噶该滴好滴发的孤儿网案例杜卡迪好的奥比岛哈','2017-12-17 10:57:30');

SELECT *
FROM db_test_leaveMessage;

ALTER TABLE db_test_leaveMessage
    ADD CONSTRAINT
db_test_leaveMessage_fk_nickName
FOREIGN KEY (ii)
  REFERENCES db_test_user(id);

SELECT info
FROM db_test_leaveMessage;

DELETE FROM db_test_leaveMessage
WHERE ii = 2;

SELECT *
FROM db_test_leaveMessage;

