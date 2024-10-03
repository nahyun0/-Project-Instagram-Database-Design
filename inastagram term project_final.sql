# .gitattributes 파일 내용
*.sql linguist-detectable=true
*.sql linguist-language=sql
  
# 최종
create database insta8;
use insta8;

show tables;

create table user(
insta_id varchar(30) not null,
email varchar(30) not null,
primary key(insta_id, email),
foreign key(email) references user_info(email) 
on update cascade on delete cascade
);

create table user_info(
email varchar(30) not null,
password varchar(20) not null,
nickname varchar(30),
phone_number varchar(15),
gender varchar(1),
birth int,
profile_image varchar(250),
primary key(email)
);

create table follower(
insta_id varchar(30) not null,
follower_id varchar(30),
primary key(insta_id, follower_id),
foreign key(insta_id) references user(insta_id)
on update cascade on delete cascade
);

create table following(
insta_id varchar(30) not null,
following_id varchar(30),
primary key(insta_id, following_id),
foreign key(insta_id) references user(insta_id) on update cascade on delete cascade
);
drop table following;

create table post(
post_id int not null,
content varchar(1000),
location varchar(50),
insta_id varchar(30) not null,
primary key(post_id),
foreign key(insta_id) references user(insta_id) on update cascade on delete cascade
);

create table image(
post_image varchar(250) not null,
post_id int not null,
primary key(post_image, post_id),
foreign key(post_id) references post(post_id)
);
drop table image;

create table hashtag(
hashtag_name varchar(30),
post_id int not null,
primary key(post_id),
foreign key(post_id) references post(post_id)
);

create table user_post_tag(
post_id int not null,
insta_id varchar(30) not null,
tag_user varchar(30),
primary key(post_id),
foreign key(post_id) references post(post_id),
foreign key(insta_id) references user(insta_id) on update cascade on delete cascade
);

create table user_post_like(
post_id int not null,
insta_id varchar(30) not null,
like_num int,
primary key(post_id),
foreign key(post_id) references post(post_id),
foreign key(insta_id) references user(insta_id) on update cascade on delete cascade
);

create table comment(
post_id int not null,
insta_id varchar(30) not null,
reply varchar(1000),
primary key(post_id),
foreign key(post_id) references post(post_id),
foreign key(insta_id) references user(insta_id) on update cascade on delete cascade
);

desc user_info;
insert into user_info values
("dahye411@naver.com", "abcd2580", "김다혜", "010-4321-8765", "F", 20030101, "https://i.imgur.com/CYVvv0E.png"),
("skqhd477@naver.com", "abc6789", "김나현", "010-3659-7229", "F", 20031108, "https://i.imgur.com/CYVvv0E.png"),
("5876675@naver.com", "680900", "조혜원", "010-9408-7674", "F", 20030211, "https://i.imgur.com/CYVvv0E.png"),
("haebin0424@naver.com", "319424", "한해빈", "010-2243-5766", "F", 20010424, "https://i.imgur.com/CYVvv0E.png"),
("cosge0227@naver.com", "gaeunii", "서가은", "010-9482-7957", "F", 20030227, "https://i.imgur.com/CYVvv0E.png");

insert into user values
("dahye_411", "dahye411@naver.com"),
("hyun_12", "skqhd477@naver.com"),
("oellhwxn", "5876675@naver.com"),
("i_have._.been", "haebin0424@naver.com"),
("_02.27__sg", "cosge0227@naver.com");

insert into follower values
("dahye_411", "_02.27__sg"),
("dahye_411", "hyun_12"),
("hyun_12", "dahye_411"),
("hyun_12", "oellhwxn"),
("oellhwxn", "dahye_411"),
("_02.27__sg", "dahye_411"),
("_02.27__sg", "oellhwxn"),
("_02.27__sg", "hyun_12");

insert into following values
("dahye_411", "_02.27__sg"),
("dahye_411", "oellhwxn"),
("dahye_411", "hyun_12"),
("hyun_12", "_02.27__sg"),
("hyun_12", "dahye_411"),
("oellhwxn", "_02.27__sg"),
("oellhwxn", "hyun_12"),
("_02.27__sg", "dahye_411");


insert into post values
(2468, "겨울이야 눈이야 눈!!!", "가천대학교 AI공학관", "dahye_411"),
(1010, "휴가 다녀 온 날! 바다 보고 왔다!", "해운대 해수욕장", "hyun_12"),
(1, "티원 월즈 우승을 내 두 눈으로 보다니,,", "고척돔", "oellhwxn"),
(424, "애착돌이랑..♡", "더현대", "i_have._.been"),
(8282, "가을아 가지마😭🍂", "경기도 성남시", "_02.27__sg");


insert into image values
("https://i.imgur.com/XG6uoXU.png", 2468), 
("https://i.imgur.com/uZioWG4.png", 1010),
("https://i.imgur.com/X41XLTg.jpg", 1),
("https://i.imgur.com/4PwkB2b.jpg", 424),
("https://i.imgur.com/dh8c4SE.jpg", 8282),
("https://i.imgur.com/XLiq1T5.jpg", 8282);
drop table image;

insert into hashtag values
("#겨울 #눈", 2468),
("#부산 #바다", 1010),
("#T1 #2023_Worlds #T1우승 #제오페구케", 1),
("#크리스마스 #내년도♡", 424),
("#바람개비동산 #낙엽", 8282);

insert into user_post_tag values
(2468, "dahye_411", "_042.27__sg"),
(1010, "hyun_12", "dahye_411"),
(1, "oellhwxn", "i_have_been"),
(424, "i_have._.been", null),
(8282, "_02.27__sg", "chaerryy_jubilee");

insert into user_post_like values
(2468, "dahye_411", 5),
(1010, "hyun_12", 4),
(1, "oellhwxn", 1),
(424, "i_have._.been", 3),
(8282, "_02.27__sg", 101);

insert into comment values
(2468, "hyun_12", "눈사람 이쁘다~"),
(1010,"oellhwxn", "바다 이쁘네!! 안 추웠어??"),
(1, "_02.27__sg", "우제야 우승 축하해 ^~^"),
(424, "oellhwxn", "다음에 우제랑 더블데이트 가자^~^"),
(8282, "oellhwxn", "귀하다 이 여자의 게시물");

select * from user;
select * from user_info;
select * from follower;
select * from following;
select * from post;
select * from image;
select * from hashtag;
select * from user_post_tag;
select * from user_post_like;
select * from comment;
select * from user join user_info 
join follower 
join following 
join post 
join image 
join hashtag
join user_post_tag 
join user_post_like 
join comment where insta_id = "i_have._.been";

