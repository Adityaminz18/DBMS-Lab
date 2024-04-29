-- Practical 7: Group by, having clause:

-- 1. Find the age of the youngest sailors for each rating level.

SELECT 
	s_rating AS Rating,
	MIN(s_dob) AS youngest_dob,
    YEAR(CURRENT_DATE) - MIN(YEAR(s_dob)) AS youngest_age
FROM sailors
GROUP BY s_rating
ORDER BY s_rating;

-- 2. Find the age of youngest sailor who is eligible to vote for 
-- each rating level with at least two such sailor

SELECT 
    s_rating AS Rating,
    MIN(s_dob) AS youngest_dob,
    YEAR(CURRENT_DATE) - MIN(YEAR(s_dob)) AS youngest_age
FROM sailors
GROUP BY s_rating
HAVING COUNT(*) >=2
ORDER BY Rating;

-- 3. For each red boat, find the number of reservations for this boat.

SELECT
	b.b_id AS Red_Boat_ID,
	COUNT(*) AS Reservations
FROM reserves r 
JOIN boats b ON r.b_id = b.b_id 
WHERE b.bcolor = 'red'
GROUP BY b.b_id
;

-- 4. Find the average age of sailor for each rating level that has 
-- at least two such sailors.

SELECT
	s_rating AS rating,
    AVG(YEAR(CURRENT_DATE()) - YEAR(s_dob)) AS average_age
FROM sailors
GROUP BY rating
ORDER BY rating;




