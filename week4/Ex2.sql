CREATE TABLE Specialization (
  name VARCHAR(60),
  PRIMARY KEY (name)
  );
  
CREATE TABLE Student (
  name VARCHAR(30),
  id INT,
  native_language VARCHAR(30),
  PRIMARY KEY (id)
  );

CREATE TABLE Course (
  name VARCHAR(60),
  credits INT,
  PRIMARY KEY(name)
  );

CREATE TABLE enroll (
  Student_id INT,
  Course_name VARCHAR(30),
  FOREIGN KEY(Student_id) REFERENCES Student(id),
  FOREIGN KEY (Course_name) REFERENCES Course(name)
  );

CREATE TABLE takes (
  Student_id INT,
  Spec_name VARCHAR(60),
  FOREIGN KEY(Student_id) REFERENCES Student(id),
  FOREIGN KEY(Spec_name) REFERENCES Specialization(name)
  );
  
INSERT INTO Course (name, credits) VALUES ('Databases', 4);
INSERT INTO Course (name, credits) VALUES ('Intro to ML', 5);
INSERT INTO Course (name, credits) VALUES ('SSAD', 4);
INSERT INTO Course (name, credits) VALUES ('Physics', 2);
INSERT INTO Course (name, credits) VALUES ('Physical culture & Sport', 2);

INSERT INTO Student (name, id, native_language) VALUES ('Iskander', 1, 'Russian');
INSERT INTO Student (name, id, native_language) VALUES ('Liam', 2, 'English');
INSERT INTO Student (name, id, native_language) VALUES ('Noah', 3, 'Spanish');
INSERT INTO Student (name, id, native_language) VALUES ('Oliver', 4, 'English');
INSERT INTO Student (name, id, native_language) VALUES ('Elijah', 5, 'French');
INSERT INTO Student (name, id, native_language) VALUES ('James', 6, 'Russian');
INSERT INTO Student (name, id, native_language) VALUES ('Yaroslav', 7, 'Russian');
INSERT INTO Student (name, id, native_language) VALUES ('Ahmed', 8, 'Arabic');
INSERT INTO Student (name, id, native_language) VALUES ('Mohammad', 9, 'Persian');
INSERT INTO Student (name, id, native_language) VALUES ('Isabella', 10, 'Spanish');
INSERT INTO Student (name, id, native_language) VALUES ('Ekaterina', 11, 'Russian');
INSERT INTO Student (name, id, native_language) VALUES ('Evelyn', 12, 'French');
INSERT INTO Student (name, id, native_language) VALUES ('Iskander', 13, 'Spanish');

INSERT INTO Specialization (name) VALUES ('Robotics');
INSERT INTO Specialization (name) VALUES ('AAI');
INSERT INTO Specialization (name) VALUES ('SD');
INSERT INTO Specialization (name) VALUES ('CS');

INSERT INTO enroll (Student_id, Course_name) VALUES (1, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (1, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (1, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (2, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (3, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (4, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (5, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (6, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (7, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (8, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (9, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (10, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (11, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (12, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (13, 'Databases');
INSERT INTO enroll (Student_id, Course_name) VALUES (13, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (12, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (11, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (10, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (2, 'Physics');
INSERT INTO enroll (Student_id, Course_name) VALUES (2, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (3, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (4, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (5, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (6, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (7, 'Physical culture & Sport');
INSERT INTO enroll (Student_id, Course_name) VALUES (13, 'Physics');
INSERT INTO enroll (Student_id, Course_name) VALUES (7, 'Physics');
INSERT INTO enroll (Student_id, Course_name) VALUES (13, 'Intro to ML');
INSERT INTO enroll (Student_id, Course_name) VALUES (8, 'Intro to ML');
INSERT INTO enroll (Student_id, Course_name) VALUES (4, 'Intro to ML');
INSERT INTO enroll (Student_id, Course_name) VALUES (5, 'Intro to ML');
INSERT INTO enroll (Student_id, Course_name) VALUES (3, 'Physics');
INSERT INTO enroll (Student_id, Course_name) VALUES (9, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (8, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (6, 'SSAD');
INSERT INTO enroll (Student_id, Course_name) VALUES (5, 'Physics');
INSERT INTO enroll (Student_id, Course_name) VALUES (4, 'Physics');

INSERT INTO takes (Student_id, Spec_name) VALUES (1, 'AAI');
INSERT INTO takes (Student_id, Spec_name) VALUES (2, 'Robotics');
INSERT INTO takes (Student_id, Spec_name) VALUES (3, 'SD');
INSERT INTO takes (Student_id, Spec_name) VALUES (4, 'CS');
INSERT INTO takes (Student_id, Spec_name) VALUES (5, 'Robotics');
INSERT INTO takes (Student_id, Spec_name) VALUES (6, 'Robotics');
INSERT INTO takes (Student_id, Spec_name) VALUES (7, 'Robotics');
INSERT INTO takes (Student_id, Spec_name) VALUES (8, 'AAI');
INSERT INTO takes (Student_id, Spec_name) VALUES (9, 'SD');
INSERT INTO takes (Student_id, Spec_name) VALUES (10, 'SD');
INSERT INTO takes (Student_id, Spec_name) VALUES (11, 'CS');
INSERT INTO takes (Student_id, Spec_name) VALUES (12, 'CS');
INSERT INTO takes (Student_id, Spec_name) VALUES (13, 'CS');

SELECT name 
FROM Student
LIMIT 10;

SELECT name
FROM Student
WHERE native_language != 'Russian';

SELECT Student.name
FROM Student 
JOIN takes ON Student.id = takes.Student_id 
WHERE takes.Spec_name = 'Robotics';

SELECT Course.name, Student.name
FROM Course
JOIN enroll ON Course.name = enroll.Course_name
JOIN Student ON enroll.Student_id = Student.id
WHERE Course.credits < 3;

SELECT Course.name
FROM Course
INNER JOIN enroll 
ON Course.name = enroll.Course_name
INNER JOIN Student 
ON enroll.Student_id = Student.id
WHERE Student.native_language = 'English';



