/* Soundgood Music School - DB*/

--#region [SCEHMAS]
DROP SCHEMA IF EXISTS soundgood CASCADE;
CREATE SCHEMA IF NOT EXISTS soundgood;
SET search_path TO soundgood, public;
--#endregion

--#region [ENUMS]
CREATE TYPE lesson_types AS ENUM ('Individual', 'Group', 'Ensemble');
CREATE TYPE lesson_levels AS ENUM ('Beginner', 'Intermediate', 'Advanced');
--#endregion

--#region [person]
CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 personal_no CHAR(12) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 UNIQUE(personal_no)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);
--#endregion

--#region [student]
CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);
--#endregion

--#region [instructor]
CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 can_teach_ensemble CHAR(1) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);
--#endregion

--#region [instructor_working_time]
CREATE TABLE instructor_working_time (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL
);

ALTER TABLE instructor_working_time ADD CONSTRAINT PK_instructor_working_time PRIMARY KEY (id);
--#endregion

--#region [address]
CREATE TABLE address (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 street VARCHAR(500) NOT NULL,
 zip CHAR(5) NOT NULL,
 city VARCHAR(500) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (id);
--#endregion

--#region [instrument_type]
CREATE TABLE instrument_type (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(100) NOT NULL,
 UNIQUE(name)
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (id);
--#endregion

--#region [person_address]
CREATE TABLE person_address (
 person_id INT NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE person_address ADD CONSTRAINT PK_person_address PRIMARY KEY (person_id,address_id);
--#endregion

--#region [phone_no]
CREATE TABLE phone_no (
 phone_no VARCHAR(20) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE phone_no ADD CONSTRAINT PK_phone_no PRIMARY KEY (phone_no,person_id);
--#endregion

--#region [pricing_scheme]
CREATE TABLE pricing_scheme (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_price DECIMAL(11,2) NOT NULL,
 instructor_payment DECIMAL(11,2) NOT NULL,
 lesson_type lesson_types NOT NULL,
 lesson_level lesson_levels NOT NULL,
 sibling_discount DECIMAL(11,2) NOT NULL,
 valid_since TIMESTAMP NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (id);
--#endregion

--#region [contact_person]
CREATE TABLE contact_person (
 student_id INT NOT NULL,
 relation_to_student VARCHAR(1000),
 phone_no VARCHAR(20),
 email VARCHAR(100)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id);
--#endregion

--#region [email]
CREATE TABLE email (
 email_address VARCHAR(100) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_address,person_id);
--#endregion

--#region [instrument]
CREATE TABLE instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 brand VARCHAR(100) NOT NULL,
 monthly_fee DECIMAL(11,2) NOT NULL,
 type_id INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);
--#endregion

--#region [lesson]
CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 level lesson_levels NOT NULL,
 type lesson_types NOT NULL,
 pricing_id INT NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);
--#endregion

--#region [rental_period]
CREATE TABLE rental_period (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 rented_from DATE NOT NULL,
 rented_until DATE NOT NULL
);

ALTER TABLE rental_period ADD CONSTRAINT PK_rental_period PRIMARY KEY (id);
--#endregion

--#region [sibling]
CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_id);
--#endregion

--#region [ensemble_lesson]
CREATE TABLE ensemble_lesson (
 lesson_id INT NULL,
 max_num_of_students INT NOT NULL,
 min_num_of_students INT NOT NULL,
 target_genre VARCHAR(100) NOT NULL
);

ALTER TABLE ensemble_lesson ADD CONSTRAINT PK_ensemble_lesson PRIMARY KEY (lesson_id);
--#endregion

--#region [group_lesson]
CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 instrument_id INT NOT NULL,
 max_num_of_students INT NOT NULL,
 min_num_of_students INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);
--#endregion

--#region [individual_lesson]
CREATE TABLE individual_lesson (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);
--#endregion

--#region [student_group]
CREATE TABLE student_group (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE student_group ADD CONSTRAINT PK_student_group PRIMARY KEY (student_id,lesson_id);
--#endregion

--#region [student_ensemble]
CREATE TABLE student_ensemble (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,lesson_id);
--#endregion


--#region [CONSTRAINTS]
ALTER TABLE person_address ADD CONSTRAINT FK_person_address_0 FOREIGN KEY (person_id) REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE person_address ADD CONSTRAINT FK_person_address_1 FOREIGN KEY (address_id) REFERENCES address (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE phone_no ADD CONSTRAINT FK_phone_no_0 FOREIGN KEY (person_id) REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (person_id) REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE instructor_working_time ADD CONSTRAINT FK_instructor_working_time_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id)  ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (type_id) REFERENCES instrument_type (id)  ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (pricing_id) REFERENCES pricing_scheme (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE rental_period ADD CONSTRAINT FK_rental_period_0 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE rental_period ADD CONSTRAINT FK_rental_period_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ensemble_lesson ADD CONSTRAINT FK_ensemble_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument_type (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (instrument_id) REFERENCES instrument_type (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE student_group ADD CONSTRAINT FK_student_group_0 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE student_group ADD CONSTRAINT FK_student_group_1 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_2 FOREIGN KEY (lesson_id) REFERENCES ensemble_lesson (lesson_id) ON UPDATE CASCADE ON DELETE RESTRICT;
--#endregion

--#region [TRIGGERFUNCTIONS]

-- FUNCTION: set_price_id()
CREATE OR REPLACE FUNCTION soundgood.set_price_id()
RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    -- Find the matching price_id from the pricing_scheme table
    SELECT id INTO NEW.pricing_id
    FROM  soundgood.pricing_scheme
    WHERE lesson_type = NEW.type AND lesson_level = NEW.level;

    -- If no match is found, raise an exception
    IF NEW.pricing_id IS NULL THEN
        RAISE EXCEPTION 'No matching pricing scheme found for type % and level %', NEW.type, NEW.level;
    END IF;

    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION soundgood.set_price_id()
    OWNER TO postgres;

-- FUNCTION: check_rental_period_constraints()
CREATE OR REPLACE FUNCTION soundgood.check_rental_period_constraints()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    -- Check if the rental period is longer than 12 months
    IF NEW.rented_until > NEW.rented_from + INTERVAL '12 months' THEN
        RAISE EXCEPTION 'Rental period cannot exceed 12 months';
    END IF;

    -- Check if the student is trying to rent more than 2 instruments at the same time
    IF (SELECT COUNT(*)
        FROM soundgood.rental_period
        WHERE student_id = NEW.student_id
          AND rented_until >= NOW()) >= 2 THEN
        RAISE EXCEPTION 'Student can only rent up to two instruments at the same time';
    END IF;

    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION soundgood.check_rental_period_constraints()
    OWNER TO postgres;


-- FUNCTION: check_sibling_pair()
CREATE OR REPLACE FUNCTION soundgood.check_sibling_pair()
RETURNS trigger AS $$
BEGIN
    -- Check for an existing pair where order doesn't matter
 	IF EXISTS (
        SELECT 1
        FROM soundgood.sibling
        WHERE (student_id = NEW.student_id AND sibling_id = NEW.sibling_id)
           OR (student_id = NEW.sibling_id AND sibling_id = NEW.student_id)
    ) THEN
        RAISE EXCEPTION 'Duplicate sibling pair detected: (% %)', NEW.student_id, NEW.sibling_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

ALTER FUNCTION soundgood.check_sibling_pair()
    OWNER TO postgres;
--#endregion

--#region [TRIGGERS]

-- Trigger: trg_set_price_id
CREATE TRIGGER trg_set_price_id
BEFORE INSERT OR UPDATE 
ON soundgood.lesson
FOR EACH ROW
EXECUTE FUNCTION set_price_id();


-- Trigger: insert_constraints
CREATE OR REPLACE TRIGGER insert_constraints
    BEFORE INSERT
    ON soundgood.rental_period
    FOR EACH ROW
    EXECUTE FUNCTION check_rental_period_constraints();

-- Trigger: enforce_unique_sibling_pair
CREATE TRIGGER enforce_unique_sibling_pair
    BEFORE INSERT 
    ON soundgood.sibling
    FOR EACH ROW
    EXECUTE FUNCTION check_sibling_pair();
--#endregion