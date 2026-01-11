USE social_network_pro;

-- 2) TẠO CHỈ MỤC idx_hometown
CREATE INDEX idx_hometown ON users(hometown);

-- 3) TRUY VẤN USER Ở "HÀ NỘI" + BÀI ĐĂNG
SELECT u.username, u.hometown, p.post_id, p.content FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 10;

-- 4) EXPLAIN ANALYZE (SAU KHI CÓ INDEX)
EXPLAIN ANALYZE
SELECT u.username, u.hometown, p.post_id, p.content FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 10;
