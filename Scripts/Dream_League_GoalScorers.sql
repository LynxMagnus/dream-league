SELECT p.[PlayerId]
      ,CASE [Position] WHEN 0 THEN 'Defender' WHEN 1 THEN 'Midfielder' WHEN 2 THEN 'Forward' ELSE 'Unknown' END Position
      ,COALESCE([FirstName],'') FirstName
      ,COALESCE([LastName],'') LastName
      ,t.[Name] Team
	  ,t.Alias
	  ,l.Name League
	  ,g.Goals
INTO DreamLeague.dbo.SeasonScorers
FROM [DreamLeague].[League].[Players] p
INNER JOIN 
(SELECT PlayerId, COUNT(PlayerId) Goals
FROM DreamLeague.Results.Goals g
WHERE Cup = 0
GROUP BY PlayerId
) g
ON p.PlayerId = g.PlayerId
INNER JOIN DreamLeague.League.Teams t
ON p.TeamId = t.TeamId
INNER JOIN DreamLeague.League.Leagues l
ON t.LeagueId = l.LeagueId
ORDER BY p.Position,
Goals DESC,
p.LastName,
p.FirstName,
t.Name
