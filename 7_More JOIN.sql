-- 6. Obtain the cast list for 'Casablanca'.
SELECT name 
FROM actor JOIN casting on actor.id = casting.actorid AND movieid = 11768

-- 7. Obtain the cast list for the film 'Alien'
SELECT name
FROM actor JOIN casting on actor.id = casting.actorid
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien')

-- 8. List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie JOIN casting on id = movieid 
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
SELECT title
FROM movie
JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1)

-- 10. List the films together with the leading star for all 1962 films.
SELECT title, name
FROM movie JOIN casting on (id = movieid AND ord = 1)
JOIN actor on actorid = actor.id
WHERE yr = 1962

-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(*) FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor   ON actorid = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(*) > 2

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor   ON actorid = actor.id
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name='Julie ANDrews'))
AND casting.ord = 1

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor
JOIN casting on actor.id = casting.actorid
WHERE ord = 1
group by name
having count(ord) >= 15

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, count(*)
FROM movie
JOIN casting on (movie.id = casting.movieid AND yr = 1978)
group by title
order by count(*) DESC, title

-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name 
FROM actor
JOIN casting on id = actorid
WHERE movieid IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel'))
AND name != 'Art Garfunkel'
