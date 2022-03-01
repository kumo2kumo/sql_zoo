-- 13. Find the capital AND the name WHERE the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%')

-- 14. Find the capital AND the name WHERE the capital is an extension of name of the country.
SELECT capital, name 
FROM world
WHERE capital != name AND capital LIKE concat('%', name, '%')

-- 15. Show the name AND the extension WHERE the capital is an extension of name of the country.
SELECT name, replace(capital, name, '') as extension
FROM world
WHERE capital != name AND capital LIKE concat('%', name, '%')
