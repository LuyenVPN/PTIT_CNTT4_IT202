USE social_network_pro;

--    2) Tìm tất cả User ở Hà Nội
EXPLAIN ANALYZE
SELECT * FROM users
WHERE hometown = 'Hà Nội';

--    3) Tạo chỉ mục idx_hometown cho cột hometown
CREATE INDEX idx_hometown ON users(hometown);

--    4) Chạy lại truy vấn (2) sau khi tạo INDEX
EXPLAIN ANALYZE
SELECT * FROM users
WHERE hometown = 'Hà Nội';

--    6) Xóa chỉ mục idx_hometown khỏi bảng users
DROP INDEX idx_hometown ON users;

