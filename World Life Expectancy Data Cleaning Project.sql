# World Life Expectancy Project (Data Cleaning)

SELECT * 
FROM world_life_expectancy
;

SELECT Country, Year, CONCAT(Country, YEAR), COUNT(CONCAT(Country, YEAR)) 
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, YEAR)
HAVING COUNT(CONCAT(Country, YEAR)) > 1
;

SELECT *
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
    FROM world_life_expectancy
    ) AS Row_table
WHERE Row_Num > 1
;

DELETE FROM world_life_expectancy
WHERE
	Row_ID IN (
    SELECT Row_ID
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
    FROM world_life_expectancy
    ) AS Row_table
WHERE Row_Num > 1
)
;

SELECT *
FROM world_life_expectancy
WHERE Status = '' OR Status IS NULL
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2. Status =  'Developing'
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2. Status =  'Developed'
;

SELECT * 
FROM world_life_expectancy
WHERE Lifeexpectancy = ''
;

SELECT Country, Year, Lifeexpectancy
FROM world_life_expectancy
WHERE Lifeexpectancy = ''
;

SELECT t1.Country, t1.YEAR, t1.Lifeexpectancy,
t2.Country, t2.YEAR, t2.Lifeexpectancy,
t3.Country, t3.YEAR, t3.Lifeexpectancy
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.YEAR = t2.YEAR - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country 
    AND t1.YEAR = t3.YEAR + 1
WHERE t1.Lifeexpectancy = ''
;



SELECT t1.COUNTRY, t1.YEAR, t1.Lifeexpectancy,
t2.COUNTRY, t2.YEAR, t2.Lifeexpectancy,
t3.COUNTRY, t3.YEAR, t3.Lifeexpectancy,
ROUND((t2.Lifeexpectancy + t3.Lifeexpectancy)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.YEAR = t2.YEAR - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country 
    AND t1.YEAR = t3.YEAR + 1
WHERE t1.Lifeexpectancy = ''
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.YEAR = t2.YEAR - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country 
    AND t1.YEAR = t3.YEAR + 1
SET t1.Lifeexpectancy = ROUND((t2.Lifeexpectancy + t3.Lifeexpectancy)/2,1)
WHERE t1.Lifeexpectancy = ''
;


