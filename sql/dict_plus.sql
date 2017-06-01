# 实现查英文显示简明释义，及词性、音标、详尽释义，例句的功能

DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.word;
CREATE TABLE db_dict.word (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english    VARCHAR(255) NOT NULL
  COMMENT '英文',
  phoneticUk VARCHAR(255) COMMENT '英语音标',
  phoneticUs VARCHAR(255) COMMENT '美语音标'
)
  COMMENT '单词表';


DROP TABLE IF EXISTS db_dict.part_of_speech;
CREATE TABLE db_dict.part_of_speech (
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  partOfSpeech VARCHAR(255) COMMENT '词性',
  wordId       INT COMMENT '单词 ID FK'
)
  COMMENT '词性表';


DROP TABLE IF EXISTS db_dict.concise;
CREATE TABLE db_dict.concise (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  conciseChinese VARCHAR(255) COMMENT '简明释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '简明释义表';


DROP TABLE IF EXISTS db_dict.detail;
CREATE TABLE db_dict.detail (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  detailChinese  VARCHAR(255) COMMENT '详尽释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '详尽释义表';


DROP TABLE IF EXISTS db_dict.sentence;
CREATE TABLE db_dict.sentence (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english        TEXT COMMENT '英语',
  chinese        TEXT COMMENT '中文',
  partOfSpeechId INT COMMENT '词性 ID FK'

)
  COMMENT '例句表';

-- test


ALTER TABLE db_dict.part_of_speech
  ADD CONSTRAINT
  part_of_speech._fk_wordId
FOREIGN KEY (wordId)
REFERENCES db_dict.word (id);

ALTER TABLE db_dict.concise
  ADD CONSTRAINT
  concise_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);

ALTER TABLE db_dict.detail
  ADD CONSTRAINT
  detail_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);

ALTER TABLE db_dict.sentence
  ADD CONSTRAINT
  sentence_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);


INSERT INTO db_dict.word VALUE (NULL, 'test', '[test]', '[test]');

INSERT INTO db_dict.part_of_speech VALUE (NULL, 'n.', 1);
INSERT INTO db_dict.part_of_speech VALUE (NULL, 'vt.', 1);

INSERT INTO db_dict.concise VALUE (NULL, '考验；试验；测试', 1);
INSERT INTO db_dict.concise VALUE (NULL, '试验；测试；接受测验', 2);

INSERT INTO db_dict.detail VALUE (NULL, '检验，化验，试验', 1);
INSERT INTO db_dict.detail VALUE (NULL, '考验', 1);
INSERT INTO db_dict.detail VALUE (NULL, '试验，测验，进行测验，测试', 2);
INSERT INTO db_dict.detail VALUE (NULL, '考验', 2);

INSERT INTO db_dict.sentence VALUE (NULL, '
We achieved within seven months an agreement that has stood the test of time.', '我们在七个月内完成一项协议,而且经受住了时间的考验。', 1);
INSERT INTO db_dict.sentence VALUE (NULL, 'e2', 'c2', 1);
INSERT INTO db_dict.sentence VALUE (NULL, 'e3', 'c3', 2);
INSERT INTO db_dict.sentence VALUE (NULL, 'e4', 'c4', 2);

SELECT
  english,
  phoneticUk,
  phoneticUs
FROM db_dict.word
WHERE english = 'test';

SELECT
  w.english,
  w.phoneticUk,
  w.phoneticUs,
  p.partOfSpeech
FROM db_dict.word w INNER JOIN db_dict.part_of_speech p
    ON w.id = p.wordId
WHERE w.english = 'test';

SELECT
  w.english,
  w.phoneticUk,
  w.phoneticUs,
  p.partOfSpeech,
  d.detailChinese
FROM db_dict.word w INNER JOIN db_dict.part_of_speech p
  INNER JOIN db_dict.detail d
    ON w.id = p.wordId AND p.id = d.partOfSpeechId
WHERE w.english = 'test';

SELECT
  w.english,
  w.phoneticUk,
  w.phoneticUs,
  p.partOfSpeech,
  c.conciseChinese,
  d.detailChinese,
  s.english,
  s.chinese
FROM db_dict.word w
  INNER JOIN db_dict.part_of_speech p
  INNER JOIN db_dict.detail d
  INNER JOIN db_dict.sentence s
  INNER JOIN db_dict.concise c
    ON w.id = p.wordId AND p.id = d.partOfSpeechId AND p.id = s.partOfSpeechId AND p.id = c.partOfSpeechId
WHERE w.english = 'test';



