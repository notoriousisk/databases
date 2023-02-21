/* task1 */
SELECT MAX(enrollment), MIN(enrollment) FROM
 	(SELECT count (*) as enrollment
	 FROM section
	 GROUP BY sec_id
	) as foo;

/* task2 */
SELECT * FROM
 	(SELECT sec_id,count (*) as enrollment
	 FROM section
	 GROUP BY sec_id
	 ORDER BY enrollment desc
	) as foo
limit 1;

/* task3 a */
SELECT COALESCE(MAX(enrollment), 0), COALESCE(MIN(enrollment), 0)
FROM (
    SELECT COUNT(*) AS enrollment
    FROM section
    LEFT JOIN takes ON section.sec_id = takes.sec_id
    GROUP BY section.sec_id
) AS foo;

/* task3 b */
SELECT COALESCE(MAX(t2.enrollment), 0), COALESCE(MIN(t2.enrollment), 0)
FROM section t1
LEFT JOIN (
    SELECT sec_id, COUNT(*) AS enrollment
    FROM takes
    GROUP BY sec_id
) t2 ON t1.sec_id = t2.sec_id;

/* task4 */
SELECT title
FROM course
WHERE (course_id LIKE 'CS-1%');

/* task5 */
SELECT name
FROM instructor
WHERE (dept_name = 'Biology');

/* task6 */
SELECT count (*) 
FROM section
WHERE (year = 2022 and semester = 'Fall')
GROUP BY sec_id;

/* task7 */
SELECT MAX(enrollment) FROM
 	(SELECT count (*) as enrollment
	 FROM section
	 WHERE (year = 2022 and semester ='Fall')
	 GROUP BY sec_id
	) as foo;








