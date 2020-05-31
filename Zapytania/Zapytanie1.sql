-- MS SQL
SELECT r.TeamID, r.Name, r.Country, COUNT(r.TeamID) Wins
FROM (SELECT t.TeamID, t.Name, t.Country
	  FROM [Games].[dbo].[Game] g inner join [Games].[dbo].[Team] t ON g.HostTeamID = t.TeamID
	  WHERE HostGoals > GuestGoals
	  
	  UNION ALL

	  SELECT t.TeamID, t.Name, t.Country
	  FROM [Games].[dbo].[Game] g inner join [Games].[dbo].[Team] t ON g.HostTeamID = t.TeamID
	  WHERE GuestGoals > HostGoals) as r
GROUP BY r.TeamID, r.Name, r.Country
ORDER BY 4 DESC

-- MemSQL
SELECT r.TeamID, r.Name, r.Country, COUNT(r.TeamID) Wins
FROM (SELECT t.TeamID, t.Name, t.Country
	  FROM Game g inner join Team t ON g.HostTeamID = t.TeamID
	  WHERE HostGoals > GuestGoals
	  
	  UNION ALL

	  SELECT t.TeamID, t.Name, t.Country
	  FROM Game g inner join Team t ON g.HostTeamID = t.TeamID
	  WHERE GuestGoals > HostGoals) as r
GROUP BY r.TeamID, r.Name, r.Country
ORDER BY 4 DESC
