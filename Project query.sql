CREATE TABLE user (
                      id BIGINT not null,
                      name VARCHAR(20) not null,
                      pw VARCHAR(20) not null,
                      status VARCHAR(10) null,
                      point int not null,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      inactive_date DATETIME(6) null,
                      PRIMARY KEY (id)
);

CREATE TABLE user_info (
	id BIGINT not null,
	user_id BIGINT not null unique,
    profile_picture_url varchar(255) not null,
	email VARCHAR(20) not null,
	locate VARCHAR(20) not null,
	gender smallint not null,
	birth VARCHAR(20) not null,
	phone_num VARCHAR(20) not null,
    phone_num_certificated BOOLEAN not null,
	nickname VARCHAR(50) null default 'NICKNAME123',
	craeted_time DATETIME(6) not null,
	updated_time DATETIME(6) not null,
	PRIMARY KEY (id),
    foreign key (user_id) references user(id)
);

#SNS 로그인 시 정보 저장 테이블
CREATE TABLE user_token (
                            id BIGINT not null,
                            user_id BIGINT not null ,
                            access_token VARCHAR(255) not null ,
                            refresh_token VARCHAR(255) not null ,
                            craeted_time DATETIME(6) not null,
                            updated_time DATETIME(6) not null,
                            category VARCHAR(50) not null ,
                            primary key (id),
                            foreign key (user_id) references user(id)
);

CREATE Table term(
                     id bigint not null ,
                     user_id bigint not null ,
                     name varchar(50) not null ,
                     term_url varchar(255) not null ,
                     craeted_time DATETIME(6) not null,
                     updated_time DATETIME(6) not null,
                     essential boolean not null ,
                     primary key (id)
);

#매핑테이블
CREATE TABLE user_term (
                           user_id bigint not null ,
                           term_id bigint not null ,
                           craeted_time DATETIME(6) not null,
                           updated_time DATETIME(6) not null,
                           agreed boolean not null ,
                           foreign key (user_id) references user(id),
                           foreign key (term_id) references term(id)
);

drop table if exists food_category;
CREATE TABLE food_category(
                              id bigint not null ,
                              name varchar(50) not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id)
);

drop table if exists region;
create table region(
                       id bigint not null ,
                       name varchar(20) not null ,
                       craeted_time DATETIME(6) not null,
                       updated_time DATETIME(6) not null,
                       primary key (id)
);

drop table if exists store;
create table store(
                      id bigint not null ,
                      name varchar(50) not null,
                      region_id bigint not null ,
                      food_category_id bigint not null ,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      primary key (id),
                      foreign key (region_id) references region(id),
                      foreign key (food_category_id) references food_category(id)
);

drop table if exists store_picture;
create table store_picture(
                              id bigint not null ,
                              store_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id),
                              foreign key (store_id) references store(id)
);

drop table if exists prefer_food;
create TABLE prefer_food(
                            user_id bigint not null ,
                            food_category_id bigint not null ,
                            craeted_time DATETIME(6) not null,
                            updated_time DATETIME(6) not null,
                            foreign key (user_id) references user(id),
                            foreign key (food_category_id) references food_category(id)
);

drop table if exists mission;
CREATE TABLE mission(
                        id bigint not null ,
                        store_id bigint not null ,
                        name varchar(50) not null ,
                        payment int not null,
                        craeted_time DATETIME(6) not null,
                        updated_time DATETIME(6) not null,
                        point int not null,
                        primary key (id),
                        foreign key (store_id) references store(id)
);

drop table if exists user_mission;
CREATE TABLE user_mission(
                             user_id bigint not null ,
                             mission_id bigint not null ,
                             craeted_time DATETIME(6) not null,
                             updated_time DATETIME(6) not null,
                             is_completed boolean	not null,
                             foreign key (user_id) references user(id),
                             foreign key (mission_id) references mission(id)
);

drop table if exists review;
CREATE TABLE review(
                       id bigint not null ,
                       user_id bigint not null ,
                       store_id bigint not null ,
                       score int not null ,
                       text text not null ,
                       craeted_time DATETIME(6) not null,
                       updated_time DATETIME(6) not null,
                       primary key (id),
                       foreign key (user_id) references user(id),
                       foreign key (store_id) references store(id)
);

drop table if exists user_review;
CREATE TABLE user_review(
                            user_id bigint not null ,
                            review_id bigint not null ,
                            craeted_time DATETIME(6) not null,
                            updated_time DATETIME(6) not null,
                            foreign key(user_id) references user(id),
                            foreign key (review_id) references review(id)
);

drop table if exists inquiry;
CREATE TABLE inquiry(
                        id bigint not null ,
                        user_id bigint not null ,
                        craeted_time DATETIME(6) not null,
                        updated_time DATETIME(6) not null,
                        title varchar(50) not null ,
                        text text not null ,
                        is_completed boolean not null ,
                        type tinyint not null , #int로 type 지정
                        primary key (id),
                        foreign key (user_id) references user(id)
);

drop table if exists inquiry_picture;
create table inquiry_picture(
                                id bigint not null ,
                                inquiry_id bigint not null ,
                                pirture varchar(255) not null ,
                                craeted_time DATETIME(6) not null,
                                updated_time DATETIME(6) not null,
                                primary key (id),
                                foreign key (inquiry_id) references inquiry(id)
);

drop table if exists mission_inquiry;
create table mission_inquiry(
                                inquiry_id bigint not null ,
                                mission_id bigint not null ,
                                craeted_time DATETIME(6) not null,
                                updated_time DATETIME(6) not null,
                                foreign key (inquiry_id) references inquiry(id),
                                foreign key (mission_id) references mission(id)
);

drop table if exists review_inquiry;
create table review_inquiry(
                               inquiry_id bigint not null ,
                               review_id bigint not null ,
                               craeted_time DATETIME(6) not null,
                               updated_time DATETIME(6) not null,
                               foreign key (inquiry_id) references inquiry(id),
                               foreign key (review_id) references review(id)
);

drop table if exists event_inquiry;
create table event_inquiry(
                              id bigint not null ,
                              inquiry_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id),
                              foreign key (inquiry_id) references inquiry(id)
);

drop table if exists alert;
create table alert(
                      id bigint not null ,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      primary key (id)
);

drop table if exists user_alert;
create table user_alert(
                           user_id bigint not null ,
                           alert_id bigint not null ,
                           craeted_time DATETIME(6) not null,
                           updated_time DATETIME(6) not null,
                           foreign key (user_id) references user(id),
                           foreign key (alert_id) references alert(id)
);

drop table if exists mission_alert;
create table mission_alert(
                              alert_id bigint not null ,
                              mission_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              foreign key (alert_id) references alert(id),
                              foreign key (mission_id) references mission(id)
);

drop table if exists review_alert;
create table review_alert(
                             alert_id bigint not null ,
                             review_id bigint not null ,
                             craeted_time DATETIME(6) not null,
                             updated_time DATETIME(6) not null,
                             foreign key (alert_id) references alert(id),
                             foreign key (review_id) references review(id)
);

drop table if exists event_alert;
create table event_alert(
                              id bigint not null ,
                              alert_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              foreign key (alert_id) references alert(id),
                              primary key (id)
);





