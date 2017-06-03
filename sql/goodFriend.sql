DROP DATABASE IF EXISTS db_friend;
CREATE DATABASE db_friend;

DROP TABLE IF EXISTS db_friend.user;
CREATE TABLE db_friend.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name     VARCHAR(255) COMMENT '姓名',
  gender   CHAR(2) COMMENT '性别',
  dob      VARCHAR(255) COMMENT '生日',
  mobil    VARCHAR(255) COMMENT '手机号码',
  address  VARCHAR(255) COMMENT '地址',
  wechart  VARCHAR(255) COMMENT '微信',
  QQ       VARCHAR(255) COMMENT 'QQ',
  location VARCHAR(255) COMMENT '工作或者学习地点',
  hobby    VARCHAR(255) COMMENT '爱好',
  time     DATE COMMENT '认识时间',
  style    VARCHAR(255) COMMENT '认识方式',
  detail   VARCHAR(255) COMMENT '特点',
  level    INT COMMENT '亲密程度'
)
  COMMENT '好友基本信息表';

DROP TABLE IF EXISTS db_friend.message;
CREATE TABLE db_friend.message (
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  useId        INT COMMENT '好友编号 FK',
  chartTime    VARCHAR(255) COMMENT '沟通时间',
  chartStyle   VARCHAR(255) COMMENT '沟通方式',
  chartContent VARCHAR(255) COMMENT '沟通内容',
  locationNow  VARCHAR(255) COMMENT '当前地点',
  levelNow     INT COMMENT '当前亲密度'
)
  COMMENT '沟通信息表';

ALTER TABLE db_friend.message
  ADD CONSTRAINT
  db_friend_message_fk_useId
FOREIGN KEY (useId)
REFERENCES db_friend.user (id);

INSERT INTO db_friend.user VALUE (NULL ,'刘德华','M','1978-08-06','15510778715','香港','1466562','576588391','北京','拍电影','2011-6-6','面馆偶遇','没啥特点，就是人长得帅',1);

INSERT INTO db_friend.message VALUE (NULL ,1,'2016-7-5','面对面交流','简单聊下哪家的面比较正宗','美国',2);

SELECT
  u.name,
  m.chartContent,
  m.chartStyle,
  m.chartTime,
  m.locationNow,
  m.levelNow
FROM db_friend.message m INNER JOIN db_friend.user u
ON m.useId = u.id;

SELECT avg(levelNow)
FROM db_friend.message
WHERE useId = 1;