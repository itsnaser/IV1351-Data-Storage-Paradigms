SET search_path TO soundgood, public;

--#region [history]
CREATE TABLE history (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 type lesson_types NOT NULL,
 genre VARCHAR(100),
 instrument VARCHAR(100), 
 price DECIMAL(11,2) NOT NULL, 
 student_first_name VARCHAR(100) NOT NULL, 
 student_last_name VARCHAR(100) NOT NULL, 
 student_email VARCHAR(100) NOT NULL,
 UNIQUE(lesson_id,student_id)
);
ALTER TABLE history ADD CONSTRAINT PK_lesson_history PRIMARY KEY (id);
--#endregion

--#region Copy lessons
INSERT INTO
soundgood.history
(lesson_id,student_id,type,genre,instrument,price,student_first_name,student_last_name,student_email)
-- Individual
(SELECT  
	l.id AS "lesson_id",
	s.id AS "student_id",
	l.type AS "type",
	NULL AS "genre",
	it.name AS "instrument",
	ps.lesson_price AS "price",
	p.first_name AS "student_first_name",
	p.last_name AS "student_last_name",
	e.email_address AS "student_email"
FROM soundgood.individual_lesson il
LEFT JOIN soundgood.instrument_type it ON il.instrument_id = it.id
LEFT JOIN soundgood.lesson l ON l.id = il.lesson_id
LEFT JOIN soundgood.pricing_scheme ps ON l.pricing_id = ps.id
LEFT JOIN soundgood.student s ON il.student_id = s.id
LEFT JOIN soundgood.person p ON s.person_id = p.id
LEFT JOIN soundgood.email e ON p.id = e.person_id)
UNION
-- Group
(SELECT  
	l.id AS "lesson_id",
	s.id AS "student_id",
	l.type AS "type",
	NULL AS "genre",
	it.name AS "instrument",
	ps.lesson_price AS "price",
	p.first_name AS "student_first_name",
	p.last_name AS "student_last_name",
	e.email_address AS "student_email"
FROM soundgood.student_group sg
LEFT JOIN  soundgood.group_lesson gl ON gl.lesson_id = sg.lesson_id
LEFT JOIN soundgood.instrument_type it ON it.id = gl.instrument_id 
LEFT JOIN soundgood.lesson l ON gl.lesson_id = l.id 
LEFT JOIN soundgood.pricing_scheme ps ON ps.id = l.pricing_id 
LEFT JOIN soundgood.student s ON s.id = sg.student_id
LEFT JOIN soundgood.person p ON p.id = s.person_id 
LEFT JOIN soundgood.email e ON e.person_id = p.id )
UNION
-- Ensemble
(SELECT  
	l.id AS "lesson_id",
	s.id AS "student_id",
	l.type AS "type",
	el.target_genre AS "genre",
	NULL AS "instrument",
	ps.lesson_price AS "price",
	p.first_name AS "student_first_name",
	p.last_name AS "student_last_name",
	e.email_address AS "student_email"
FROM soundgood.student_ensemble se
LEFT JOIN soundgood.ensemble_lesson el ON el.lesson_id = se.lesson_id
LEFT JOIN soundgood.lesson l ON el.lesson_id = l.id 
LEFT JOIN soundgood.pricing_scheme ps ON ps.id = l.pricing_id 
LEFT JOIN soundgood.student s ON s.id = se.student_id
LEFT JOIN soundgood.person p ON p.id = s.person_id 
LEFT JOIN soundgood.email e ON e.person_id = p.id 
);
--#endregion