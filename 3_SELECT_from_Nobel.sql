-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * 
FROM nobel
WHERE (yr = 1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry ')

-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT *
FROM nobel
WHERE yr = 1980 AND subject AND IN ('Chemistry', 'Medicine')

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT *
FROM nobel 
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- 12. Find all details of the prize won by EUGENE O'NEILL
SELECT *
FROM nobel 
WHERE wINner = 'EUGENE O''NEILL'

-- 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT wINner,  yr, subject 
FROM nobel 
WHERE wINner LIKE 'Sir%'
ORDER by yr desc, winner 

-- 14. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
-- subject IN ('Physics','Chemistry')は該当を1.非該当を0で返す
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics','Chemistry') , subject, winner
