DROP DATABASE IF EXISTS db_exam;
CREATE DATABASE db_exam;

DROP TABLE IF EXISTS db_exam.student;
CREATE TABLE db_exam.student (
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name         VARCHAR(255) COMMENT '学生姓名',
  age          INT COMMENT '学生年龄',
  gender       CHAR(2) COMMENT '学生性别',
  dob          DATE COMMENT '学生出生日期',
  departmentId INT COMMENT '系编号'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_exam.department;
CREATE TABLE db_exam.department (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '系名称',
  tel   INT COMMENT '系电话'
)
  COMMENT '系别表';

DROP TABLE db_exam.course;
CREATE TABLE db_exam.course (


  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) COMMENT '课程名称',
  credit INT COMMENT '学分'
)
  COMMENT '课程表';

DROP TABLE db_exam.student_course;
CREATE TABLE db_exam.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生编号',
  courseId  INT COMMENT '课程编号',
  grade     INT COMMENT '考试成绩'
)
  COMMENT '选课表';

ALTER TABLE db_exam.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES student (id);

ALTER TABLE db_exam.course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES course (id);

SELECT *
FROM db_exam.course;

SELECT *
FROM db_exam.department;

SELECT *
FROM db_exam.student;

SELECT *
FROM db_exam.student_course;


INSERT INTO db_exam.student VALUES (NULL ,'王猛',18,'男','1999-02-28',1);
INSERT INTO db_exam.student VALUES (NULL ,'王谦',18,'男','1999-02-28',1);
INSERT INTO db_exam.student VALUES (NULL ,'LIli',19,'女','1998-02-28',3);
INSERT INTO db_exam.student VALUES (NULL ,'May',20,'女','1997-03-28',2);
INSERT INTO db_exam.student VALUES (NULL ,'李磊',25,'男','1992-04-28',3);

INSERT INTO db_exam.department VALUES (NULL ,'计算机',5675625);
INSERT INTO db_exam.department VALUES (NULL ,'美术',5675635);
INSERT INTO db_exam.department VALUES (NULL ,'机械',5675645);
INSERT INTO db_exam.department VALUES (NULL ,'学前教育',5675655);
INSERT INTO db_exam.department VALUES (NULL ,'体育',5675665);

INSERT INTO db_exam.course VALUES (NULL,'计算机基础',2);
INSERT INTO db_exam.course VALUES (NULL,'高等数学',3);
INSERT INTO db_exam.course VALUES (NULL,'大学英语',3);
INSERT INTO db_exam.course VALUES (NULL,'Java高级编程',4);
INSERT INTO db_exam.course VALUES (NULL,'Linux基础汇编',2);

INSERT INTO db_exam.student_course VALUES (NULL ,11,2,61);
INSERT INTO db_exam.student_course VALUES (NULL ,17,1,65);
INSERT INTO db_exam.student_course VALUES (NULL ,15,3,66);
INSERT INTO db_exam.student_course VALUES (NULL ,13,1,71);
INSERT INTO db_exam.student_course VALUES (NULL ,12,3,81);

UPDATE db_exam.course
    SET credit = 'score';

SELECT *
FROM db_exam.student
WHERE name LIKE '王%';

DROP TABLE db_exam.student_course;
DROP TABLE db_exam.student;
DROP TABLE db_exam.department;
DROP TABLE db_exam.course;
DROP DATABASE db_exam;