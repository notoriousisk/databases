/* task2 */
SELECT * FROM
 	(SELECT sec_id,count (*) as enrollment
	 FROM section
	 GROUP BY sec_id
	 ORDER BY enrollment desc
	) as foo
limit 1;
