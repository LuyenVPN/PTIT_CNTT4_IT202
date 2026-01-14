use s13;

delimiter //
/* before insert: không cho phép user like bài của chính mình */
create trigger trg_before_insert_like
before insert on likes
for each row
begin
    declare post_owner int;

    select user_id into post_owner
    from posts
    where post_id = new.post_id;

    if post_owner = new.user_id then
        signal sqlstate '45000'
        set message_text = 'khong duoc like bai dang cua chinh minh';
    end if;
end;
//

/* after insert: tăng like_count */
create trigger trg_after_insert_like
after insert on likes
for each row
begin
    update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end;
//

/* after delete: giảm like_count */
create trigger trg_after_delete_like
after delete on likes
for each row
begin
    update posts
    set like_count = like_count - 1
    where post_id = old.post_id;
end;
//

/* after update: xử lý khi đổi post_id */
create trigger trg_after_update_like
after update on likes
for each row
begin
    if old.post_id <> new.post_id then
        update posts
        set like_count = like_count - 1
        where post_id = old.post_id;

        update posts
        set like_count = like_count + 1
        where post_id = new.post_id;
    end if;
end;
//

delimiter ;

/* 4. kiểm thử các trường hợp */

/* 4.1 thử like bài của chính mình (phải báo lỗi) */
insert into likes (user_id, post_id, liked_at)
values (1, 1, now());

/* 4.2 thêm like hợp lệ */
insert into likes (user_id, post_id, liked_at)
values (2, 1, now());

select * from posts where post_id = 1;

/* 4.3 update like sang post khác */
update likes
set post_id = 3
where user_id = 2 and post_id = 1
limit 1;

select * from posts where post_id in (1, 3);

/* 4.4 xóa like */
delete from likes
where user_id = 2 and post_id = 3
limit 1;

select * from posts where post_id = 3;

/* 5. kiểm chứng bằng view user_statistics */
select * from user_statistics;
