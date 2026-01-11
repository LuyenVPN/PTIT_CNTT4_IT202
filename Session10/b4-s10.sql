USE social_network_pro;

--  1. Truy vấn tìm các bài viết năm 2026 của user_id = 1
EXPLAIN ANALYZE
SELECT post_id, content, created_at FROM posts
WHERE user_id = 1
  AND YEAR(created_at) = 2026;


--  2. Tạo chỉ mục phức hợp trên posts(created_at, user_id) 
CREATE INDEX idx_created_at_user_id ON posts(created_at, user_id);

--  3. Chạy lại truy vấn sau khi tạo composite index 
EXPLAIN ANALYZE
SELECT post_id, content, created_at FROM posts
WHERE user_id = 1
  AND YEAR(created_at) = 2026;

--  4. Truy vấn tìm user có email = 'an@gmail.com'
EXPLAIN ANALYZE
SELECT user_id, username, email FROM users
WHERE email = 'an@gmail.com';


--  5. Tạo chỉ mục duy nhất trên cột email 
CREATE UNIQUE INDEX idx_email ON users(email);

--  6. Chạy lại truy vấn sau khi tạo unique index 
EXPLAIN ANALYZE
SELECT user_id, username, email FROM users
WHERE email = 'an@gmail.com';

--  7. Xóa composite index 
DROP INDEX idx_created_at_user_id ON posts;

--  8. Xóa unique index
DROP INDEX idx_email ON users;
