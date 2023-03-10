-- 1
SELECT MAX(enrollment) AS max_enrollment, MIN(enrollment) AS min_enrollment
FROM (
  SELECT COUNT(*) AS enrollment
  FROM takes
  GROUP BY course_id, sec_id
) AS enrollment_counts;

-- 2
SELECT sec_id
FROM (
  SELECT course_id, sec_id, semester, year, COUNT(*) AS enrollment
  FROM takes
  GROUP BY course_id, sec_id, semester, year
) AS enrollment_counts
WHERE enrollment = (
  SELECT MAX(enrollment)
  FROM (
    SELECT COUNT(*) AS enrollment
    FROM takes
    GROUP BY course_id, sec_id, semester, year
  ) AS max_enrollment
);

-- 3 (a)
SELECT course_id, sec_id, semester, year, COALESCE((SELECT COUNT(*) 
FROM takes 
WHERE takes.course_id = section.course_id AND takes.sec_id = section.sec_id AND takes.semester = section.semester AND takes.year = section.year), 0) as enrolment
FROM section
ORDER BY enrolment DESC;

-- 3 (b)
SELECT section.course_id, section.sec_id, section.semester, section.year, COALESCE(COUNT(takes.ID), 0) as enrolment
FROM section LEFT JOIN takes ON section.course_id = takes.course_id AND section.sec_id = takes.sec_id AND section.semester = takes.semester AND section.year = takes.year
GROUP BY section.course_id, section.sec_id, section.semester, section.year
ORDER BY enrolment DESC;

-- 4
SELECT * FROM course 
WHERE course_id LIKE 'CS-1%';

-- 5
SELECT name FROM instructor
WHERE dept_name = 'Biology';

-- 6
select count(distinct takes.id), sec_id from takes 
where semester = 'Fall' and year = 2022
group by sec_id;

-- 7
select MAX(cnt) from (
select count(distinct takes.id) as cnt, sec_id from takes 
where semester = 'Fall' and year = 2022
group by sec_id) as asd;
