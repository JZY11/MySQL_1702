DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.user;
CREATE TABLE db_work.user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  username VARCHAR(255) NOT NULL COMMENT '用户名',
  password VARCHAR(255) NOT NULL COMMENT '密码',
  team VARCHAR(255) NOT NULL COMMENT '组别',
  role VARCHAR(255) NOT NULL DEFAULT '员工' COMMENT '角色：员工或组长'
)COMMENT '用户表';

DROP TABLE IF EXISTS db_work.log; -- 日志表
CREATE TABLE db_work.log(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT NOT NULL COMMENT '日志内容',
  time DATE NOT NULL COMMENT '日志时间',
  useID INT COMMENT 'FK 用户ID'
)COMMENT '工作日志表';

INSERT INTO db_work.user(name,password,team)VALUE ('emp1','123','第一组');
INSERT INTO db_work.user (name, password, team) VALUE ('emp2', '123', '第一组');
