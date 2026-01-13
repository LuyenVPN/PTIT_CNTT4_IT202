CREATE DATABASE StudentDB;
USE StudentDB;
-- 1. Bảng Khoa
CREATE TABLE Department (
    DeptID CHAR(5) PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- 2. Bảng SinhVien
CREATE TABLE Student (
    StudentID CHAR(6) PRIMARY KEY,
    FullName VARCHAR(50),
    Gender VARCHAR(10),
    BirthDate DATE,
    DeptID CHAR(5),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 3. Bảng MonHoc
CREATE TABLE Course (
    CourseID CHAR(6) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

-- 4. Bảng DangKy
CREATE TABLE Enrollment (
    StudentID CHAR(6),
    CourseID CHAR(6),
    Score FLOAT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Department VALUES
('IT','Information Technology'),
('BA','Business Administration'),
('ACC','Accounting');

INSERT INTO Student VALUES
('S00001','Nguyen An','Male','2003-05-10','IT'),
('S00002','Tran Binh','Male','2003-06-15','IT'),
('S00003','Le Hoa','Female','2003-08-20','BA'),
('S00004','Pham Minh','Male','2002-12-12','ACC'),
('S00005','Vo Lan','Female','2003-03-01','IT'),
('S00006','Do Hung','Male','2002-11-11','BA'),
('S00007','Nguyen Mai','Female','2003-07-07','ACC'),
('S00008','Tran Phuc','Male','2003-09-09','IT');

INSERT INTO Course VALUES
('C00001','Database Systems',3),
('C00002','C Programming',3),
('C00003','Microeconomics',2),
('C00004','Financial Accounting',3);

INSERT INTO Enrollment VALUES
('S00001','C00001',8.5),
('S00001','C00002',7.0),
('S00002','C00001',6.5),
('S00003','C00003',7.5),
('S00004','C00004',8.0),
('S00005','C00001',9.0),
('S00006','C00003',6.0),
('S00007','C00004',7.0),
('S00008','C00001',5.5),
('S00008','C00002',6.5);

-- PHẦN A – CƠ BẢN
-- Câu 1:  Tạo View View_StudentBasic hiển thị: StudentID, FullName , DeptName. Sau đó truy vấn toàn bộ View_StudentBasic;
create view View_StudentBasic as 
select s.StudentID, s.FullName, d.DeptName from Student s 
join Department d on s.DeptID = d.DeptID;

select * from View_StudentBasic;

-- Câu 2: Tạo Regular Index cho cột FullName của bảng Student.
create index idx_students_regular on Student(fullName);
-- Câu 3: Viết Stored Procedure GetStudentsIT
-- ●     Không có tham số
-- ●     Chức năng: hiển thị toàn bộ sinh viên thuộc khoa Information Technology trong bảng Student + DeptName từ bảng Department.
-- ●     Gọi đến procedue GetStudentsIT.
delimiter //
create procedure getstudentsIT()
begin
	select s.StudentID, s.FullName, s.Gender, s.BirthDate, d.DeptName from Student s
    join Department d on s.DeptID = d.DeptID
    where d.DeptName = 'Information Technology';
end//
delimiter ;

CALL GetStudentsIT();


--  PHẦN B – KHÁ
-- Câu 4: 
-- a)Tạo View View_StudentCountByDept hiển thị: DeptName, TotalStudents (số sinh viên mỗi khoa).
create view View_StudentCountByDept as
select d.DeptName, COUNT(s.StudentID) as TotalStudents from Department d
left join Student s on d.DeptID = s.DeptID
group by d.DeptName;
-- b)Từ View trên, viết truy vấn hiển thị khoa có nhiều sinh viên nhất.
select * from View_StudentCountByDept;

-- Câu 5:Viết Stored Procedure GetTopScoreStudent
-- ●     Tham số: IN p_CourseID
-- ●     Chức năng: Hiển thị sinh viên có điểm cao nhất trong môn học được truyền vào. 
delimiter //
create procedure GetTopScoreStudent(
	in p_CourseID char (6)
)
begin
	select s.StudentID, s.FullName, c.CourseName, e.Score from Enrollment e
    join Student s on s.StudentID = e.StudentID
    join Course c on c.CourseID = e.CourseID
    where c.CourseID = p_CourseID;
end//
delimiter ;
-- b) Gọi thủ tục trên để tìm sinh viên có điểm cao nhất môn Database Systems (C00001).

-- PHẦN C – GIỎI
-- Bài 6: 

-- Nhà trường muốn quản lý việc cập nhật điểm cho môn
--   Database Systems (C00001) theo quy tắc:
-- 1.    Chỉ cho phép cập nhật điểm cho sinh viên thuộc khoa IT.
-- 2.    Nếu điểm mới > 10 → tự động gán = 10.
-- 3.    Việc cập nhật phải thực hiện thông qua Stored Procedure.
-- 4.    Dữ liệu cập nhật phải đảm bảo không vi phạm điều kiện của View.
-- Yêu cầu thực hiện: 
-- a) – Tạo VIEW
-- ●     Tạo View View_IT_Enrollment_DB
-- ●     Hiển thị các sinh viên:
-- ○     Thuộc khoa IT
-- ○     Đăng ký môn C00001
-- ●     View phải có WITH CHECK OPTION.


-- b)Viết Stored Procedure UpdateScore_IT_DB
-- ●     Tham số:
-- ○     IN p_StudentID
-- ○     INOUT p_NewScore
-- ●     Xử lý:
-- ○     Nếu p_NewScore > 10 → gán lại = 10
-- ○     Cập nhật điểm thông qua View View_IT_Enrollment_DB.

-- c) GỌI THỦ TỤC
-- viết lệnh CALL để kiểm tra thủ tục:
-- ●     Yêu cầu:
-- ○     Khai báo biến để nhận giá trị INOUT.
-- ○     Gọi thủ tục để cập nhật điểm cho một sinh viên bất kỳ thuộc khoa IT.
-- ●     Sau khi gọi:
-- ○     Hiển thị lại giá trị điểm mới.
-- ○     Kiểm tra dữ liệu trong View View_IT_Enrollment_DB.


