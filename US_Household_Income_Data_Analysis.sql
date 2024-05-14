# US Household Income Project (Data Analysis)

# TOP 10 LARGEST STATES (By Land)

SELECT State_Name,SUM(Aland), SUM(Awater)
FROM income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

# TOP 10 LARGEST STATES (By Water)

SELECT State_Name,SUM(Aland), SUM(Awater)
FROM income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

# INNER JOIN ON BOTH TABLES 

SELECT *
FROM income u
INNER JOIN statistics us
ON u.id = us.id
WHERE Mean <> 0;

# TOP 5 LOWEST AVG HOUSEHOLD INCOME TERRITORIES

SELECT u.State_Name, ROUND(AVG(Mean),1) Average_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 ASC
LIMIT 5;

# TOP 5 HIGHEST AVG HOUSEHOLD INCOME TERRITORIES

SELECT u.State_Name, ROUND(AVG(Mean),1) Average_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5;

# TOP 5 LOWEST MEDIAN HOUSEHOLD INCOME TERRITORIES

SELECT u.State_Name, ROUND(AVG(Median),1) Median_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 ASC
LIMIT 5;

# TOP 5 HIGHEST MEDIAN HOUSEHOLD INCOME TERRITORIES

SELECT u.State_Name, ROUND(AVG(Median),1) Median_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5;

# HIGHEST AVG INCOME BY TYPE

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1) Average_Household_Income, ROUND(AVG(Median),1) Median_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 3 DESC;

# HIGHEST MEDIAN INCOME BY TYPE

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1) Average_Household_Income, ROUND(AVG(Median),1) Median_Household_Income
FROM income u
INNER JOIN statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC;

# WHERE ARE ALL THE COMMUNITIES?

SELECT *
FROM income
WHERE Type = 'Community';

# HIGHEST AVERAGE INCOME BY CITY

SELECT u.State_Name, City, ROUND(AVG(Mean),1) Average_Household_Income, ROUND(AVG(Median),1) Median_Household_Income
FROM income u
INNER JOIN statistics us
ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY 3 DESC
LIMIT 10;


