# 核心功能
/*
5. 关注 follow
6. 专题 topic
7. 收藏 collection
8. 打赏 pay
*/


DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;

# 1. 用户 user
DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  nickname VARCHAR(15) NOT NULL UNIQUE COMMENT '用户昵称',
  mobilPhone VARCHAR(255) UNIQUE COMMENT '手机号码',
  password VARCHAR(255) NOT NULL COMMENT '密码'
)COMMENT '用户表';

# 2. 文集 notebook
DROP TABLE IF EXISTS db_jianshu.notebook;
CREATE TABLE db_jianshu.notebook(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '文集名',
  userId INT COMMENT 'FK 用户 ID'
)COMMENT '文集表';

# 3. 文章 note
DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT NOT NULL COMMENT '内容',
  time DATETIME DEFAULT now()COMMENT '文章发布时间',
  views INT DEFAULT 0 COMMENT '阅读次数',
  likes INT DEFAULT 0 COMMENT '喜欢次数',
  notebookId INT COMMENT 'FK 文集 ID'
)COMMENT '文章表';

# 4. 评论 comment
DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT NOT NULL COMMENT '评论内容',
  time DATETIME DEFAULT now() COMMENT '评论时间',
  noteId INT COMMENT 'FK 文章 ID',
  userId INT COMMENT 'FK 用户 ID',
  commentId INT COMMENT 'FK 评论 ID'
)COMMENT '评论表';

# 外键

ALTER TABLE db_jianshu.notebook
    add CONSTRAINT
  notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user(id);


ALTER TABLE db_jianshu.note
add CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_jianshu.notebook(id);


ALTER TABLE db_jianshu.comment
  add CONSTRAINT
comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note(id);


ALTER TABLE db_jianshu.comment
add CONSTRAINT
comment_fk_useId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user(id);


ALTER TABLE db_jianshu.comment
  add CONSTRAINT
comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment(id);


INSERT INTO db_jianshu.user VALUE (NULL ,'Tom','123','abc'); -- 1
INSERT INTO db_jianshu.user VALUE (NULL ,'Jerry','456','abc'); -- 2

INSERT INTO db_jianshu.notebook VALUE (NULL ,'Tom notebook',1); -- 1
INSERT INTO db_jianshu.notebook VALUE (NULL ,'Jerry notebook',2); -- 2

INSERT INTO db_jianshu.note (content, notebookId) VALUE ('Tom note content...',1); -- 1


# noteId 与 commentId 不能同时存在，不能又对文章评论同时又对评论添加评论
INSERT INTO db_jianshu.comment VALUE (NULL ,'Jerry comment','2017-6-2 10:00:00',1,2,NULL ); -- 1 对文章发表评论
INSERT INTO db_jianshu.comment VALUE (NULL ,'Jerry comment','2017-6-2 10:01:00',NULL ,2, 1); -- 2 对评论发表评论

SELECT *
FROM db_jianshu.user;

SELECT *
FROM db_jianshu.notebook;

SELECT *
FROM db_jianshu.note;

SELECT *
FROM db_jianshu.comment;

