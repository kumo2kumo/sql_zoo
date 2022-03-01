-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
FROM stops
JOIN route ON id=stop
WHERE company = 'LRT' AND num=4

-- 4. Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*) = 2

-- 5. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 53 AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')

-- 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
SELECT a.company, a.num, stopa.name, stopb.nameFROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num FROM route a
JOIN route b on a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num FROM route a
JOIN route b on a.company = b.company AND  a.num = b.num
JOIN stops stopa on a.stop = stopa.id
JOIN stops stopb on b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

-- 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT DISTINCT stopb.name, a.company, a.num FROM route a
JOIN route b on a.company = b.company AND a.num = b.num
JOIN stops stopa on a.stop = stopa.id
JOIN stops stopb on b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT'

-- 10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.
SELECT  a.num, a.company, stopb.name, c.num, c.company FROM route a
JOIN route b on a.company = b.company AND  a.num = b.num
JOIN (route c JOIN route d on c.company = d.company AND  c.num = d.num)
JOIN stops stopa on a.stop = stopa.id
JOIN stops stopb on b.stop = stopb.id
JOIN stops stopc on c.stop = stopc.id
JOIN stops stopd on d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart' AND stopd.name = 'Lochend' AND stopb.name = stopc.name
