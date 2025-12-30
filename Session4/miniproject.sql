
DROP DATABASE IF EXISTS miniproject;
CREATE DATABASE miniproject;
USE miniproject;

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    description TEXT,
    sessions INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Scores (
    student_id INT,
    course_id INT,
    midterm_score DECIMAL(4,2) CHECK (midterm_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Teachers (teacher_id, full_name, email) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com'),
(2, 'Lê Văn B', 'b@gmail.com'),
(3, 'Trần Thị C', 'c@gmail.com'),
(4, 'Phạm Văn D', 'd@gmail.com'),
(5, 'Hoàng Thị E', 'e@gmail.com');
SELECT * FROM Teachers;
UPDATE Teachers SET full_name = 'Nguyễn Văn B' WHERE teacher_id = 1;
DELETE FROM Teachers WHERE teacher_id = 1;

INSERT INTO Students (student_id, full_name, dob, email) VALUES
(1, 'Nguyễn Tiến Minh', '2003-05-12', 'minh@gmail.com'),
(2, 'Phạm Tuấn Anh', '2002-08-10', 'tuananh@gmail.com'),
(3, 'Lê Hoàng Long', '2003-01-20', 'long@gmail.com'),
(4, 'Trần Thu Hà', '2002-11-02', 'ha@gmail.com'),
(5, 'Đỗ Quang Huy', '2003-07-15', 'huy@gmail.com');
SELECT * FROM Students;
UPDATE Students SET full_name = 'Trần Thị D' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;

INSERT INTO Courses (course_id, course_name, description, sessions, teacher_id) VALUES
(1, 'Lập trình C', 'C cơ bản đến nâng cao', 30, 1),
(2, 'Cấu trúc dữ liệu', 'Danh sách, Stack, Queue', 28, 2),
(3, 'Cơ sở dữ liệu', 'MySQL cơ bản', 25, 3),
(4, 'Lập trình Web', 'HTML, CSS, JS', 35, 4),
(5, 'Java OOP', 'Lập trình hướng đối tượng', 32, 5);
INSERT INTO Courses VALUES (1, 'Lập trình C', 'C cơ bản', 30, 2);
SELECT * FROM Courses;
UPDATE Courses SET sessions = 35 WHERE course_id = 1;
DELETE FROM Courses WHERE course_id = 1;

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-01-05'),
(2, 2, '2025-01-06'),
(3, 3, '2025-01-07'),
(4, 4, '2025-01-08'),
(5, 5, '2025-01-09');
INSERT INTO Enrollments VALUES (2, 1, '2025-01-10');
SELECT * FROM Enrollments;
UPDATE Enrollments SET enrollment_date = '2025-01-15'
WHERE student_id = 2 AND course_id = 1;
DELETE FROM Enrollments WHERE student_id = 2 AND course_id = 1;

INSERT INTO Scores (student_id, course_id, midterm_score, final_score) VALUES
(1, 1, 8.0, 8.5),
(2, 2, 7.5, 8.0),
(3, 3, 9.0, 9.2),
(4, 4, 8.2, 8.8),
(5, 5, 7.8, 8.3);
SELECT * FROM Scores;
UPDATE Scores SET final_score = 9.5
WHERE student_id = 2 AND course_id = 1;
DELETE FROM Scores WHERE student_id = 2 AND course_id = 1;
