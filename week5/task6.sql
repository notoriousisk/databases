

/* task6 */
SELECT count (*) 
FROM section
WHERE (year = 2022 and semester = 'Fall')
GROUP BY sec_id;
