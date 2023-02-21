/* task7 */
SELECT MAX(enrollment) FROM
 	(SELECT count (*) as enrollment
	 FROM section
	 WHERE (year = 2022 and semester ='Fall')
	 GROUP BY sec_id
	) as foo;



