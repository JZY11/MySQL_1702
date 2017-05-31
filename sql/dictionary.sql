DROP DATABASE IF EXISTS db_dictionary;
CREATE DATABASE db_dictionary;

USE db_dictionary;

DROP TABLE IF EXISTS db_dictionary_dict;
CREATE TABLE db_dictionary_dict(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  qury VARCHAR(255) UNIQUE COMMENT '要查的单词',
  cixing VARCHAR(255) COMMENT '词性',
  Eaccent VARCHAR(255) UNIQUE COMMENT '英式音标',
  Aaccent VARCHAR(255) UNIQUE COMMENT '美式音标',
  mean VARCHAR(255) COMMENT '中文释义',
  E_C VARCHAR(255) COMMENT '英_汉' DEFAULT '英_汉'
)COMMENT '电子词典表';

INSERT INTO db_dictionary_dict VALUE (NULL ,'me','名词','[mi:]','[mi:]','我',NULL );

SELECT *
FROM db_dictionary_dict;