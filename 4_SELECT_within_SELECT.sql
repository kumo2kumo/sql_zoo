-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name 
FROM world 
WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') 
AND continent = 'Europe'

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' BY name = 'Australia')
ORDER BY name

-- 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'PolAND')

-- 5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, 
concat(round(population/(SELECT population FROM world WHERE name = 'Germany')*100),'%') as percentage 
FROM world
WHERE continent = 'Europe'

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name 
FROM world
WHERE gdp > all(SELECT gdp FROM world WHERE gdp>0 AND continent = 'Europe')

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area:
-- We can use the word ALL to allow >= or > or < or <=to act over a list.
SELECT continent, name, area FROM world x
WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent)

-- 8. List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world x
WHERE name <= all (SELECT name FROM world y WHERE x.continent = y.continent)

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
FROM world x
WHERE 25000000 >= all(SELECT population FROM world y WHERE x.continent = y.continent AND population> 0)

-- 10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
-- nullは等号(=)、等号否定(!=)、不等号(<>≦≧)の対象にならない
SELECT name, continent
FROM world x 
WHERE population >= all(SELECT 3*population FROM world y WHERE x.continent = y.continent AND x.name != y.name AND population > 0)
