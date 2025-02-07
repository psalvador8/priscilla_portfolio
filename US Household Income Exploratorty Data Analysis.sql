# US Household Income Exploratorty Data Analysis


SELECT * 
FROM USHouseholdIncome
;

SELECT * 
FROM usHouseholdIncome_statistics
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name 
ORDER BY 2 DESC
LIMIT 10
;

SELECT *
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics US
	ON u.id = us.id
WHERE Mean <> 0
;

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 
;

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
;

SELECT Type, ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 2 DESC
;

SELECT Type, COUNT(Type),ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 3 DESC
LIMIT 20
;

SELECT Type, COUNT(Type),ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
;

SELECT u.State_Name, City, ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean), 1) DESC
;