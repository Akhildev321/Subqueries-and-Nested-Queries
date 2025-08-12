Create database StudentsDB;
use  StudentsDB;

create table Students (
id INT primary key auto_increment,
name varchar(50),
department varchar(100),
gpa decimal(3,2)
);

create table Courses (
id INT primary key auto_increment,
title varchar(50),
department varchar (50)
);

create table Enrollments (
id INT primary key auto_increment,
student_id INT,
course_id INT,
score decimal (5,2),
foreign key (student_id) references Students(id),
foreign key (course_id) references Courses(id)
);

insert into Students (name, department, gpa) values
('Akhil Dev', 'Computer Science', 3.9),
('Nikhil', 'Computer Science', 3.2),
('Nikhitha', 'Mathematics', 3.7),
('Dhiraj', 'Physics', 3.5),
('Eshwar', 'Mathematics', 3.8),
('Faran', 'Computer Science', 3.4),
('Greeshma', 'Physics', 3.6),
('Harini', 'Mathematics', 3.3),
('Babu', 'Computer Science', 3.1),
('Sai Charan', 'Physics', 3.8);

INSERT INTO Courses (title, department) VALUES
('Database Systems', 'Computer Science'),
('Data Structures', 'Computer Science'),
('Linear Algebra', 'Mathematics'),
('Calculus II', 'Mathematics'),
('Quantum Mechanics', 'Physics');

INSERT INTO Enrollments (student_id, course_id, score) VALUES
(1, 1, 95),
(1, 2, 88),
(2, 1, 76),
(2, 2, 85),
(3, 3, 92),
(3, 4, 87),
(4, 5, 78),
(5, 3, 91),
(5, 4, 85),
(5, 1, 89),
(6, 1, 72),
(6, 2, 68),
(7, 5, 82),
(7, 3, 75),
(8, 3, 63),
(8, 4, 70),
(9, 1, 55),
(9, 2, 60),
(9, 4, 65),
(10, 5, 96),
(10, 3, 88),
(10, 1, 91),
(4, 3, 73),
(3, 1, 84),
(2, 3, 79);

-- Scalar Subquery
select name,department,gpa
from Students
where gpa=(select max(gpa) from Students);

-- Scalar Subquery in SELECT
select s.name,
(select max(score)
from Enrollments e
where e.student_id = s.id) as highest_score
from Students s;

-- IN with Subquery
select name
from Students
where id in (
select student_id
from Enrollments
where course_id in (
select id
from Courses
where department = 'Computer Science'
)
);

-- EXISTS Subquery
select s.name       -- s = alias for Students Table 
from students s 
where exists(
select 1 
from Enrollments e    -- e = alias for Enrollments Table
join Courses c on e.course_id = c.id    -- c = alias for Courses Table
where e.student_id = s.id
and c.department = 'Physics'
);

-- Subquery in WHERE with IN
select name
from Students
where id IN (
select student_id
from Enrollments
where course_id = (
select id from Courses where title = 'Linear Algebra')
);

-- Subquery with  =
select title, department
from Courses
where id = (
select course_id
from Enrollments
group by course_id
order by avg(score) DESC
limit 1
);

-- Nested Query
select name
from students
where id in (
    select student_id
    from enrollments
    where course_id = (
        select id from courses where title = 'Data Structures'
    )
    and score > (
        select avg(score)
        from enrollments
        where course_id = (
            select id from courses where title = 'Data Structures'
        )
    )
);
