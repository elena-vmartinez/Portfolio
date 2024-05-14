# US Household Income Project (Data Cleaning)

SELECT COUNT(id)
FROM income;

SELECT COUNT(id)
FROM statistics;

# REMOVING DUPLICATES

-- IDENTIFYING

SELECT id, COUNT(id)
FROM income
GROUP BY id
HAVING COUNT(id) > 1;

SELECT id, COUNT(id)
FROM statistics
GROUP BY id
HAVING COUNT(id) > 1;

-- REMOVING

SELECT *
FROM
	(SELECT row_id, id,
	ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
	FROM income) duplicates
WHERE row_num > 1
;

DELETE FROM income
WHERE row_id IN 
	(SELECT row_id FROM
		(SELECT row_id, id,
		ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
		FROM income) duplicates
	WHERE row_num > 1);

# FIXING SPELLING ERROR

SELECT DISTINCT State_Name
FROM income
ORDER BY 1;

SELECT Type, COUNT(Type)
FROM income
GROUP BY Type;

-- UPDATING

UPDATE income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE income
SET Type = 'Borough'
WHERE Type = 'Boroughs';


# MISSING

SELECT *
FROM income
WHERE Place = '';

UPDATE income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT ALand, AWater
FROM income
WHERE Awater = 0 OR Awater = '' OR Awater IS NULL
;

SELECT ALand, AWater
FROM income
WHERE Aland = 0 OR Aland = '' OR Aland IS NULL
;


