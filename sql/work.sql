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

ALTER TABLE db_work.log
    ADD CONSTRAINT
log_fk_userId     -- 添加外键
FOREIGN KEY (useID)
  REFERENCES db_work.user(id);

INSERT INTO db_work.user(username,password,team)VALUE ('emp1','123','第一组');
INSERT INTO db_work.user (username, password, team) VALUE ('emp2', '123', '第一组');
INSERT INTO db_work.user (username, password, team) VALUE ('emp3', '123', '第二组');
INSERT INTO db_work.user (username, password, team) VALUE ('emp4', '123', '第一组');
INSERT INTO db_work.user (username, password, team, role) VALUE ('team_leader1', '123', '第一组','组长');
INSERT INTO db_work.user (username, password, team, role) VALUE ('team_leader2', '123', '第一组','组长');

INSERT INTO db_work.log VALUE (NULL ,'content1 1','2017-5-21',1);
INSERT INTO db_work.log VALUE (NULL ,'content1 2','2017-6-1',1);
INSERT INTO db_work.log VALUE (NULL ,'content2 1','2017-5-31',2);
INSERT INTO db_work.log VALUE (NULL ,'content2 2','2017-5-21',2);
INSERT INTO db_work.log VALUE (NULL ,'content3 1','2017-5-21',3);
INSERT INTO db_work.log VALUE (NULL ,'content4 1','2017-5-21',4);
INSERT INTO db_work.log VALUE (NULL ,'content5 1','2017-5-21',5);

-- 注册

-- 登录
SELECT *
FROM db_work.user
WHERE username= '' AND password = '';

-- 员工查看自己的日志
SELECT content
FROM db_work.log
WHERE useID = 1;

-- 组长查看本组的日志
SELECT u.username,l.time,l.content
FROM db_work.user u LEFT OUTER JOIN db_work.log l -- 左外联结*** 显示左表的落选记录
ON u.id = l.useID                                  -- 两个表有关联，有关联条件ON
WHERE u.team = '第一组';


SELECT u.username,l.time,l.content
FROM db_work.user u LEFT OUTER JOIN db_work.log l -- 左外联结***
    ON u.id = l.useID
WHERE u.team = '第一组' AND u.username = 'emp4';


SELECT
  u.username,
  l.time,
  l.content
FROM db_work.user u LEFT OUTER JOIN db_work.log l -- 左外联结***
    ON u.id = l.useID
WHERE u.team = '第一组' AND l.time = '2017-6-1';


SELECT
  u.username,
  l.time,
  l.content
FROM db_work.user u LEFT OUTER JOIN db_work.log l -- 左外联结***
    ON u.id = l.useID
WHERE u.team = '第一组' AND l.time = '2017-5-31' AND u.username = 'emp2';

