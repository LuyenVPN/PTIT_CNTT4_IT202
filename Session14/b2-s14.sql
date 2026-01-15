use ss14;

alter table posts
add column likes_count int default 0;

-- tao bang likes
create table if not exists likes (
    like_id int primary key auto_increment,
    post_id int not null,
    user_id int not null,
    constraint fk_likes_posts
        foreign key (post_id) references posts(post_id),
    constraint fk_likes_users
        foreign key (user_id) references users(user_id),
    constraint unique_like
        unique (post_id, user_id)
);

-- truong hop 1: like lan dau -> thanh cong (commit)

start transaction;

insert into likes (post_id, user_id) values (1, 2);

update posts set likes_count = likes_count + 1
where post_id = 1;

commit;

-- truong hop 2: like lan thu hai (trung post_id, user_id)
start transaction;
insert into likes (post_id, user_id) values (1, 2);

update posts set likes_count = likes_count + 1
where post_id = 1;
rollback;
