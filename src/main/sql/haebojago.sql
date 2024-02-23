drop table words ;
drop table member; 

create table member(
seq INT not null auto_increment primary KEY,
id VARCHAR(40) not null unique,
pwd VARCHAR(40) not null,
name VARCHAR(40) not null,
email VARCHAR(50) not null,
reg_time date DEFAULT CURRENT_TIMESTAMP,
update_time date DEFAULT CURRENT_TIMESTAMP
);

create table words(
word_id INT not null auto_increment primary key,
word VARCHAR(40) not null,
word_type varchar(20) not null,
meaning VARCHAR(100) not null,
meaning_type varchar(20) not null,
sentence  VARCHAR(3000),
reg_time date DEFAULT CURRENT_TIMESTAMP,
update_time date DEFAULT CURRENT_TIMESTAMP,
member_seq INT,
FOREIGN KEY (member_seq) REFERENCES member(seq)
);

INSERT INTO haebojago.`member` (id, pwd, name, email) VALUES('psh', '1234', '박상현', 'psg@asd.com');

INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES('request','en', '요구','ko', 1);
INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES( 'response','en', '응답','ko', 1);
INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq) VALUES( 'peanut','en', '땅콩','ko', 1);
INSERT INTO haebojago.words (word,word_type, meaning,meaning_type, member_seq)
select word,word_type, meaning,meaning_type, member_seq from haebojago.words;

select count(*) from words where member_seq=1 ;

select * from `member` m ;
select * from words w ;
delete from `member` where seq != 1;
delete from words  where word_id  not in(1,2,3);


SELECT word_id, word,word_type , meaning,meaning_type, sentence, reg_time, update_time, member_seq
        FROM words
        where member_seq=1
        order by word_id desc
        limit 10, 10;