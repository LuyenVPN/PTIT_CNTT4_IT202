create database b5_s3;
use b5_s3;
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

CREATE TABLE Score (
    student_id INT,
    subject_id INT,
    mid_score FLOAT CHECK (mid_score >= 0 AND mid_score <= 10),
    final_score FLOAT CHECK (final_score >= 0 AND final_score <=10),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

INSERT INTO Score (student_id, subject_id, mid_score, final_score)
VALUES
(1, 101, 7.5, 8.0),
(1, 102, 6.5, 7.0),
(2, 101, 8.0, 8.5),
(2, 103, 7.0, 9.0);

UPDATE Score SET final_score = 8.5 WHERE student_id = 1 AND subject_id = 101;

SELECT * FROM Score;

SELECT * FROM Score WHERE final_score >= 8;


