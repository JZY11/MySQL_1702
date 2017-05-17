SHOW DATABASES ;
USE db_1712;
SHOW TABLES;

SHOW FULL COLUMNS FROM db_1712.student;
SHOW FULL COLUMNS FROM db_1712.course;
SHOW FULL COLUMNS FROM db_1712.student_course;


SELECT *
FROM db_1712.student;

SELECT *
FROM db_1712.course;


SELECT *
FROM db_1712.student_course;

TRUNCATE TABLE db_1712.student_course;

DELETE FROM db_1712.course
WHERE id > 2;

INSERT INTO db_1712.student VALUES (NULL ,'20170001','Tom','shdfhb',NULL ,NULL ,1234567.891, '1999-5-1', '2017-5-1 1:39:01');

-- 选课表 学生<->课程
DROP TABLE IF EXISTS db_1712.student_course;
CREATE TABLE db_1712.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
);

-- alter 改变    也是DDL语句
ALTER TABLE db_1712.student_course -- 为studentId 添加外键约束
  ADD CONSTRAINT fk_student_course_studentId
FOREIGN KEY (studentId) REFERENCES db_1712.student(id)
ON DELETE CASCADE ;-- 级联  删除主表数据


ALTER TABLE db_1712.student_course -- 为courseId添加外键约束
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_1712.course (id);

SHOW FULL COLUMNS FROM db_1712.student_course;

INSERT INTO db_1712.student_course
VALUES (NULL, 1, 1, NULL);

INSERT INTO db_1712.student_course
VALUES (NULL, 1, 2, NULL);

INSERT INTO db_1712.student_course
VALUES (NULL, 1, 3, NULL);

INSERT INTO db_1712.student_course
VALUES (NULL, 3, 2, NULL);

SELECT *
FROM student_course;

DELETE FROM db_1712.course
WHERE id = 1;

DELETE FROM db_1712.student;

SELECT *
FROM db_1712.student;

SELECT *
FROM db_1712.course;

DELETE FROM db_1712.course
  WHERE id > 2;

TRUNCATE TABLE db_1712.student_course;


DELETE FROM db_1712.student;





DROP TABLE IF EXISTS db_1712.test;
CREATE TABLE db_1712.test(
  id INT AUTO_INCREMENT PRIMARY KEY  COMMENT 'ID PK',
  col VARCHAR(255) COMMENT 'test new'
);
ALTER TABLE db_1712.test
    RENAME db_1712.test_new;
SHOW TABLES ;