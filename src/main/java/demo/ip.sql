DROP TABLE IF EXISTS db_1712.ip;
CREATE TABLE db_1712.ip(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  min VARCHAR(255) COMMENT '起始IP地址',
  max VARCHAR(255) COMMENT '终止IP地址',
  geo VARCHAR(255) COMMENT '地理位置'
);
# 使用JDBC程序将数据都解析出来存至数据库里，这样的数据库表就可以被各种程序共享来使用，体现了数据库相对于文件的一个优势

SELECT *
FROM db_1712.ip;

SELECT count(*)
FROM db_1712.ip;

SELECT *
FROM db_1712.ip
WHERE geo RLIKE '东明县';
