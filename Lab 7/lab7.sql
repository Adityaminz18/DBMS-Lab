-- 8. Practical 8:

-- 1. Find all information of sailors who have reserved boat number 101.

SELECT 
	s.s_id, 
    s.s_name, 
    s.s_dob, 
    s.s_rating
FROM sailors s
JOIN reserves r on s.s_id = r.s_id
WHERE r.b_id = 101
;

-- 2. Find the names of sailors who have reserved a red boat, and list in the order of age.

SELECT 
	DISTINCT s.s_name AS sailor_name,
	YEAR(CURRENT_DATE) - YEAR(s.s_dob) AS age
FROM sailors s
JOIN reserves r ON s.s_id = r.s_id
JOIN boats b ON r.b_id = b.b_id
WHERE b.bcolor = 'red' 
ORDER BY age;

-- 3. Find the names of sailors who have reserved at least one boat.

SELECT 
    s.s_name AS sailor_name
FROM sailors s
JOIN reserves r ON s.s_id = r.s_id 
GROUP BY s.s_id
;

-- 4. Find the ids and names of sailors who have reserved two different boats on the same day.

SELECT 
	DISTINCT r.s_id,
	s.s_name
FROM reserves r
JOIN sailors s ON r.s_id = s.s_id
WHERE r.s_id IN (
	SELECT s_id
    FROM reserves
    GROUP BY s_id, day
    HAVING COUNT(DISTINCT b_id) >= 2 )
    ORDER BY r.s_id;

-- 5. Find the ids of sailors who have reserved a red boat or a green boat.

SELECT DISTINCT r.s_id
FROM reserves r 
JOIN boats b ON r.b_id = b.b_id
WHERE b.bcolor IN ('red','green') ;

-- 6. Find the names of sailors who have reserved boat 103.

SELECT s.s_name
FROM sailors s
JOIN reserves r ON s.s_id = r.s_id
WHERE b_id = 103 ;

-- 7. Find the name and the age of the youngest sailor

SELECT 
	s.s_name AS youngest_sailor,
    YEAR(CURRENT_DATE) - YEAR(s_dob) AS age
FROM sailors s
HAVING age = (SELECT MIN(YEAR(CURRENT_DATE) - YEAR(s_dob))
FROM sailors)
;

select * FROM SAILORS;

-- 8. Find the names and ratings of sailor whose rating is better
-- than some sailor called Horatio

SELECT 
	s.s_name,
    s.s_rating
FROM sailors s
JOIN(
SELECT 
	s_name,
    s_rating
FROM sailors
where s_name = 'Horataio'
) AS s1 
WHERE s.s_name <> s1.s_name 
AND s.s_rating > s1.s_rating
;

-- 9. Find the names of sailors who have reserved all boats.

SELECT s.s_name AS sailor_name
FROM sailors s
JOIN reserves r ON r.s_id = s.s_id
GROUP BY r.s_id
HAVING COUNT(r.b_id) = (SELECT COUNT(*) 
FROM boats ) ;

SELECT * FROM RESERVES ;

-- 10. Count the number of different sailor names

SELECT COUNT(sailor_names.s_name) AS unique_sailor_names
FROM (
SELECT DISTINCT s_name
FROM sailors) AS sailor_names
;

-- 11. Calculate the average age of all sailors

SELECT AVG(sailor_age.age) AS average_age
FROM(
SELECT YEAR(CURRENT_DATE) - YEAR(s_dob) AS age
FROM sailors) AS sailor_age;

-- 12. Find the name and the age of the youngest sailor.

SELECT 
	s.s_name
	FROM sailors s
HAVING YEAR(CURRENT_DATE) - YEAR(s_dob) = 
(SELECT MIN(YEAR(CURRENT_DATE) - YEAR(s_dob)) FROM sailors)
;

-- 13. Find the average age of sailors for each rating level
select  (YEAR(CURRENT_DATE) - YEAR(s_dob)) AS age, s_rating from sailors;
SELECT  
	round(AVG(YEAR(CURRENT_DATE) - YEAR(s_dob))) AS age,
	s_rating 
FROM sailors 
GROUP BY s_rating
ORDER BY s_rating ;

-- 14. Find the average age of sailors for each rating level that has at least two sailors.

SELECT
	s_rating AS rating,
    AVG(YEAR(CURRENT_DATE()) - YEAR(s_dob)) AS average_age
FROM sailors
GROUP BY rating
HAVING COUNT(*) >= 2
ORDER BY rating
;

-- 15. Find the colors of boats reserved by lubber

SELECT DISTINCT 
	b.bcolor AS boats_reserved_by_lubber
FROM sailors s 
JOIN reserves r ON s.s_id=r.s_id 
JOIN boats b ON r.b_id=b.b_id 
WHERE s.s_name = 'Lubber';


