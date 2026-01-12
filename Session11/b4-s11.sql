use social_network_pro;

delimiter //
create procedure CreatePostWithValidation(
    in p_user_id int,
    in p_content text,
    out result_message VARCHAR(255)
)
begin
	if CHAR_LENGTH(p_content) < 5 then 
		set result_message= 'Noi dung qua ngan';
	else 
		insert into posts (user_id, content, created_at)
        value (p_user_id, p_content, NOW());
		set result_message = 'them bai viet thanh cong';
	end if;
end//
delimiter ;

CALL CreatePostWithValidation(1, 'Hi', @result);
SELECT @result AS message;

CALL CreatePostWithValidation(1, 'Hôm nay học Stored Procedure khá thú vị', @result);
SELECT @result AS message;

drop procedure if exists CreatePostWithValidation;
