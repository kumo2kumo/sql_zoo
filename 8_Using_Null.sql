-- 1. List the teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept IS NULL

-- 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
-- !!Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

-- 3. Use a different JOIN so that all teachers are listed.
SELECT t.name, dept.name
FROM teacher t
LEFT JOIN dept ON t.dept = dept.id

-- 4. Use a different JOIN so that all departments are listed.
SELECT t.name, dept.name
FROM teacher t
RIGHT JOIN dept ON t.dept = dept.id

-- 5. Show teacher name and mobile number or '07986 444 2266'
-- COALESCE = can be useful when you want to replace a NULL value with some other value.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher

-- 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT t.name, COALESCE(dept.name, 'None')
FROM teacher t
LEFT JOIN dept ON t.dept = dept.id

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
-- nullはcountされない
SELECT count(name), count(mobile)
FROM teacher

-- 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, count(t.dept)
FROM teacher t
RIGHT JOIN dept ON t.dept = dept.id
GROUP BY dept.name

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT t.name,
CASE WHEN t.dept IN (1, 2) THEN 'Sci' ELSE 'Art' END dist
FROM teacher t

-- 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT t.name, 
CASE WHEN t.dept IN (1, 2) THEN 'Sci'
    WHEN t.dept = 3 THEN 'Art'
    ELSE 'None'
END dist 
FROM teacher t

