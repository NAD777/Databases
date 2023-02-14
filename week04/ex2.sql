SELECT name FROM Student LIMIT 10;

SELECT name FROM Student WHERE native_language != 'Russian';

SELECT name FROM Student
WHERE id IN (
  SELECT PersonID
  FROM Takes
  WHERE SpecName = 'Robotics'
);

SELECT Course.name AS CourseName, Student.name AS StudentName FROM Course
  JOIN Enroll ON Course.name = Enroll.CourseName
  JOIN Student ON Enroll.PersonID = Student.id
  WHERE Course.credits < 3;

SELECT DISTINCT Course.name
FROM Course
  INNER JOIN Enroll ON Course.name = Enroll.CourseName
  INNER JOIN Student ON Enroll.PersonID = Student.id
  WHERE Student.native_language = 'English';
