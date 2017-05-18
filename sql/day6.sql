DROP TABLE IF EXISTS db_1712.student;

SHOW FULL COLUMNS FROM db_1712.student;

# DML   INSERT  UPDATA  DELETE

SELECT *
FROM db_1712.student;

-- 三中INSERT插入语句
INSERT INTO db_1712.student
VALUES (NULL ,'002','tester','I\m...','F',19,1.7,1234567.890, '1998-1-2', '2017-5-18 9:01:02');


INSERT INTO db_1712.student( NAME )
VALUES ('Tom');



-- 一条语句插入多条数据
INSERT INTO db_1712.student(name)
    VALUES ('N1'),('N2'),('N3');
SHOW CREATE TABLE db_1712.student; -- 显示建表语句

-- 两种UPDATE语句
UPDATE db_1712.student
    SET gender = '女',name = 'Lucas'; -- 不加WHERE修改的是所有列

UPDATE db_1712.student
    SET height = 1.6
WHERE id = 1;-- 修改具体的列
