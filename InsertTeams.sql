-- CREATING FIRST SET OF PLAYERS AND TEAMS TEAMS

-- (DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)

-- England national team
INSERT INTO Team(name) VALUES ("England Men's National Cricket Team");
INSERT INTO Player(name, position, bat_style, bowl_style_arm, bowl_style_pace, bowl_style_spin) VALUES
	("Harry Brook", 	"B", "R", "R", "M", DEFAULT),
    ("Zak Crawley", 	"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Ben Duckett", 	"B", "L", DEFAULT, DEFAULT, DEFAULT),
    ("Sam Hain", 		"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Dan Lawrence", 	"B", "R", "R", DEFAULT, "OB"),
    ("Dawid Malan", 	"B", "L", "R", DEFAULT, "LB"),
    ("Ollie Pope", 		"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Joe Root", 		"B", "R", "R", DEFAULT, "OB"),
    
    ("Rehan Ahmed", 		"AR", "R", "R", DEFAULT, "LBG"),
    ("Moeen Ali", 			"AR", "L", "R", DEFAULT, "OB"),
    ("Brydon Carse", 		"AR", "R", "R", "F", DEFAULT),
    ("Sam Curran", 			"AR", "L", "L", "MF", DEFAULT),
    ("Will Jacks", 			"AR", "R", "R", DEFAULT, "OB"),
    ("Liam Livingstone", 	"AR", "R", "R", DEFAULT, "LB"),
    ("Ben Stokes", 			"AR", "L", "R", "FM", DEFAULT),
    ("Chris Woakes",	 	"AR", "R", "R", "FM", DEFAULT),
    ("Luke Wood", 			"AR", "L", "L", "FM", DEFAULT),
    
    ("Jonny Bairstow", 	"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Jos Buttler", 	"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Ben Foakes", 		"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Phil Salt", 		"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Jamie Smith", 	"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    
    ("James Anderson", 		"PB", "L", "R", "FM", DEFAULT),
    ("Jofra Archer", 		"PB", "R", "R", "F", DEFAULT),
    ("Gus Atkinson", 		"PB", "R", "R", "FM", DEFAULT),
    ("Matthew Fisher", 		"PB", "R", "R", "FM", DEFAULT),
    ("Chris Jordan", 		"PB", "R", "R", "FM", DEFAULT),
    ("Saqib Mahmood", 		"PB", "R", "R", "FM", DEFAULT),
    ("Tymal Mills", 		"PB", "R", "L", "F", DEFAULT),
    ("Matthew Potts", 		"PB", "R", "R", "FM", DEFAULT),
    ("Ollie Robinson", 		"PB", "R", "R", "MF", DEFAULT),
    ("George Scrimshaw", 	"PB", "R", "R", "MF", DEFAULT),
    ("Josh Tongue", 		"PB", "R", "R", "FM", DEFAULT),
    ("Reece Topley", 		"PB", "R", "L", "FM", DEFAULT),
    ("John Turner", 		"PB", "R", "R", "FM", DEFAULT),
    ("Mark Wood", 			"PB", "R", "R", "F", DEFAULT),
    
    ("Shoaib Bashir", 	"SB", "R", "R", DEFAULT, "OB"),
    ("Tom Hartley", 	"SB", "L", "L", DEFAULT, "SLA"),
    ("Jack Leach", 		"SB", "L", "L", DEFAULT, "SLA"),
    ("Adil Rashid", 	"SB", "R", "R", DEFAULT, "LB");
;
-- Insert players into teams
 INSERT INTO PlayerTeam(player_id, team_id)
 SELECT id,(SELECT MAX(id) FROM Team) 
 FROM Player ORDER BY id DESC LIMIT 40;
 

-- Australia national team
INSERT INTO Team(name) VALUES ("Australia Men's National Cricket Team");
INSERT INTO Player(name, position, bat_style, bowl_style_arm, bowl_style_pace, bowl_style_spin) VALUES
	("Tim David", 			"B", "R", "R", DEFAULT, "OB") ,
    ("Jake Fraser-McGurk", 	"B", "R", "R", DEFAULT, "LB"),
    ("Peter Handscomb", 	"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Marcus Harris", 		"B", "L", DEFAULT, DEFAULT, DEFAULT),
    ("Travis Head", 		"B", "L", "R", DEFAULT, "OB"),
    ("Usman Khawaja", 		"B", "L", "R", "M", DEFAULT),
    ("Marnus Labuschagne", 	"B", "R", "R", DEFAULT, "LB"),
    ("Ben McDermott", 		"B", "R", "R", DEFAULT, "OB"),
    ("Josh Philippe", 		"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Matt Short", 			"B", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Steve Smith", 		"B", "R", "R", DEFAULT, "OB"),
    ("Ashton Turner", 		"B", "R", "R", DEFAULT, "LB"),
    ("David Warner", 		"B", "L", DEFAULT, DEFAULT, DEFAULT),
    
    ("Sean Abbott", 	"AR", "R", "R", "FM", DEFAULT),
    ("Cameron Green", 	"AR", "R", "R", "FM", DEFAULT),
    ("Chris Green", 	"AR", "R", "R", DEFAULT, "OB"),
    ("Aaron Hardie", 	"AR", "R", "R", "MF", DEFAULT),
    ("Mitch Marsh", 	"AR", "R", "R", "M", DEFAULT),
    ("Glenn Maxwell",	"AR", "R", "R", DEFAULT, "OB"),
    ("Michael Neser", 	"AR", "R", "R", "MF", DEFAULT),
    ("Marcus Stoinis", 	"AR", "R", "R", "M", DEFAULT),
    ("Will Sutherland", "AR", "R", "R", "MF", DEFAULT),
    
    ("Alex Carey", 		"WK", "L", DEFAULT, DEFAULT, DEFAULT),
    ("Josh Inglis", 	"WK", "R", DEFAULT, DEFAULT, DEFAULT),
    ("Matthew Wade", 	"WK", "L", DEFAULT, DEFAULT, DEFAULT),

    ("Xavier Bartlett", 	"PB", "R", "R", "FM", DEFAULT),
    ("Jason Behrendorff", 	"PB", "R", "L", "FM", DEFAULT),
    ("Scott Boland", 		"PB", "R", "R", "FM", DEFAULT),
    ("Pat Cummins", 		"PB", "R", "R", "F", DEFAULT),
    ("Ben Dwarshuis", 		"PB", "L", "L", "FM", DEFAULT),
    ("Nathan Ellis", 		"PB", "R", "R", "FM", DEFAULT),
    ("Josh Hazlewood", 		"PB", "L", "R", "FM", DEFAULT),
    ("Spencer Johnson", 	"PB", "L", "L", "F", DEFAULT),
    ("Lance Morris", 		"PB", "R", "R", "F", DEFAULT),
    ("Jhye Richardson", 	"PB", "R", "R", "F", DEFAULT),
    ("Kane Richardson", 	"PB", "R", "R", "F", DEFAULT),
    ("Mitchell Starc", 		"PB", "L", "L", "F", DEFAULT),

    
    ("Ashton Agar", 	"SB", "L", "L", DEFAULT, "SLA"),
    ("Matt Kuhnemann", 	"SB", "L", "L", DEFAULT, "SLA"),
    ("Nathan Lyon", 	"SB", "R", "R", DEFAULT, "OB"),
    ("Todd Murphy", 	"SB", "L", "R", DEFAULT, "OB"),
    ("Tanveer Sangha", 	"SB", "R", "R", DEFAULT, "LB"),
    ("Adam Zampa", 		"SB", "R", "R", DEFAULT, "LB")
;

-- Insert players into teams
 INSERT INTO PlayerTeam(player_id, team_id)
 SELECT id,(SELECT MAX(id) FROM Team) 
 FROM Player ORDER BY id DESC LIMIT 43;


