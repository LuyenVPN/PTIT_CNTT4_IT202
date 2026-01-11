USE SS10;

-- 2) Tạo VIEW view_user_post
-- Hiển thị user_id và tổng số bài viết mỗi user đã đăng
CREATE VIEW view_user_post AS
SELECT 
    u.user_id,
    COUNT(p.post_id) AS total_user_post FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id;

-- 3) Hiển thị lại VIEW để kiểm chứng
SELECT * FROM view_user_post;

-- 4) Kết hợp VIEW view_user_post với bảng users
-- Hiển thị họ tên và tổng số bài viết đã đăng
SELECT u.full_name, v.total_user_post FROM users u
JOIN view_user_post v ON u.user_id = v.user_id
ORDER BY v.total_user_post DESC;
