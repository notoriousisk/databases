/* task1 */
SELECT MAX(enrollment), MIN(enrollment) FROM
 	(SELECT count (*) as enrollment
	 FROM section
	 GROUP BY sec_id
	) as foo;
