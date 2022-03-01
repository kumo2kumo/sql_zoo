-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
SELECT name, round(population/1000000, 2), round(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name, round(gdp/population, -3) 
FROM world
WHERE gdp >= 1000000000000

-- 11. Show the name and capital WHERE the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE length(name) = length(capital)

-- 12. Show the name and the capital WHERE the first letters of each match. Don't include countries WHERE the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE left(name, 1) = left(capital, 1) AND name <> capital 

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'