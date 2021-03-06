SELECT ls.[FirstName]
      ,ls.[LastName]
      ,ls.[Position] [Previous Position]
	  ,CASE p.[Position] WHEN 0 THEN 'Defender' WHEN 1 THEN 'Midfielder' WHEN 2 THEN 'Forward' ELSE 'Unknown' END [Current Position]
      ,ls.[Team] [Previous Team]
	  ,t.Name [Current Team]
      ,ls.[League] [Previous League]
	  ,l.Name [Current League]
      ,[Goals]
  FROM [DreamLeague].[dbo].[SeasonScorers] ls
  INNER JOIN DreamLeague.League.Players p
  ON ls.FirstName = p.FirstName
  AND ls.LastName = p.LastName
  INNER JOIN DreamLeague.League.Teams t
  ON p.TeamId = t.TeamId
  INNER JOIN DreamLeague.League.Leagues l
  ON t.LeagueId = l.LeagueId
  ORDER BY p.Position,
Goals DESC,
ls.LastName,
ls.FirstName,
t.Name
