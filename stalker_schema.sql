CREATE SCHEMA IF NOT EXISTS insta_stalker;

CREATE  TABLE insta_stalker.tag ( 
	tag_id               bigint  NOT NULL ,
	name                 varchar(50)   ,
	CONSTRAINT pk_tags_id PRIMARY KEY ( tag_id )
 );

CREATE  TABLE insta_stalker.tbl ( 
 );

CREATE  TABLE insta_stalker."user" ( 
	user_id              bigint  NOT NULL ,
	name                 varchar(100)   ,
	description          varchar(250)   ,
	link                 text   ,
	email                varchar(50)   ,
	CONSTRAINT pk_users_id PRIMARY KEY ( user_id )
 );

CREATE  TABLE insta_stalker.follower_map ( 
	follower_id          bigint  NOT NULL ,
	user_id              bigint   ,
	CONSTRAINT pk_follower_map_id PRIMARY KEY ( follower_id )
 );

CREATE  TABLE insta_stalker.post ( 
	post_id              bigint  NOT NULL ,
	createdat            timestamp(12)   ,
	content              varchar(100)   ,
	user_id              bigint   ,
	CONSTRAINT pk_posts_id PRIMARY KEY ( post_id )
 );

CREATE  TABLE insta_stalker.post_like ( 
	post_like_id         bigint  NOT NULL ,
	post_id              bigint   ,
	likedat              timestamp   ,
	user_id              bigint   ,
	CONSTRAINT pk_post_like_post_like_id PRIMARY KEY ( post_like_id )
 );

CREATE  TABLE insta_stalker.post_map ( 
	tag_id               bigint   ,
	post_id              bigint   
 );

CREATE  TABLE insta_stalker."comment" ( 
	comment_id           bigint  NOT NULL ,
	content              varchar(200)   ,
	createdat            timestamp   ,
	post_id              bigint   ,
	user_id              bigint   ,
	parent_comment_id    bigint   ,
	CONSTRAINT pk_comments_id PRIMARY KEY ( comment_id )
 );

CREATE  TABLE insta_stalker.comment_like ( 
	comment_like_id      bigint  NOT NULL ,
	comment_id           bigint   ,
	likedat              timestamp   ,
	user_id              bigint   ,
	CONSTRAINT pk_likes_id PRIMARY KEY ( comment_like_id )
 );

CREATE  TABLE insta_stalker.comment_map ( 
	comment_id           bigint   ,
	tag_id               bigint   
 );

ALTER TABLE insta_stalker."comment" ADD CONSTRAINT fk_comments_posts FOREIGN KEY ( post_id ) REFERENCES insta_stalker.post( post_id );

ALTER TABLE insta_stalker."comment" ADD CONSTRAINT fk_comments_users FOREIGN KEY ( user_id ) REFERENCES insta_stalker."user"( user_id );

ALTER TABLE insta_stalker.comment_like ADD CONSTRAINT fk_comment_like_comment FOREIGN KEY ( comment_id ) REFERENCES insta_stalker."comment"( comment_id );

ALTER TABLE insta_stalker.comment_like ADD CONSTRAINT fk_comment_like_user FOREIGN KEY ( user_id ) REFERENCES insta_stalker."user"( user_id );

ALTER TABLE insta_stalker.comment_map ADD CONSTRAINT fk_comment_map_comment FOREIGN KEY ( comment_id ) REFERENCES insta_stalker."comment"( comment_id );

ALTER TABLE insta_stalker.comment_map ADD CONSTRAINT fk_comment_map_tag FOREIGN KEY ( tag_id ) REFERENCES insta_stalker.tag( tag_id );

ALTER TABLE insta_stalker.follower_map ADD CONSTRAINT fk_follower_map_user FOREIGN KEY ( user_id ) REFERENCES insta_stalker."user"( user_id );

ALTER TABLE insta_stalker.post ADD CONSTRAINT fk_posts_posts FOREIGN KEY ( user_id ) REFERENCES insta_stalker."user"( user_id );

ALTER TABLE insta_stalker.post_like ADD CONSTRAINT fk_post_like_user FOREIGN KEY ( user_id ) REFERENCES insta_stalker."user"( user_id );

ALTER TABLE insta_stalker.post_like ADD CONSTRAINT fk_post_like_post FOREIGN KEY ( post_id ) REFERENCES insta_stalker.post( post_id );

ALTER TABLE insta_stalker.post_map ADD CONSTRAINT fk_post_map_posts FOREIGN KEY ( post_id ) REFERENCES insta_stalker.post( post_id );

ALTER TABLE insta_stalker.post_map ADD CONSTRAINT fk_post_map_tags FOREIGN KEY ( tag_id ) REFERENCES insta_stalker.tag( tag_id );

