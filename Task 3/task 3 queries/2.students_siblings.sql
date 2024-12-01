--#region 2.students_siblings
CREATE VIEW view_2 AS

-- QUERY
SELECT "No of Siblings" , COUNT(*) AS "No of Students" 
FROM(SELECT COUNT(*) AS "No of Siblings" 
	 FROM soundgood.student st
	 INNER JOIN soundgood.sibling s ON st.id = s.student_id OR st.id = s.sibling_id
	 GROUP BY st.id) GROUP BY "No of Siblings"
UNION 
SELECT 0 AS "No of Siblings" , COUNT(*) AS "No of Students" FROM student st
LEFT JOIN soundgood.sibling si ON st.id = si.student_id OR st.id = sibling_id
WHERE si.student_id IS NULL OR si.sibling_id IS NULL
ORDER BY "No of Siblings" ASC;

--#endregion
