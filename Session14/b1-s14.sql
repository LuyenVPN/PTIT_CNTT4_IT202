create database ss14;
use ss14;

-- bang users
create table users (
    user_id int primary key auto_increment,
    username varchar(50) not null,
    posts_count int default 0
);

-- bang posts
create table posts (
    post_id int primary key auto_increment,
    user_id int not null,
    content text not null,
    created_at datetime default current_timestamp,
    constraint fk_posts_users
        foreign key (user_id) references users(user_id)
);

-- du lieu mau
insert into users (username) values ('alice'), ('bob');

-- truong hop 1: thanh cong (commit)
start transaction;

insert into posts (user_id, content) values (1, 'bai viet dau tien cua alice');
update users set posts_count = posts_count + 1
where user_id = 1;
commit;

-- truong hop 2: loi -> rollback
start transaction;
insert into posts (user_id, content) values (999, 'bai viet gay loi');
update users set posts_count = posts_count + 1
where user_id = 999;

rollback;
