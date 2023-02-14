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



