# 核心功能
/*
5. 关注 follow
6. 专题 notebook
7. 收藏 collection
8. 打赏 pay
*/
DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;

# 1. 用户 user
DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  nickname   VARCHAR(15)  NOT NULL UNIQUE
  COMMENT '用户昵称',
  mobilPhone VARCHAR(255) UNIQUE
  COMMENT '手机号码',
  password   VARCHAR(255) NOT NULL
  COMMENT '密码',
  avatar VARCHAR(255) NOT NULL DEFAULT 'default_avatar.png'
)
  COMMENT '用户表';

# 2. 文集 notebook
DROP TABLE IF EXISTS db_jianshu.notebook;
CREATE TABLE db_jianshu.notebook (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) COMMENT '文集名',
  userId INT COMMENT 'FK 用户 ID'
)
  COMMENT '文集表';

# 3. 文章 note
DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note (
  id         INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content    TEXT NOT NULL
  COMMENT '内容',
  title VARCHAR(255) NOT NULL COMMENT '文章标题',
  time       DATETIME DEFAULT now()
  COMMENT '文章发布时间',
  views      INT      DEFAULT 0
  COMMENT '阅读次数',
  likes      INT      DEFAULT 0
  COMMENT '喜欢次数',
  pay INT COMMENT '打赏金额 NULL - 不需要打赏',
  notebookId INT COMMENT 'FK 文集 ID')
  COMMENT '文章表';

# 4. 评论 comment
DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment (
  id        INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content   TEXT NOT NULL
  COMMENT '评论内容',
  time      DATETIME DEFAULT now()
  COMMENT '评论时间',
  noteId    INT COMMENT 'FK 文章 ID',
  userId    INT COMMENT 'FK 用户 ID',
  commentId INT COMMENT 'FK 评论 ID'
)
  COMMENT '评论表';

# 5专题表 collection   专题与文章是多对多的关系（一个专题可以收录多个文章，一个文章可以被多个专题收录
DROP TABLE IF EXISTS db_jianshu.collection;
CREATE TABLE db_jianshu.collection (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '专题名称',
  userId INT COMMENT 'FK 用户 ID '
)
  COMMENT '专题表';

# 6专题文章表 collection_note
DROP TABLE IF EXISTS db_jianshu.collection_note;
CREATE TABLE db_jianshu.collection_note (
  collectionId INT COMMENT 'PK FK',
  noteId       INT COMMENT 'PK FK',
  PRIMARY KEY (collectionId, noteId)
)
  COMMENT '文章专题表';



# 7关注表 follow
DROP TABLE IF EXISTS db_jianshu.follow;
CREATE TABLE db_jianshu.follow (
  id                   INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  time                 DATETIME NOT NULL DEFAULT now()
  COMMENT '时间',
  useId                INT COMMENT 'FK 关注者 ID ',
  followedUserId           INT COMMENT 'FK 被关注者 ID ',
  followedNotebookId   INT COMMENT 'FK 被关注文集 ID',
  followedCollectionId INT COMMENT 'FK 被关注专题 ID'
)
  COMMENT '关注表';

# 8.收藏表 bookmark
DROP TABLE IF EXISTS db_jianshu.bookmark;
CREATE TABLE db_jianshu.bookmark (
  id                   INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  userId INT COMMENT 'FK 收藏着 Id',
  noteId INT COMMENT 'FK 被收藏文章 Id'
)COMMENT '收藏表';

# 9.打赏


# 外键

ALTER TABLE db_jianshu.notebook -- 1
  ADD CONSTRAINT
  notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);


ALTER TABLE db_jianshu.note -- 2
  ADD CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_jianshu.notebook (id);


ALTER TABLE db_jianshu.comment -- 3
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);


ALTER TABLE db_jianshu.comment -- 4
  ADD CONSTRAINT
  comment_fk_useId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);


ALTER TABLE db_jianshu.comment -- 5
  ADD CONSTRAINT
  comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment (id);

ALTER TABLE db_jianshu.collection -- 6
    ADD CONSTRAINT
collection_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.collection_note -- 7
  ADD CONSTRAINT
  collection_note_fk_collectionId
FOREIGN KEY (collectionId)
REFERENCES db_jianshu.collection(id);

ALTER TABLE db_jianshu.collection_note -- 8
  ADD CONSTRAINT
  collection_note_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note(id);

ALTER TABLE db_jianshu.follow -- 9
  ADD CONSTRAINT
  follow_fk_userId
FOREIGN KEY (useId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.follow -- 10
  ADD CONSTRAINT
  follow_fk_followedId
FOREIGN KEY (followedUserId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.follow -- 11
  ADD CONSTRAINT
  follow_fk_followedNotebookId
FOREIGN KEY (followedNotebookId)
REFERENCES db_jianshu.notebook(id);

ALTER TABLE db_jianshu.follow -- 12
  ADD CONSTRAINT
  follow_fk_followCollectionId
FOREIGN KEY (followedCollectionId)
REFERENCES db_jianshu.collection(id);

ALTER TABLE db_jianshu.bookmark
    ADD CONSTRAINT
bookmark_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.bookmark
  ADD CONSTRAINT
  bookmark_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note(id);



-- 样本数据
INSERT INTO db_jianshu.user(nickname, mobilPhone, password) VALUE ('Tom', '123', 'abc'); -- 1
INSERT INTO db_jianshu.user(nickname, mobilPhone, password) VALUE ('Jerry', '456', 'abc'); -- 2

INSERT INTO db_jianshu.notebook VALUE (NULL, 'Tom notebook', 1); -- 1
INSERT INTO db_jianshu.notebook VALUE (NULL, 'Jerry notebook', 2); -- 2

INSERT INTO db_jianshu.note (title, content, notebookId) VALUE ('Tom title...','Tom note content...', 1); -- 1


# noteId 与 commentId 不能同时存在，不能又对文章评论同时又对评论添加评论
INSERT INTO db_jianshu.comment VALUE (NULL, 'Jerry comment', '2017-6-2 10:00:00', 1, 2, NULL); -- 1 对文章发表评论
INSERT INTO db_jianshu.comment VALUE (NULL, 'Jerry comment', '2017-6-2 10:01:00', 1, 2, 1); -- 2 对评论发表评论

INSERT INTO db_jianshu.follow(useId, followedUserId) VALUE (2,1);

INSERT INTO db_jianshu.bookmark VALUE (NULL ,2,1);

SELECT *
FROM db_jianshu.user;

SELECT *
FROM db_jianshu.notebook;

SELECT *
FROM db_jianshu.note;

SELECT *
FROM db_jianshu.comment;

SELECT *
FROM db_jianshu.follow;

SELECT count(*)
FROM db_jianshu.follow
WHERE followedUserId = 1;


SELECT
  u.avatar,
  u.nickname,
  n.title,
  n.content,
  n.time,
  n.views,
  count(*) AS 评论次数, -- ？
  n.likes

FROM db_jianshu.bookmark b
  INNER JOIN db_jianshu.note n
  INNER JOIN db_jianshu.user u
  INNER JOIN db_jianshu.notebook nb
  INNER JOIN db_jianshu.comment c
ON b.noteId = n.id AND n.notebookId = nb.id AND nb.userId = u.id AND n.id = c.noteId
WHERE b.userId = 2;

SELECT count(*)     -- 直接对文章做的评论的查询以及对这篇文章直接评论又进行评论的所有数据
FROM db_jianshu.note n INNER JOIN db_jianshu.comment c
    ON n.id = c.noteId
WHERE n.id = 1;

/*SELECT *     -- 直接对文章做的评论的查询
FROM db_jianshu.note n INNER JOIN db_jianshu.comment c
ON n.id = c.noteId
WHERE n.id = 1;

SELECT count(*)
FROM db_jianshu.comment
WHERE commentId IN (-- 对这篇文章直接评论又进行评论的所有数据
  SELECT c.id
  FROM db_jianshu.note n INNER JOIN db_jianshu.comment c
      ON n.id = c.noteId
  WHERE n.id = 1
);*/

