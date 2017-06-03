DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;

DROP TABLE IF EXISTS db_test.Student;
CREATE TABLE db_test.Student(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '【姓名',
  gender VARCHAR(255) COMMENT '性别',
  dob DATE COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address VARCHAR(255) COMMENT '地址'
)COMMENT '学生表';

DROP TABLE IF EXISTS db_test.Score;
CREATE TABLE db_test.Score(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  studentId INT COMMENT '学生编号 FK',
  course VARCHAR(255) COMMENT '课程名',
  grade VARCHAR(255) COMMENT '班级'
)COMMENT '分数表';

ALTER TABLE db_test.Score
    ADD CONSTRAINT
Score_fk_studentId
PRIMARY KEY (studentId)
