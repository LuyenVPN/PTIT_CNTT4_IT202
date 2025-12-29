create database b2_s3;
use b2_s3;
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);
INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
(1, 'Nguyen Van A', '2004-05-10', 'a.nguyen@gmail.com'),
(2, 'Tran Thi B', '2004-08-22', 'b.tran@gmail.com'),
(3, 'Nguyen Thi C', '2002-05-2', 'c.tran@gmail.com'),
(4, 'Dao Van D', '2006-01-19', 'd.tran@gmail.com'),
(5, 'Le Van E', '2003-12-15', 'c.le@gmail.com')
;
select * from Student;
update Student set email='nguyenthic@gmail.com' where student_id=3;
UPDATE Student SET date_of_birth = '2000-01-01' WHERE student_id = 2;
delete from Student where student_id=5;



