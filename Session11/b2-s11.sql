use social_network_pro;

delimiter //
create procedure CalculatePostLikes (
	in p_post_id int,
    out total_like int
)
begin 
	select count(*) into total_like
    from likes
    where post_id = p_post_id;
end//
delimiter ;

call CalculatePostLikes(1, @total_like);
select @total_like as tong_like;

drop procedure if exists CalculatePostLikes;