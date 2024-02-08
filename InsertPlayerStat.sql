-- First innings
INSERT INTO GamePlayerBattingStat(game_id, player_id, runs_scored, balls_faced, fours, sixs, player_out)
(
    SELECT game_id, player_id, runs_scored, balls_faced, fours, sixs, player_out FROM
	(
		(
        SELECT Game.id AS game_id FROM Game 
		INNER JOIN Ground ON Game.ground_id = Ground.id
		WHERE Ground.name = "Edgbaston Cricket Ground" AND Ground.location = "Birmingham, UK" AND Game.date = "2023-06-16" 
		) AS GameID,
            
		(
        SELECT * FROM 
			(
            SELECT Player.id AS player_id, 61 AS runs_scored, 73 AS balls_faced, 7 AS fours, 0 AS sixs, False AS player_out FROM Player 
			INNER JOIN PlayerTeam ON Player.id = PlayerTeam.player_id
			INNER JOIN Team ON Team.id = PlayerTeam.team_id
			WHERE Team.name LIKE "England%National%" AND Player.name = "Zak Crawley" ORDER BY Player.id DESC LIMIT 1
            ) AS Zak
		
		UNION
		
		SELECT * FROM 
			(
            SELECT Player.id AS player_id, 12 AS runs_scored, 10 AS balls_faced, 2 AS fours, 0 AS sixs, False AS player_out FROM Player 
			INNER JOIN PlayerTeam ON Player.id = PlayerTeam.player_id
			INNER JOIN Team ON Team.id = PlayerTeam.team_id
			WHERE Team.name LIKE "England%National%" AND Player.name = "Ben Duckett" ORDER BY Player.id DESC LIMIT 1
            ) AS Ben
		) AS AllPlayers
	)
);

SELECT * FROM GamePlayerBattingStat;




CREATE VIEW PlayerZak AS 
SELECT Player.id AS player_id, 61 AS runs_scored, 73 AS balls_faced, 7 AS fours, 0 AS sixs, False AS player_out FROM Player 
INNER JOIN PlayerTeam ON Player.id = PlayerTeam.player_id
INNER JOIN Team ON Team.id = PlayerTeam.team_id
WHERE Team.name LIKE "England%National%" AND Player.name = "Zak Crawley" ORDER BY Player.id DESC LIMIT 1
;

CREATE VIEW PlayerBen AS
SELECT Player.id AS player_id, 12 AS runs_scored, 10 AS balls_faced, 2 AS fours, 0 AS sixs, False AS player_out FROM Player 
INNER JOIN PlayerTeam ON Player.id = PlayerTeam.player_id
INNER JOIN Team ON Team.id = PlayerTeam.team_id
WHERE Team.name LIKE "England%National%" AND Player.name = "Ben Duckett" ORDER BY Player.id DESC LIMIT 1
;
    
-- SELECT player_id, runs_scored, balls_faced, fours, sixs, player_out FROM
SELECT * FROM
	(SELECT * FROM PlayerZak 
	UNION 
SELECT * FROM PlayerBen) AS X
;
