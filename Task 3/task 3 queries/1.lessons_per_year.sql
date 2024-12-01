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
