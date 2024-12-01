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
			WHERE EXTRACT(MONTH FROM less.start_time) = EXTRACT(MONTH FROM NOW())
			AND EXTRACT(YEAR FROM less.start_time) = EXTRACT(YEAR FROM NOW())
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
			WHERE EXTRACT(MONTH FROM less.start_time) = EXTRACT(MONTH FROM NOW())
			AND EXTRACT(YEAR FROM less.start_time) = EXTRACT(YEAR FROM NOW())
			GROUP BY i.id
		) il
		LEFT JOIN soundgood.person p ON p.id = il."person_id"
		WHERE il."No of Lessons" > 2
		ORDER BY "No of Lessons" ASC;

--#endregion
