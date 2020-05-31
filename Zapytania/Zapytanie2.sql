-- MS SQL
SELECT s.Country, COUNT(s.Country) NumberOfMatches
FROM [Games].[dbo].[Game] g inner join [Games].[dbo].[Stadium] s ON g.StadiumID = s.StadiumID
GROUP BY s.Country
ORDER BY 2 DESC

-- MemSQL
SELECT s.Country, COUNT(s.Country) NumberOfMatches
FROM Game g inner join Stadium s ON g.StadiumID = s.StadiumID
GROUP BY s.Country
ORDER BY 2 DESC
