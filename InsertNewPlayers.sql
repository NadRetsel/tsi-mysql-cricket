-- ADDING NEW PLAYERS

-- Teams before adding
SELECT PlayerTeam.id, Player.name as player_name, Player.id AS player_id, Team.name AS team_name, Team.id AS team_id FROM PlayerTeam
INNER JOIN Player ON Player.id = PlayerTeam.player_id
INNER JOIN Team ON Team.id = PlayerTeam.team_id;

-- New players to add
INSERT INTO Player(name, position, bat_style, bowl_style_arm, bowl_style_pace, bowl_style_spin) VALUES
	("New English", "B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("New Ozzie", "AR", "L", "R", DEFAULT, "LB")
;

INSERT INTO PlayerTeam(player_id, team_id) VALUES
	(	(SELECT id FROM (SELECT id FROM Player WHERE name = "New English" ORDER BY id DESC LIMIT 1) AS NewPlayerID), 
		(SELECT id FROM (SELECT id FROM Team WHERE name LIKE "%England%" ORDER BY id DESC LIMIT 1) AS TeamID)),
	
	(	(SELECT id FROM (SELECT id FROM Player WHERE name = "New Ozzie" ORDER BY id DESC LIMIT 1) AS NewPlayerID), 
		(SELECT id FROM (SELECT id FROM Team WHERE name LIKE "%Australia%" ORDER BY id DESC LIMIT 1) AS TeamID))
;

-- Teams after adding
SELECT PlayerTeam.id, Player.name AS player_name, Player.id AS player_id, Team.name AS team_name, Team.id AS team_id FROM PlayerTeam
INNER JOIN Player ON Player.id = PlayerTeam.player_id
INNER JOIN Team ON Team.id = PlayerTeam.team_id
ORDER BY PlayerTeam.id DESC;


-- Delete new members
DELETE FROM Player WHERE name = "New English";
DELETE FROM Player WHERE name = "New Ozzie";

SELECT PlayerTeam.id, Player.name AS player_name, Player.id AS player_id, Team.name AS team_name, Team.id AS team_id FROM PlayerTeam
INNER JOIN Player ON Player.id = PlayerTeam.player_id
INNER JOIN Team ON Team.id = PlayerTeam.team_id
ORDER BY PlayerTeam.id DESC;
