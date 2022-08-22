/*HEAVIEST HITTERS*/
SELECT AVG(people.weight), teams.name, batting.yearid
FROM people
JOIN batting
 	ON people.playerid = batting.playerid
JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY AVG(people.weight) DESC;
 
 /*SHORTEST SLUGGERS*/
SELECT AVG(people.height), teams.name, batting.yearid
FROM people
JOIN batting
	ON people.playerid = batting.playerid
JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY AVG(people.height) ASC;

/*BIGGEST SPENDERS*/
SELECT SUM(salary), teams.name, salaries.yearid
FROM salaries
LEFT JOIN teams
	ON teams.teamid = salaries.teamid AND teams.yearid = salaries.yearid
GROUP BY teams.name, salaries.yearid
ORDER BY SUM(salary) DESC;

/*MOST BANG FOR THEIR BUCK IN 2010*/
SELECT ROUND(SUM(salary)/teams.w), teams.w, teams.name, salaries.yearid
FROM salaries
LEFT JOIN teams
	ON teams.teamid = salaries.teamid AND teams.yearid = salaries.yearid
WHERE teams.yearid = 2010
GROUP BY teams.name, salaries.yearid, teams.w
ORDER BY SUM(salary)/teams.w ASC;

/*PRICIEST STARTER*/
SELECT people.namefirst, people.namelast, salaries.salary/pitching.g AS cost_per_game, salaries.yearid, pitching.g
FROM salaries
JOIN pitching
	ON salaries.playerid = pitching.playerid AND salaries.yearid = pitching.yearid AND salaries.teamid = pitching.teamid
JOIN people
	ON salaries.playerid = people.playerid
WHERE pitching.g > 10
ORDER BY 3 DESC;

/*HAS-BEEN PEASANT LOWEST SALARY*/
SELECT
  people.namefirst,
  people.namelast,
  awardsplayers.awardid AS Award,
  awardsplayers.yearid AS Year,
  salaries.salary AS Salary
FROM awardsplayers
JOIN salaries 
	ON awardsplayers.yearid = salaries.yearid AND awardsplayers.playerid = salaries.playerid
JOIN people 
	ON people.playerid = awardsplayers.playerid
ORDER BY 5;