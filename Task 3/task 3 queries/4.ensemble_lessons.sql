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
WHERE EXTRACT(YEAR FROM l.start_time) = EXTRACT(YEAR FROM NOW()) -- --SET a year for testing
AND DATE_PART('week', l.start_time) = DATE_PART('week', NOW()) + 1 -- --SET a week for testing
ORDER BY EXTRACT(DAY FROM l.start_time), el.target_genre ASC;

--#endregion