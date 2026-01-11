USE social_network_pro;

-- 2) TẠO VIEW view_user_activity_status
CREATE VIEW view_user_activity_status AS
SELECT u.user_id, u.username, u.gender, u.created_at,
    CASE
        WHEN 
            EXISTS (
                SELECT 1 
                FROM posts p 
                WHERE p.user_id = u.user_id
            )
            OR EXISTS (
                SELECT 1 
                FROM comments c 
                WHERE c.user_id = u.user_id
            )
        THEN 'Active'
        ELSE 'Inactive'
    END AS status
FROM users u;

-- 3) TRUY VẤN VIEW ĐỂ KIỂM TRA KẾT QUẢ
SELECT user_id, username, gender, created_at, status
FROM view_user_activity_status;

-- 4) THỐNG KÊ SỐ LƯỢNG USER THEO TRẠNG THÁI
SELECT status, COUNT(*) AS user_count FROM view_user_activity_status
GROUP BY status
ORDER BY user_count DESC;
