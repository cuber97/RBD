-- MS SQL
SELECT t.TeamID, t.Name, t.Country, AVG(DATEDIFF(year, p.DateOfBirth, GETDATE())) [Average Player Age]
FROM [Games].[dbo].[Team] t inner join [Games].[dbo].[Player] p ON t.TeamID = p.TeamID
GROUP BY t.TeamID, t.Name, t.Country
ORDER BY 4 ASC

-- MemSQL
SELECT t.TeamID, t.Name, t.Country, CAST(AVG(timestampdiff(YEAR, p.DateOfBirth, current_date())) AS SIGNED) 'Average Player Age'
FROM Team t inner join Player p ON t.TeamID = p.TeamID
GROUP BY t.TeamID, t.Name, t.Country
ORDER BY 4 ASC
