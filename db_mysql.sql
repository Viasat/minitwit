# TODO

drop table if exists user;
create table user (
  user_id INT primary key auto_increment,
  username text not null,
  email text not null,
  pw_hash text not null
);

drop table if exists follower;
create table follower (
  who_id integer,
  whom_id integer
);

drop table if exists message;
create table message (
  message_id integer primary key auto_increment,
  author_id integer not null,
  text text not null,
  pub_date integer
);
