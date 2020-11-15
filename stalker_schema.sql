CREATE SCHEMA IF NOT EXISTS insta_stalker;

CREATE  TABLE insta_stalker.tags ( 
	id                   bigint  NOT NULL ,
	name                 varchar(50)   ,
	CONSTRAINT pk_tags_id PRIMARY KEY ( id )
 );

CREATE  TABLE insta_stalker.users ( 
	id                   bigint  NOT NULL ,
	name                 varchar(100)   ,
	description          varchar(250)   ,
	link                 text   ,
	email                varchar(50)   ,
	CONSTRAINT pk_users_id PRIMARY KEY ( id )
 );

CREATE  TABLE insta_stalker.follower_map ( 
	id                   bigint  NOT NULL ,
	target_id            bigint   ,
	follower_name        varchar(100)   ,
	CONSTRAINT pk_follower_map_id PRIMARY KEY ( id ),
	CONSTRAINT unq_follower_map_follower_name UNIQUE ( follower_name ) 
 );

CREATE  TABLE insta_stalker.posts ( 
	id                   bigint  NOT NULL ,
	createdat            timestamp(12)   ,
	content              varchar(100)   ,
	user_id              bigint   ,
	CONSTRAINT pk_posts_id PRIMARY KEY ( id )
 );

CREATE  TABLE insta_stalker.comments ( 
	id                   bigint  NOT NULL ,
	content              varchar(200)   ,
	createdat            timestamp   ,
	post_id              bigint   ,
	user_id              bigint   ,
	CONSTRAINT pk_comments_id PRIMARY KEY ( id )
 );

CREATE  TABLE insta_stalker.likes ( 
	id                   bigint  NOT NULL ,
	user_name            varchar(250)   ,
	likedat              timestamp   ,
	target_id            bigint   ,
	target_type          integer   ,
	CONSTRAINT pk_likes_id PRIMARY KEY ( id )
 );

CREATE  TABLE insta_stalker.post_map ( 
	id                   bigint  NOT NULL ,
	tag_id               bigint   ,
	post_id              bigint   ,
	CONSTRAINT pk_post_map_id PRIMARY KEY ( id )
 );

ALTER TABLE insta_stalker.comments ADD CONSTRAINT fk_comments_posts FOREIGN KEY ( post_id ) REFERENCES insta_stalker.posts( id );

ALTER TABLE insta_stalker.comments ADD CONSTRAINT fk_comments_users FOREIGN KEY ( user_id ) REFERENCES insta_stalker.users( id );

ALTER TABLE insta_stalker.follower_map ADD CONSTRAINT fk_follower_map_users FOREIGN KEY ( target_id ) REFERENCES insta_stalker.users( id );

ALTER TABLE insta_stalker.likes ADD CONSTRAINT fk_likes_posts FOREIGN KEY ( target_id ) REFERENCES insta_stalker.posts( id );

ALTER TABLE insta_stalker.likes ADD CONSTRAINT fk_likes_comments FOREIGN KEY ( target_id ) REFERENCES insta_stalker.comments( id );

ALTER TABLE insta_stalker.likes ADD CONSTRAINT fk_likes_follower_map FOREIGN KEY ( user_name ) REFERENCES insta_stalker.follower_map( follower_name );

ALTER TABLE insta_stalker.post_map ADD CONSTRAINT fk_post_map_posts FOREIGN KEY ( post_id ) REFERENCES insta_stalker.posts( id );

ALTER TABLE insta_stalker.post_map ADD CONSTRAINT fk_post_map_tags FOREIGN KEY ( tag_id ) REFERENCES insta_stalker.tags( id );

ALTER TABLE insta_stalker.posts ADD CONSTRAINT fk_posts_posts FOREIGN KEY ( user_id ) REFERENCES insta_stalker.users( id );

