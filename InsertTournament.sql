-- Insert 2023 Ashes tournament
INSERT INTO Tournament(name, year) VALUES ("Ashes", 2023);


-- Insert games from 2023 Ashes
INSERT INTO Game(team_a_id, team_b_id, ground_id, winner_a, date) VALUES
	(
		(SELECT id FROM Team WHERE name LIKE "England%National%" ORDER BY id DESC LIMIT 1),
		(SELECT id FROM Team WHERE name LIKE "Australia%National%" ORDER BY id DESC LIMIT 1),
        (SELECT id FROM Ground WHERE name = "Edgbaston Cricket Ground" AND location = "Birmingham, UK" ORDER BY id DESC LIMIT 1),
        "LOSE",
        "2023-06-16"
    ),
	(
		(SELECT id FROM Team WHERE name LIKE "England%National%" ORDER BY id DESC LIMIT 1),
		(SELECT id FROM Team WHERE name LIKE "Australia%National%" ORDER BY id DESC LIMIT 1),
        (SELECT id FROM Ground WHERE name = "Lord's Cricket Ground" AND location = "London, UK" ORDER BY id DESC LIMIT 1),
        "LOSE",
        "2023-06-28"
    ),
	(
		(SELECT id FROM Team WHERE name LIKE "England%National%" ORDER BY id DESC LIMIT 1),
		(SELECT id FROM Team WHERE name LIKE "Australia%National%" ORDER BY id DESC LIMIT 1),
        (SELECT id FROM Ground WHERE name = "Headingley Cricket Ground" AND location = "Leeds, UK" ORDER BY id DESC LIMIT 1),
        "WIN",
        "2023-07-06"
    ),
	(
		(SELECT id FROM Team WHERE name LIKE "England%National%" ORDER BY id DESC LIMIT 1),
		(SELECT id FROM Team WHERE name LIKE "Australia%National%" ORDER BY id DESC LIMIT 1),
        (SELECT id FROM Ground WHERE name = "Old Trafford Cricket Ground" AND location = "Manchester, UK" ORDER BY id DESC LIMIT 1),
        "DRAW",
        "2023-07-19"
    ),
	(
		(SELECT id FROM Team WHERE name LIKE "England%National%" ORDER BY id DESC LIMIT 1),
		(SELECT id FROM Team WHERE name LIKE "Australia%National%" ORDER BY id DESC LIMIT 1),
        (SELECT id FROM Ground WHERE name = "The Oval" AND location = "London, UK" ORDER BY id DESC LIMIT 1),
        "WIN",
        "2023-07-27"
    )
;

-- Insert games to the tournament
INSERT INTO TournamentGame(tournament_id, game_id)
SELECT tournament_id, game_id FROM
	(
    (SELECT id AS tournament_id FROM Tournament WHERE name = "Ashes" AND year = 2023 ORDER BY id DESC LIMIT 1) AS TournamentID,
	(SELECT id AS game_id FROM Game ORDER BY id DESC LIMIT 5) AS GameID
    );
    
SELECT * FROM TournamentGame;
SELECT * FROM Tournament;
SELECT * FROM Game;
