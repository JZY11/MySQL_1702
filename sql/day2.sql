/*
SHOW DATABASES;
DROP DATABASE IF EXISTS db_1712;
# 表的全限定名：db_1712.student
# DROP TABLE db_1712.student;
CREATE DATABASE db_1712;
DROP TABLE IF EXISTS db_1712.student;
CREATE TABLE db_1712.student (
  #   字段名都建议为小写字母，后面的为数据类型
  #   给表的字段加注释放在字段语句中如：DATA COMMENT'出生日期',可解决一般的注释只能在脚本中显示，不能做在数据库表中显示出来
  # COMMENT注释    SHOW FULL COLUMNS FROM db_1712.student语句，可在数据库表中显示出来
  # 主键自增，且主键字段不能为空，值互相不能重复， 其他字段都可以为空  主键约束(建议以id作为主键)
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name   VARCHAR(255) COMMENT '名字',
  intro  TEXT COMMENT '个人简介',
  gender CHAR(2) COMMENT '性别',
  age    INT COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '体重', -- (size,d),
  price  DECIMAL(6, 2) COMMENT '钱',
  dob    DATE COMMENT '出生日期', -- data of birth
  time   DATETIME COMMENT '当前日期时间'
);

SHOW FULL COLUMNS FROM db_1712.student;

INSERT INTO db_1712.student VALUES (
    NULL ,'James','和蔼可亲','男',18.0,1.78,123.46,'1999-5-1','2017-5-16 10:39:01'
);
INSERT INTO db_1712.student VALUES (
  NULL ,'Marry','漂亮大方','女',18.0,1.65,123.46,'1999-5-1','2017-5-16 10:39:01'
);
SELECT *
FROM db_1712.student;

# 删除某个库中某个列表的一行或多行，根据主键来删除用OR连接
DELETE FROM db_1712.student
WHERE id = 2 OR id = 3 OR id = 5;
# 新建一个库
# 新建一个表table，加入字段信息
# 添加数据
# 检索
# java语言连接数据库

DROP TABLE IF EXISTS db_1712.course;
CREATE TABLE db_1712.course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '课程名',
  score DOUBLE(3,1) COMMENT '学分'
);
INSERT INTO db_1712.course VALUES (
    NULL ,'Java',4.0
);
INSERT INTO db_1712.course VALUES (
  NULL ,'PHP',3.0
);
SELECT *
FROM db_1712.course;



DROP TABLE IF EXISTS db_1712.choose;
CREATE TABLE db_1712.choose(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '学生姓名',
  course VARCHAR(255) COMMENT '选取的课程名',
  grade INT COMMENT '年级序号',
  time DATE COMMENT '入学年份'
);
INSERT INTO db_1712.choose VALUES (
    NULL ,1,2,4,'2017-09-06'
);
INSERT INTO db_1712.choose VALUES (
  NULL ,2,1,3,'2017-09-06'
);
INSERT INTO db_1712.choose VALUES (
  NULL ,1,2,3,'2017-09-06'
);
SELECT *
FROM db_1712.choose;
# 任何一个表都要有一主键约束，主键约束的含义，不能为空，不能重复
# 唯一约束 Unique 非空值不能重复
*/
