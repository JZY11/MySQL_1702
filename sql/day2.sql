SHOW DATABASES ;

DROP TABLE db_1712.student;
CREATE TABLE db_1712.student (
  name   VARCHAR(255),
  intro  TEXT,
  gender CHAR(2),
  age int,
  height DOUBLE(3,2),
  price DECIMAL(6,2),
  dob DATE,    -- data of birth
  time DATETIME
);

INSERT INTO db_1712.student VALUES (
    'Tom','sdahddbha','M',18.0,1.7,123.46,'1999-5-1','2017-5-16-10-39-01'
);
SELECT *
FROM db_1712.student;