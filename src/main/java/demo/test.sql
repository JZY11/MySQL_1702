
LOAD DATA LOCAL INFILE 'C:\Users\Tony.Jaa\Desktop.BaiduMap_cityCenter.txt'
INTO TABLE db_1712.baidumap
FIELDS TERMINATED BY ',' (loc, geo)
SET id = NULL;