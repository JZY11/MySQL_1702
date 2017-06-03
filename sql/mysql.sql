DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;

DROP TABLE IF EXISTS db_test.Student;
CREATE TABLE db_test.Student (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name       VARCHAR(255) COMMENT '【姓名',
  gender     VARCHAR(255) COMMENT '性别',
  dob        DATE COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address    VARCHAR(255) COMMENT '地址'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_test.Score;
CREATE TABLE db_test.Score (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生编号 FK',
  course    VARCHAR(255) COMMENT '课程名',
  grade     VARCHAR(255) COMMENT '考试成绩'
)
  COMMENT '分数表';


ALTER TABLE db_test.Score
  ADD CONSTRAINT
  Score_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_test.Student (id);


INSERT INTO db_test.Student VALUE (NULL, 'Mark', 'M', '1995-06-07', '计算机系', '人民路5号');
INSERT INTO db_test.Student VALUE (NULL, 'Marry', 'F', '1997-06-07', '美术系', '人民路6号');
INSERT INTO db_test.Student VALUE (NULL, '李四', 'M', '1998-06-07', '机械工程系', '向阳路5号');
INSERT INTO db_test.Student VALUE (NULL, 'Lily', 'F', '1995-06-07', '电子系', '向阳路5号');
INSERT INTO db_test.Student VALUE (NULL, 'Anni', 'F', '1995-06-07', '音乐系', '向阳路5号');

INSERT INTO db_test.Score VALUE (NULL, 1, '计算机', '96');
INSERT INTO db_test.Score VALUE (NULL, 2, '英语', '80');
INSERT INTO db_test.Score VALUE (NULL, 3, '机械设计', '97');
INSERT INTO db_test.Score VALUE (NULL, 4, '电子工程', '77');
INSERT INTO db_test.Score VALUE (NULL, 5, '音乐鉴赏', '80');

SELECT *
FROM db_test.Student;

SELECT *
FROM db_test.Student
WHERE id = 2 OR id = 4;

SELECT
  Student.id,
  Student.name,
  Student.department
FROM db_test.Student;

SELECT *
FROM db_test.Student
WHERE department = '计算机系' OR department = '电子系';

SELECT *
FROM db_test.Student
WHERE dob >= 1999 - 01 - 01 OR dob <= 1997 - 01 - 01;

SELECT count(*)
FROM db_test.Student
WHERE department = '计算机系';

SELECT count(*)
FROM db_test.Student
WHERE department = '美术系';

SELECT count(*)
FROM db_test.Student
WHERE department = '机械工程系';

SELECT count(*)
FROM db_test.Student
WHERE department = '电子系';

SELECT count(*)
FROM db_test.Student
WHERE department = '音乐系';

SELECT max(grade)
FROM db_test.Score
WHERE course = '机械设计';

SELECT max(grade)
FROM db_test.Score
WHERE course = '素描';

SELECT max(grade)
FROM db_test.Score
WHERE course = 'Java SE';

SELECT max(grade)
FROM db_test.Score
WHERE course = '电子工程';

SELECT max(grade)
FROM db_test.Score
WHERE course = '音乐鉴赏';

SELECT
  Score.course,
  Score.grade
FROM db_test.Score
WHERE studentId = 3;

SELECT *
FROM db_test.Student st INNER JOIN db_test.Score so
    ON so.studentId = st.id;

SELECT sum(grade)
FROM db_test.Score
WHERE studentId = 1;

SELECT sum(grade)
FROM db_test.Score
WHERE studentId = 2;

SELECT sum(grade)
FROM db_test.Score
WHERE studentId = 3;

SELECT sum(grade)
FROM db_test.Score
WHERE studentId = 4;

SELECT sum(grade)
FROM db_test.Score
WHERE studentId = 5;


SELECT avg(grade)
FROM db_test.Score
WHERE course = 'Java SE';

SELECT avg(grade)
FROM db_test.Score
WHERE course = '素描';

SELECT avg(grade)
FROM db_test.Score
WHERE course = 'Java SE';

SELECT avg(grade)
FROM db_test.Score
WHERE course = 'Java SE';

SELECT avg(grade)
FROM db_test.Score
WHERE course = 'Java SE';

SELECT *
FROM db_test.Student st INNER JOIN db_test.Score so
    ON so.studentId = st.id
WHERE so.course = '计算机' AND so.grade < 95;

SELECT *
FROM db_test.Student st INNER JOIN db_test.Score so
    ON so.studentId = st.id
WHERE so.course = '计算机' OR so.course = '英语';

SELECT *
FROM db_test.Score
WHERE course = '计算机'
GROUP BY grade DESC;

SELECT
  st.name,
  st.department,
  sc.course,
  sc.grade
FROM db_test.Score sc INNER JOIN db_test.Student st
    ON sc.studentId = st.id
WHERE st.name REGEXP '王%' OR st.name REGEXP '张%';

SELECT
  st.name,
  st.dob,
  st.department,
  sc.course,
  sc.grade
FROM db_test.Score sc INNER JOIN db_test.Student st
    ON sc.studentId = st.id
WHERE st.address = '湖南';


