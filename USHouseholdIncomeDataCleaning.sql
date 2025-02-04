# US Household Data Cleaning

SELECT *
FROM us_project.USHouseholdIncome;

SELECT *
FROM us_project.ushouseholdincome_statistics;

SELECT id, COUNT(id)
FROM us_project.ushouseholdincome_statistics
GROUP BY id
HAVING COUNT(id) > 1;

SELECT *
FROM (
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_project.USHouseholdIncome
) duplicates
WHERE row_num > 1
;

DELETE FROM USHouseholdIncome
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_project.USHouseholdIncome
		) duplicates
WHERE row_num > 1)
;

SELECT State_Name
FROM us_project.USHouseholdIncome
GROUP BY 1
;

UPDATE us_project.USHouseholdIncome
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE us_project.USHouseholdIncome
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT DISTINCT State_ab
FROM us_project.USHouseholdIncome
ORDER BY 1
;

SELECT *
FROM us_project.USHouseholdIncome
WHERE County = 'Autauga County'
GROUP BY 1
;

UPDATE USHouseholdIncome
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City =  'Vinemont'
;

SELECT Type, COUNT(Type)
FROM USHouseholdIncome
GROUP BY Type
;

UPDATE USHouseholdIncome
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, AWater
FROM USHouseholdIncome
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL
;
