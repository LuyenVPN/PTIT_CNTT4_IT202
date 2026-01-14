use s13;

create table post_history (
    history_id int auto_increment primary key,
    post_id int,
    old_content text,
    new_content text,
    changed_at datetime,
    changed_by_user_id int,
    foreign key (post_id) references posts(post_id)
        on delete cascade
);


delimiter //

/* before update: lưu lịch sử chỉnh sửa nội dung */
create trigger trg_before_update_post
before update on posts
for each row
begin
    if old.content <> new.content then
        insert into post_history (
            post_id,
            old_content,
            new_content,
            changed_at,
            changed_by_user_id
        )
        values (
            old.post_id,
            old.content,
            new.content,
            now(),
            old.user_id
        );
    end if;
end;
//

/* after delete: không cần xử lý thêm
   vì post_history sẽ tự xóa nhờ on delete cascade */

delimiter ;

/* 4. kiểm thử update nội dung bài đăng */

/* cập nhật nội dung bài đăng */
update posts
set content = 'hello world from alice (edited version)'
where post_id = 1;

update posts
set content = 'bob first post - updated'
where post_id = 3;

/* xem lịch sử chỉnh sửa */
select * from post_history;

/* 5. kiểm tra trigger like_count vẫn hoạt động */

/* thêm like để kiểm chứng */
insert into likes (user_id, post_id, liked_at)
values (3, 1, now());

/* kiểm tra like_count không bị ảnh hưởng bởi update post */
select post_id, content, like_count
from posts
where post_id = 1;

/* kiểm tra view thống kê người dùng */
select * from user_statistics;
