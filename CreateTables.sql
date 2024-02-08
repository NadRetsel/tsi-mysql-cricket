DROP TABLE IF EXISTS GamePlayerBowlingStat;
DROP TABLE IF EXISTS GamePlayerBattingStat;
DROP TABLE IF EXISTS TournamentGame;
DROP TABLE IF EXISTS Tournament;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS PlayerTeam;
DROP TABLE IF EXISTS Ground;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team;

CREATE TABLE IF NOT EXISTS Player(
	id 				INT NOT NULL AUTO_INCREMENT,
    name 			VARCHAR(50) NOT NULL,
    position 		ENUM("B","AR","WK","PB","SB"),
    bat_style 		ENUM("L","R"),
    bowl_style_arm 	ENUM("L","R"),
    bowl_style_pace ENUM("F", "FM", "MF", "M", "MS", "SM", "S") 	DEFAULT NULL,
    bowl_style_spin ENUM("OB", "LB", "LBG", "SLA", "SLW", "LAG") 	DEFAULT NULL,
    
    PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS Team(
	id 			INT NOT NULL AUTO_INCREMENT,
    name 		VARCHAR(100) NOT NULL,
    
    PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS PlayerTeam(
	id 			INT NOT NULL AUTO_INCREMENT,
    player_id 	INT NOT NULL,
    team_id 	INT NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(player_id) 	REFERENCES Player(id) 	ON DELETE CASCADE,
    FOREIGN KEY(team_id) 	REFERENCES Team(id) 	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Ground(
	id 			INT NOT NULL AUTO_INCREMENT,
    name 		VARCHAR(50),
    location 	VARCHAR(50),
	
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Game(
	id 			INT NOT NULL AUTO_INCREMENT,
	team_a_id 	INT NOT NULL,
    team_b_id 	INT NOT NULL,
    ground_id 	INT NOT NULL,
    winner_a 	ENUM("WIN", "LOSE", "DRAW") DEFAULT NULL,
    date 		DATE,
    
    PRIMARY KEY(id),
    FOREIGN KEY(team_a_id) REFERENCES Team(id),
    FOREIGN KEY(team_b_id) REFERENCES Team(id),
    FOREIGN KEY(ground_id) REFERENCES Ground(id)
);
CREATE TABLE IF NOT EXISTS Tournament(
	id 		INT NOT NULL AUTO_INCREMENT,
    name 	VARCHAR(50),
    year 	YEAR,
	
    PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS TournamentGame(
	id 				INT NOT NULL AUTO_INCREMENT,
    tournament_id 	INT NOT NULL,
    game_id 		INT NOT NULL,
	
    PRIMARY KEY(id),
    FOREIGN KEY(tournament_id) 	REFERENCES Tournament(id),
    FOREIGN KEY(game_id) 		REFERENCES Game(id)
);


CREATE TABLE IF NOT EXISTS GamePlayerBattingStat(
	id 			INT NOT NULL AUTO_INCREMENT,
	game_id 	INT NOT NULL,
    player_id 	INT NOT NULL,
    runs_scored INT,
    balls_faced INT,
    fours 		INT,
    sixs 		INT,
    player_out 	BOOL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(game_id) 	REFERENCES Game(id),
    FOREIGN KEY(player_id) 	REFERENCES Player(id)
);
CREATE TABLE IF NOT EXISTS GamePlayerBowlingStat(
	id 				INT NOT NULL AUTO_INCREMENT,
	game_id 		INT NOT NULL,
    player_id 		INT NOT NULL,
    overs_bowled 	INT,
    maidens_bowled 	INT,
    runs_codeded	INT,
    wickets_taken 	INT,
    
    PRIMARY KEY(id),
    FOREIGN KEY(game_id) 	REFERENCES Game(id),
    FOREIGN KEY(player_id) 	REFERENCES Player(id)
);

