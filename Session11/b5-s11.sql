use social_network_pro;

delimiter //

create procedure calculateuseractivityscore (
    in p_user_id int,
    out activity_score int,
    out activity_level varchar(50)
)
begin
    declare post_count int default 0;
    declare comment_count int default 0;
    declare like_count int default 0;

    -- đếm số bài viết
    select count(*)
    into post_count
    from posts
    where user_id = p_user_id;

    -- đếm số comment đã viết
    select count(*)
    into comment_count
    from comments
    where user_id = p_user_id;

    -- đếm số like nhận được trên các bài viết
    select count(*)
    into like_count
    from likes l
    join posts p on l.post_id = p.post_id
    where p.user_id = p_user_id;

    -- tính tổng điểm
    set activity_score =
          post_count * 10
        + comment_count * 5
        + like_count * 3;

    -- phân loại mức độ hoạt động
    case
        when activity_score > 500 then
            set activity_level = 'Rất tích cực';
        when activity_score >= 200 then
            set activity_level = 'Tích cực';
        else
            set activity_level = 'Bình thường';
    end case;
end//

delimiter ;

call calculateuseractivityscore(1, @score, @level);
select @score as activity_score,
       @level as activity_level;

drop procedure if exists calculateuseractivityscore;
