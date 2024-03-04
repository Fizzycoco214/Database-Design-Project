-- Shows all of the players who won a game in Grand Finals
SELECT *
FROM Player
where teamID in 
    (SELECT teamID
	FROM Match_Performance NATURAL JOIN Match NATURAL JOIN Round
	WHERE name = "Grand Finals" AND placement = 1)

-- Shows the average amount of eliminations that teams got at a certain placement
-- Although it might seem weird that 2nd-7th place has more eliminations, those teams likely would lose reasources fighting earlier on, making them weaker for the final fight
-- I didn't use actual data for this but it's interesting to see this trend show up in the fake data too
SELECT placement, avg(eliminations) as Average_Eliminations
FROM Match_Performance
GROUP BY placement

-- Shows the average placement of a team based on how many eliminations they got
SELECT eliminations, avg(placement) as Average_Placement
FROM Match_Performance
GROUP BY eliminations
ORDER BY eliminations DESC

-- Shows all of the players who won a match without any eliminations
SELECT name, teamID
FROM Match_Performance NATURAL JOIN Match NATURAL JOIN Team NATURAL JOIN Player
WHERE placement = 1 AND eliminations = 0

-- Shows the average placement and eliminations of the youngest and oldest players
SELECT age, avg(eliminations) as Average_Eliminations, avg(placement) as Average_Placement
FROM Match_Performance NATURAL JOIN Match NATURAL JOIN Team NATURAL JOIN Player
GROUP BY age HAVING age = 16
UNION
SELECT age, avg(eliminations) as Average_Eliminations, avg(placement) as Average_Placement
FROM Match_Performance NATURAL JOIN Match NATURAL JOIN Team NATURAL JOIN Player
GROUP BY age HAVING age = 26