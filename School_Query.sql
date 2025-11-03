
-- CREATING TABLES
Create table Students (
Student_id INT  IDENTITY(1,1) PRIMARY KEY,
First_Name VARCHAR(50),
Last_name VARCHAR(50),
Age INT
);

Create table Courses (
Course_id INT IDENTITY(1,1) PRIMARY KEY,
Course_name VARCHAR(50),
Instructor VARCHAR(50)
);

Create table Enrollments (
Enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
Student_id INT,
Course_id INT,
Enrollment_date DATE,
FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)
);

--INSERTION
INSERT INTO Students (First_name, Last_name, Age) VALUES
('Ali', 'Simsek', 20),
('Berkay', 'Simsek', 22),
('Kerem', 'Simsek', 19);

INSERT INTO Courses (Course_name, Instructor) VALUES
('Database', 'Dr. Zeshan IQBAL'),
('Programming ', 'Dr. Muhammed TAN'),
('Web Programming', 'Dr. Farhan AADIL');

INSERT INTO Enrollments (Student_id, Course_id, Enrollment_date) VALUES
(1, 1, '2025-11-03'),--YYYY-MM-DD GLOBAL FORMAT OF DATE
(1, 2, '2025-11-03'),--DD-MM-YYYY may return wrong output because compiler can assume it is MM-DD-YYYY due to languagae and region
(2, 3, '2025-11-03');

--JOINS

--INNER JOIN -- returns if both sides matches

SELECT s.Student_id, s.First_Name, s.Last_Name, c.Course_Name
FROM Students AS s
INNER JOIN Enrollments AS e ON s.Student_id = e.Student_id
INNER JOIN Courses AS c ON e.Course_id = c.Course_id;

--LEFT JOIN -- returns all of leftside, if rightside has no matches returns null

SELECT s.Student_id, s.First_Name, s.Last_Name, c.Course_Name
FROM Students AS s
LEFT JOIN Enrollments AS e ON s.Student_id = e.Student_id
LEFT JOIN Courses AS c ON e.Course_id = c.Course_id;

--RIGHT JOIN -- returns all of rights side, if left side has no matches returns null

SELECT s.Student_id, s.First_Name, s.Last_Name, c.Course_Name
FROM Students AS s
RIGHT JOIN Enrollments AS e ON s.Student_id = e.Student_id
RIGHT JOIN Courses AS c ON e.Course_id = c.Course_id;