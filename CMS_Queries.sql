 /* Queries */

-- TO INSERT NEW PLAYER 

 INSERT INTO players (player_id, player_name, age, playing_type, team_id)
VALUES (11, 'John Smith', 25, 'Bowler', 2);

-- TO UPDATE COACH NAME

UPDATE teams
SET coach_name = 'Rahul Dravid'
WHERE team_id = 1;

-- TO DELETE ALL RECORDS FROM SCORE TABLE WHERE RUNS_SCORED IS LESS THAN 50
SET SQL_SAFE_UPDATES = 0;
DELETE FROM scores WHERE runs_scored < 50;


-- TO INSERT NEW MATCH RECORD

INSERT INTO matches (match_id, match_date, location, team1_id, team2_id, winner_team_id)
VALUES ('11', '2022-03-15', 'Mumbai Stadium', '1', '2', '2');

-- TO UPDATE WINNER_TEAM_ID

UPDATE matches
SET winner_team_id = 1
WHERE match_id = 1;

-- TO RETRIVE HIGHEST RUNS SCORED BY A PLAYER IN A MATCH

SELECT MAX(scores.runs_scored) AS highest_runs_scored
FROM scores
JOIN players ON scores.player_id = players.player_id
JOIN matches ON scores.match_id = matches.match_id
WHERE matches.match_id = '3';

-- TO RETRIVE TOTAL NUMBER OF MATCHES WON BY EACH TEAM

SELECT teams.team_name, COUNT(matches.winner_team_id) AS matches_won
FROM teams
LEFT JOIN matches ON teams.team_id = matches.winner_team_id
GROUP BY teams.team_id; 

-- TO RETRIVE THE AVERAGE AGE OF PLAYERS IN A TEAM 

SELECT AVG(age) FROM players WHERE team_id = 1;

-- TO RETRIVE HIGHEST WICKETS TAKEN BY A PLAYER IN A MATCH

SELECT MAX(wickets_taken)
FROM scores
WHERE match_id = '1';

-- TO RETRIVE THE TEAM WITH THE MOST NUMBER OF RUNS_SCORED ACROSS ALL MATCHES

SELECT teams.team_name, SUM(scores.runs_scored) AS total_runs
FROM teams
JOIN matches ON matches.team1_id = teams.team_id OR matches.team2_id = teams.team_id
JOIN scores ON (scores.match_id = matches.match_id)
GROUP BY teams.team_id
ORDER BY total_runs DESC
LIMIT 1;

-- RETRIVE THE PLAYER NAME AND PLAYING TYPE FOR ALL PLAYERS IN A TEAM

SELECT player_name, playing_type
FROM players
WHERE team_id = '5';

-- TO RETRIVE TEAM NAME AND COACH NAME FOR ALL MATCHES WON BY A SPECIFIC TEAM

SELECT t.team_name, t.coach_name 
FROM teams t 
JOIN matches m ON t.team_id = m.winner_team_id 
WHERE m.winner_team_id = 1;

-- TO RETRIVE MATCH DATE, LOCATION AND PLAYER NAME FOR ALL MATCHES PLAYED BY A SPECIFIC PLAYER

SELECT m.match_date, m.location, p.player_name 
FROM matches m 
JOIN scores s ON m.match_id = s.match_id 
JOIN players p ON s.player_id = p.player_id 
WHERE p.player_name = 'Virat Kohli';

-- TO RETRIVE TEAM NAME, MATCH DATE AND RUNS SCORED FOR ALL MATCHES WHERE A SPECIFIC PLAYER SCORES MORE THAN 50 RUNS
 
SELECT t.team_name, m.match_date, s.runs_scored
FROM teams t
JOIN matches m ON m.team1_id = t.team_id OR m.team2_id = t.team_id
JOIN scores s ON m.match_id = s.match_id
WHERE s.player_id = '1' AND s.runs_scored > 50;

-- TO RETRIVE PLAYER NAME, MATCH DATE AND WICKETS TAKEN FOR ALL MATCHES WHERE A SPECIFIC PLAYER TOOK MORE THAN 1 WICKET

SELECT players.player_name, matches.match_date, scores.runs_scored
FROM players
INNER JOIN scores ON players.player_id = scores.player_id
INNER JOIN matches ON scores.match_id = matches.match_id
WHERE players.player_name = 'Rohit Sharma' AND scores.wickets_taken > 1;
