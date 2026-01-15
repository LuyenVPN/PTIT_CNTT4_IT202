use ss14;

alter table users
add column friends_count int default 0;

create table if not exists friend_requests (
    request_id int primary key auto_increment,
    from_user_id int,
    to_user_id int,
    status enum('pending','accepted','rejected') default 'pending'
);


create table if not exists friends (
    user_id int,
    friend_id int,
    primary key (user_id, friend_id)
);

DELIMITER //

CREATE PROCEDURE sp_accept_friend_request (
    IN p_request_id INT,
    IN p_to_user_id INT
)
BEGIN
    DECLARE v_from_user_id INT;
    DECLARE v_count INT;

    -- Thiết lập mức cô lập giao dịch
    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    START TRANSACTION;

    /* =====================================================
       BƯỚC 1: KIỂM TRA LỜI MỜI
       - Có tồn tại không
       - Đúng người nhận không
       - Trạng thái còn pending không
       ===================================================== */
    SELECT from_user_id
    INTO v_from_user_id
    FROM friend_requests
    WHERE request_id = p_request_id
      AND to_user_id = p_to_user_id
      AND status = 'pending';

    IF ROW_COUNT() = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lời mời không tồn tại hoặc đã được xử lý';
    END IF;

    /* =====================================================
       BƯỚC 2: KIỂM TRA ĐÃ LÀ BẠN CHƯA
       ===================================================== */
    SELECT COUNT(*)
    INTO v_count
    FROM friends
    WHERE user_id = p_to_user_id
      AND friend_id = v_from_user_id;

    IF v_count > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hai người đã là bạn';
    END IF;

    /* =====================================================
       BƯỚC 3: THÊM BẠN BÈ 2 CHIỀU
       ===================================================== */
    INSERT INTO friends (user_id, friend_id)
    VALUES (p_to_user_id, v_from_user_id);

    INSERT INTO friends (user_id, friend_id)
    VALUES (v_from_user_id, p_to_user_id);

    /* =====================================================
       BƯỚC 4: TĂNG friends_count
       ===================================================== */
    UPDATE users
    SET friends_count = friends_count + 1
    WHERE user_id IN (p_to_user_id, v_from_user_id);

    /* =====================================================
       BƯỚC 5: CẬP NHẬT TRẠNG THÁI LỜI MỜI
       ===================================================== */
    UPDATE friend_requests
    SET status = 'accepted'
    WHERE request_id = p_request_id;

    COMMIT;
END;
//

DELIMITER ;

-- tao loi moi ket ban
insert into friend_requests (from_user_id, to_user_id)
values (1, 2);

-- chap nhan loi moi (thanh cong)
call sp_accept_friend_request(1, 2);

-- chap nhan lai lan nua (da la ban -> rollback)
call sp_accept_friend_request(1, 2);
