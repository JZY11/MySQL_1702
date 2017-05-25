
LOAD DATA LOCAL INFILE 'C:\\Users\\Tony.Jaa\\IdeaProjects\\MySQL_1702\\src\\main\\java\\demo\\BaiduMap_cityCenter.txt'
INTO TABLE db_1712.baidumap
FIELDS TERMINATED BY ',' (loc, geo,geo1)
SET id = NULL;