CREATE TABLE user (
                      id BIGINT not null,
                      name VARCHAR(20) not null,
                      email VARCHAR(20) not null,
                      pw VARCHAR(20) not null,
                      locate VARCHAR(20) not null,
                      gender smallint not null,
                      birth VARCHAR(20) not null,
                      phone_num VARCHAR(20) not null,
                      status VARCHAR(10) null,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      inactive_date DATETIME(6) null,
                      PRIMARY KEY (id)
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

CREATE TABLE food_category(
                              id bigint not null ,
                              name varchar(50) not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id)
);

create TABLE prefer_food(
                            user_id bigint not null ,
                            food_category_id bigint not null ,
                            craeted_time DATETIME(6) not null,
                            updated_time DATETIME(6) not null,
                            foreign key (user_id) references user(id),
                            foreign key (food_category_id) references food_category(id)
);

CREATE TABLE mission(
                        id bigint not null ,
                        store_id bigint not null ,
                        name varchar(50) not null ,
                        craeted_time DATETIME(6) not null,
                        updated_time DATETIME(6) not null,
                        primary key (id),
                        foreign key (store_id) references store(id)
);

CREATE TABLE user_mission(
                             user_id bigint not null ,
                             mission_id bigint not null ,
                             craeted_time DATETIME(6) not null,
                             updated_time DATETIME(6) not null,
                             foreign key (user_id) references user(id),
                             foreign key (mission_id) references mission(id)
);

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

CREATE TABLE user_review(
                            user_id bigint not null ,
                            review_id bigint not null ,
                            craeted_time DATETIME(6) not null,
                            updated_time DATETIME(6) not null,
                            foreign key(user_id) references user(id),
                            foreign key (review_id) references review(id)
);

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

create table inquiry_picture(
                                id bigint not null ,
                                inquiry_id bigint not null ,
                                pirture varchar(255) not null ,
                                craeted_time DATETIME(6) not null,
                                updated_time DATETIME(6) not null,
                                primary key (id),
                                foreign key (inquiry_id) references inquiry(id)
);

create table mission_inquiry(
                                inquiry_id bigint not null ,
                                mission_id bigint not null ,
                                craeted_time DATETIME(6) not null,
                                updated_time DATETIME(6) not null,
                                foreign key (inquiry_id) references inquiry(id),
                                foreign key (mission_id) references mission(id)
);

create table review_inquiry(
                               inquiry_id bigint not null ,
                               review_id bigint not null ,
                               craeted_time DATETIME(6) not null,
                               updated_time DATETIME(6) not null,
                               foreign key (inquiry_id) references inquiry(id),
                               foreign key (review_id) references review(id)
);

create table event_inquiry(
                              id bigint not null ,
                              inquiry_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id),
                              foreign key (inquiry_id) references inquiry(id)
);

create table alert(
                      id bigint not null ,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      primary key (id)
);

create table user_alert(
                           user_id bigint not null ,
                           alert_id bigint not null ,
                           craeted_time DATETIME(6) not null,
                           updated_time DATETIME(6) not null,
                           foreign key (user_id) references user(id),
                           foreign key (alert_id) references alert(id)
);

create table mission_alert(
                              alert_id bigint not null ,
                              mission_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              foreign key (alert_id) references alert(id),
                              foreign key (mission_id) references mission(id)
);

create table review_alert(
                             alert_id bigint not null ,
                             review_id bigint not null ,
                             craeted_time DATETIME(6) not null,
                             updated_time DATETIME(6) not null,
                             foreign key (alert_id) references alert(id),
                             foreign key (review_id) references review(id)
);

create table mission_alert(
                              id bigint not null ,
                              alert_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              foreign key (alert_id) references alert(id),
                              primary key (id)
);

create table region(
                       id bigint not null ,
                       name varchar(20) not null ,
                       craeted_time DATETIME(6) not null,
                       updated_time DATETIME(6) not null,
                       primary key (id)
);

create table store(
                      id bigint not null ,
                      region_id bigint not null ,
                      food_category_id bigint not null ,
                      craeted_time DATETIME(6) not null,
                      updated_time DATETIME(6) not null,
                      primary key (id),
                      foreign key (region_id) references region(id),
                      foreign key (food_category_id) references food_category(id)
);

create table store_picture(
                              id bigint not null ,
                              store_id bigint not null ,
                              craeted_time DATETIME(6) not null,
                              updated_time DATETIME(6) not null,
                              primary key (id),
                              foreign key (store_id) references store(id)
);

