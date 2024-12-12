SET search_path TO soundgood, public;
--#region 1.lessons_per_year - Function version
CREATE OR REPLACE FUNCTION func_1(year_input INT) 
RETURNS TABLE("Month" TEXT, "Total" BIGINT, "Individual" BIGINT, "Group" BIGINT, "Ensemble" BIGINT) AS $$
BEGIN
	RETURN QUERY

  -- QUERY
    SELECT 
      TO_CHAR(l.start_time, 'Month') AS "Month",
      COUNT(*) AS "Total",
      SUM(CASE WHEN l.type = 'Individual' THEN 1 ELSE 0 END) AS "Individual",
      SUM(CASE WHEN l.type = 'Group' THEN 1 ELSE 0 END) AS "Group",
      SUM(CASE WHEN l.type = 'Ensemble' THEN 1 ELSE 0 END) AS "Ensemble"
    FROM 
      soundgood.lesson l
    WHERE 
      EXTRACT(YEAR FROM l.start_time) = year_input --SET a year for testing
    GROUP BY 
      EXTRACT(MONTH FROM l.start_time), TO_CHAR(l.start_time, 'Month')
    ORDER BY 
      EXTRACT(MONTH FROM l.start_time);
  
END; 
$$ LANGUAGE plpgsql;
--#endregion

--#region 1.lessons_per_year - View version
CREATE VIEW view_1 AS

-- QUERY
    SELECT 
      TO_CHAR(l.start_time, 'Month') AS "Month",
      COUNT(*) AS "Total",
      SUM(CASE WHEN l.type = 'Individual' THEN 1 ELSE 0 END) AS "Individual",
      SUM(CASE WHEN l.type = 'Group' THEN 1 ELSE 0 END) AS "Group",
      SUM(CASE WHEN l.type = 'Ensemble' THEN 1 ELSE 0 END) AS "Ensemble"
    FROM 
      soundgood.lesson l
    WHERE 
      EXTRACT(YEAR FROM l.start_time) = date_part('year', CURRENT_DATE) -- Alawys current year
    GROUP BY 
      EXTRACT(MONTH FROM l.start_time), TO_CHAR(l.start_time, 'Month')
    ORDER BY 
      EXTRACT(MONTH FROM l.start_time);

--#endregion

--#region 2.students_siblings
CREATE VIEW view_2 AS
/* 
(amount_students) | student_id:s = amount_siblings
(8) | 2,3,4,5,8,14,21,24,26 = 0
(8) | 1,7,9,10,15,16,17,20 = 1
(2) | 6,22 = 2
(6) | 12,13,18,19,23,25 = 3
(1) | 11 = 4
*/
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

--#region 3.instructors_with_more_lessons_than - Function version
CREATE OR REPLACE FUNCTION func_3(amount_lessons INT) 
RETURNS TABLE("Instructor ID" INT, "First Name" VARCHAR, "Last Name" VARCHAR, "No of Lessons" BIGINT) AS $$
BEGIN
	RETURN QUERY

	-- QUERY
		SELECT il."Instructor ID", p.first_name AS "First Name", p.last_name AS "Last Name", il."No of Lessons" FROM
		(
			SELECT i.id AS "Instructor ID", i.person_id AS "person_id", COUNT(*) AS "No of Lessons" 
			FROM soundgood.lesson less
			LEFT JOIN soundgood.instructor i ON i.id = less.instructor_id
			WHERE EXTRACT(month from less.start_time) = EXTRACT(month from NOW())
			AND EXTRACT(year from less.start_time) = EXTRACT(year from NOW())
			GROUP BY i.id
		) il
		LEFT JOIN soundgood.person p ON p.id = il."person_id"
		WHERE il."No of Lessons" > amount_lessons
		ORDER BY "No of Lessons" ASC;

END; 
$$ LANGUAGE plpgsql;
--#endregion

--#region 3.instructors_with_more_lessons_than - View version
CREATE VIEW view_3 AS
-- QUERY
		SELECT il."Instructor ID", p.first_name AS "First Name", p.last_name AS "Last Name", il."No of Lessons" FROM
		(
			SELECT i.id AS "Instructor ID", i.person_id AS "person_id", COUNT(*) AS "No of Lessons" 
			FROM soundgood.lesson less
			LEFT JOIN soundgood.instructor i ON i.id = less.instructor_id
			WHERE EXTRACT(month from less.start_time) = EXTRACT(month from NOW())
			AND EXTRACT(year from less.start_time) = EXTRACT(year from NOW())
			GROUP BY i.id
		) il
		LEFT JOIN soundgood.person p ON p.id = il."person_id"
		WHERE il."No of Lessons" > 2
		ORDER BY "No of Lessons" ASC;

--#endregion

--#region 4.all_ensembles_held_during_next_week
CREATE VIEW view_4 AS

-- QUERY
SELECT 
	TO_CHAR(l.start_time, 'Day') AS "Day", 
	el.target_genre AS "Genre",
	(CASE
	WHEN el.max_num_of_students - se.count = 0 THEN 'No Seats'
	WHEN el.max_num_of_students - se.count BETWEEN 1 AND 2 THEN '1 or 2 Seats'
	WHEN el.max_num_of_students - se.count > 2 THEN 'Many Seats' 
	END) AS "No of Free Seats"
	--el.max_num_of_students - se.count as "Seats" -- Uncomment for testing
FROM (
	SELECT se.lesson_id, COUNT(*) FROM soundgood.student_ensemble se
	GROUP BY lesson_id) se
LEFT JOIN soundgood.ensemble_lesson el on el.lesson_id = se.lesson_id
LEFT JOIN soundgood.lesson l on l.id = el.lesson_id
WHERE EXTRACT(year FROM l.start_time) = EXTRACT(year FROM NOW()) -- --SET a year for testing
AND DATE_PART('week', l.start_time) = DATE_PART('week', NOW()) + 1 -- --SET a week for testing
ORDER BY EXTRACT(day FROM l.start_time), el.target_genre ASC;

--#endregion