
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
