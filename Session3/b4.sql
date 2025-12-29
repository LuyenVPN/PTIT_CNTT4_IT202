create database b4_s3;
use b4_s3;
create table Student(
	student_id Int primary key,
    student_name varchar(50) Not null,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);
INSERT INTO Student VALUES
(1, 'Nguyen Van A', '2004-05-10', 'a@gmail.com'),
(2, 'Tran Thi B', '2004-08-22', 'b@gmail.com');

create table Subject(
	subject_id Int primary key,
    subject_name varchar(100) Not null,
    credit int check(credit >0)
);
INSERT INTO Subject VALUES
(101, 'Cơ sở dữ liệu', 3),
(102, 'Lập trình C', 4),
(103, 'Mạng máy tính', 3);
CREATE TABLE Enrollment (
    student_id INT,
    subject_id INT,
    enroll_date DATE,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES
(1, 101, '2025-09-01'),
(1, 102, '2025-09-02'),
(2, 101, '2025-09-01'),
(2, 103, '2025-09-03');

SELECT * FROM Enrollment;

SELECT * FROM Enrollment WHERE student_id = 1;

