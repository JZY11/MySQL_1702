DROP DATABASE IF EXISTS db_sc;
CREATE DATABASE db_sc;

# 学生表
DROP TABLE IF EXISTS db_sc.student;
CREATE TABLE db_sc.student(
 id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) COMMENT '姓名',
  age INT COMMENT '年龄',
  gender CHAR(2) COMMENT '性别',
  dob DATE COMMENT '出生日期',
  departmentId INT COMMENT '系 ID'
)COMMENT '学生表';

# 系别表
DROP TABLE IF EXISTS db_sc.department;
CREATE TABLE db_sc.department(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '系电话',
  tel VARCHAR(255) COMMENT '电话'
)COMMENT '系别名';

# 课程表
DROP TABLE IF EXISTS db_sc.course;
CREATE TABLE db_sc.course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '课程名称',
  credit INT COMMENT '学分'
)COMMENT '课程表';

# 选课表
DROP TABLE IF EXISTS db_sc.student_course;
CREATE TABLE db_sc.student_course(
  studentId INT COMMENT 'FK 学生 ID',
  courseId INT COMMENT 'FK 课程 ID',
  score INT COMMENT '考试成绩',
  PRIMARY KEY (studentId,courseId) -- 联合主键
)COMMENT '选课表';

ALTER TABLE db_sc.student
    ADD CONSTRAINT
student_fk_departmentId
FOREIGN KEY (departmentId)
  REFERENCES db_sc.department(id);

ALTER TABLE db_sc.student_course
    ADD CONSTRAINT
student_course_fk_studentId
FOREIGN KEY (studentId)
  REFERENCES db_sc.student(id);

ALTER TABLE db_sc.student_course
    ADD CONSTRAINT
student_course_fk_courseId
FOREIGN KEY (courseId)
  REFERENCES db_sc.course(id);

INSERT INTO db_sc.department VALUES (NULL, 'CS', '12345678'), (NULL, 'EE', '12345678');
INSERT INTO db_sc.student VALUES (NULL, 'name1', 20, 'M', '1999-1-1', 1), (NULL, 'name2', 20, 'M', '1999-1-1', 2);
INSERT INTO db_sc.course VALUES (NULL, 'Java SE', 5), (NULL, 'MySQL', 4);
INSERT INTO db_sc.student_course VALUES (1, 1, NULL), (1, 2, NULL), (2, 2, NULL);

SELECT *
FROM db_sc.student;

SELECT *
FROM db_sc.department;

SELECT *
FROM db_sc.course;

SELECT *
FROM db_sc.student_course;

INSERT INTO db_sc.student_course VALUES (1, 1, NULL);-- 不可以添加，因为有联合主键

-- id = 1的学生选了哪些课？(学生表，课程表，选课表)
SELECT
  s.name,c.title
FROM db_sc.student s INNER JOIN db_sc.course c INNER JOIN db_sc.student_course sc
ON s.id = sc.courseId AND c.id = sc.courseId
WHERE s.id = 1;

-- id = 2的课程有哪些学生选
SELECT
  c.title,
  s.name
FROM db_sc.student s INNER JOIN db_sc.course c
  INNER JOIN db_sc.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId
WHERE c.id = 2;

