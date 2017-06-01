# 仿 http://dict.cn/ 设计一个简单的在线电子词典数据库表结构
# 实现从英文查中文，从中文查英文功能

DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.english;
CREATE TABLE db_dict.english(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  word VARCHAR(255) COMMENT '英文单词'
)COMMENT '英文表';

DROP TABLE IF EXISTS db_dict.chinese;
CREATE TABLE db_dict.chinese(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  definition VARCHAR(255) COMMENT '释义'
)COMMENT '中文表';

DROP TABLE IF EXISTS db_dict.english_chinese;
CREATE TABLE db_dict.english_chinese( -- 关联表
  englishId INT COMMENT '英文ID FK',
  chineseId INT COMMENT '中文ID FK',
  PRIMARY KEY (englishId,chineseId)
)COMMENT '英文中文关联表';

ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
english_chinese_fk_englishId
FOREIGN KEY (englishId)
  REFERENCES db_dict.english(id);

ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
english_chinese_fk_chineseID
FOREIGN KEY (chineseId)
  REFERENCES db_dict.chinese(id);

INSERT INTO db_dict.chinese VALUE (NULL ,'苹果');
INSERT INTO db_dict.english VALUE (NULL ,'apple');
INSERT INTO db_dict.english VALUE (NULL ,'biffin');

INSERT INTO db_dict.english_chinese VALUE (1,1);
INSERT INTO db_dict.english_chinese VALUE (2,1);-- 关联表数据

SELECT c.definition  -- 做三个表放的联合查询
FROM db_dict.english e INNER JOIN db_dict.chinese c INNER JOIN db_dict.english_chinese ec
ON e.id = ec.englishId AND c.id = ec.chineseId  -- ON关联条件
WHERE e.word = 'apple';

SELECT e.word
FROM db_dict.english e INNER JOIN db_dict.chinese c INNER JOIN db_dict.english_chinese ec
    ON e.id = ec.englishId AND c.id = ec.chineseId  -- ON关联条件
WHERE c.definition = '苹果';



-- apple 苹果
/*
english - chinese 1:n
chinese - english 1:n
n:n(多对多)，需要再多加一个表来表示单词与释义之间的多对多的关系
 */