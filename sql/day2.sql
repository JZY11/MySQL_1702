SHOW DATABASES ;

DROP TABLE db_1712.student;
CREATE TABLE db_1712.student(
  name VARCHAR(255),
  intro TEXT,
  gender CHAR(2)
);
INSERT INTO db_1712.student VALUES (
    'Tom','sdahddbha','M'
);
SELECT *
FROM db_1712.student;