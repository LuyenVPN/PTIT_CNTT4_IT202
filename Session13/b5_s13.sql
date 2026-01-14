use s13;

/* 1. stored procedure add_user */

delimiter //

create procedure add_user(
    in p_username varchar(50),
    in p_email varchar(100),
    in p_created_at date
)
begin
    insert into users (username, email, created_at)
    values (p_username, p_email, p_created_at);
end;
//

delimiter ;

/* 2. trigger before insert trên users */

delimiter //

create trigger trg_before_insert_user
before insert on users
for each row
begin
    /* kiểm tra email phải chứa @ và . */
    if new.email not like '%@%' or new.email not like '%.%' then
        signal sqlstate '45000'
        set message_text = 'email khong hop le';
    end if;

    /* kiểm tra username chỉ gồm chữ cái, số và underscore */
    if new.username not regexp '^[a-zA-Z0-9_]+$' then
        signal sqlstate '45000'
        set message_text = 'username chua ky tu khong hop le';
    end if;
end;
//

delimiter ;

/* 3. kiểm thử procedure */

/* 3.1 dữ liệu hợp lệ */
call add_user('david_01', 'david01@example.com', '2025-01-05');

/* 3.2 email không hợp lệ */
call add_user('invalidemail', 'invalidemail.com', '2025-01-06');

/* 3.3 username không hợp lệ */
call add_user('bad user!', 'baduser@example.com', '2025-01-07');

/* 4. kiểm tra kết quả */
select * from users;
