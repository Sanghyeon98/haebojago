
create table member(
seq INT not null auto_increment primary KEY,
id VARCHAR(40) not null unique,
pwd VARCHAR(40) not null,
name VARCHAR(40) not null,
email VARCHAR(50) not null,
reg_time DATETIME  DEFAULT CURRENT_TIMESTAMP,
update_time DATETIME  DEFAULT CURRENT_TIMESTAMP
);

create table words(
word_id INT not null auto_increment primary key,
word VARCHAR(40) not null,
word_type varchar(20) not null,
meaning VARCHAR(100) not null,
meaning_type varchar(20) not null,
sentence  VARCHAR(3000),
reg_time DATETIME  DEFAULT CURRENT_TIMESTAMP,
update_time DATETIME  DEFAULT CURRENT_TIMESTAMP,
member_seq INT,
FOREIGN KEY (member_seq) REFERENCES member(seq)
);

INSERT INTO haebojago.`member` (id, pwd, name, email) VALUES('psh', '1234', '박상현', 'psg@asd.com');

INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES('request','en', '요구','ko', 1);
INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES( 'response','en', '응답','ko', 1);
INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES( 'peanut','en', '땅콩','ko', 1);
