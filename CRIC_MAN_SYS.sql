CREATE SCHEMA `cms` ;

USE `cms`;


-- Create players table
CREATE TABLE `players` (
  `player_id` int NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `playing_type` varchar(20) NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for players table
INSERT INTO `cms`.`players`
(`player_id`,
`player_name`,
`age`,
`playing_type`,
`team_id`)
VALUES
(1, 'Virat Kohli', 33, 'Batsman', 1),
(2, 'Rohit Sharma', 34, 'Batsman', 1),
(3, 'Jasprit Bumrah', 27, 'Bowler', 2),
(4, 'Hardik Pandya', 28, 'All-rounder', 2),
(5, 'Kane Williamson', 31, 'Batsman', 3),
(6, 'Trent Boult', 32, 'Bowler', 3),
(7, 'Eoin Morgan', 35, 'Batsman', 4),
(8, 'Jos Buttler', 31, 'Batsman', 4),
(9, 'Babar Azam', 26, 'Batsman', 5),
(10, 'Shaheen Afridi', 21, 'Bowler', 5);

  
  SELECT `players`.`player_id`,
    `players`.`player_name`,
    `players`.`age`,
    `players`.`playing_type`,
    `players`.`team_id`
FROM `cms`.`players`;


-- Create teams table
CREATE TABLE `teams` (
  `team_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `coach_name` varchar(50) NOT NULL,
  `home_ground` varchar(50) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for players table
INSERT INTO `cms`.`teams`
(`team_id`,
`team_name`,
`coach_name`,
`home_ground`)
VALUES
  (1, 'India', 'Ravi Shastri', 'WankhedeStadium'),
  (2, 'Australia', 'Justin Langer', 'Melourne Cricket Ground'),
  (3, 'Pakistan', 'Misbah-ul-Haq', 'Gaddafi Stadium'),
  (4, 'New Zealand', 'Gary Stead', 'Eden Park'),
  (5, 'England', 'Brendon McCullum ', 'Lords Stadium'),
  (6, 'South Africa', 'Shukri Conrad', 'Pollock Field'),
  (7, 'West Indies', 'Andre Coley', 'Kensinton Oval'),
  (8, 'Bangladesh', 'Chandika Hathurusingha', 'Ekana Stadium'),
  (9, 'Afghanistan', 'Jonathan Trott', 'Shere Bangla National Cricket Stadium'),
  (10, 'Sri Lanka', 'Chris Silverwood', 'Galle Stadium');

SELECT `teams`.`team_id`,
    `teams`.`team_name`,
    `teams`.`coach_name`,
    `teams`.`home_ground`
FROM `cms`.`teams`;


-- Create matches table
CREATE TABLE `matches` (
  `match_id` int NOT NULL,
  `match_date` date NOT NULL,
  `location` varchar(50) NOT NULL,
  `team1_id` int NOT NULL,
  `team2_id` int NOT NULL,
  `winner_team_id` int NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `team1_id` (`team1_id`),
  KEY `team2_id` (`team2_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`team1_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team2_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for matches table
INSERT INTO `cms`.`matches`
(`match_id`,
`match_date`,
`location`,
`team1_id`,
`team2_id`,
`winner_team_id`)
VALUES
  (1, '2022-04-02', 'Wankhede Stadium', 4, 1, 4),
  (2, '2022-05-15', 'Melbourne Cricket Ground', 8, 2, 2),
  (3, '2022-06-20', 'Melbourne Cricket Ground', 10, 2, 10),
  (4, '2022-07-22', 'Gaddafi Stadium', 1, 3, 3),
  (5, '2022-08-18', 'Eden Park', 7, 4, 7),
  (6, '2022-09-14', 'Lords Stadium', 10, 5, 5),
  (7, '2022-10-05', 'Kensinton Oval', 9, 7, 9),
  (8, '2022-10-27', 'Shere Bangla National Cricket Stadium', 6, 9, 6),
  (9, '2022-11-21', 'Pollock Field', 5, 6, 6),
  (10, '2022-12-17', 'Ekana Stadium', 3, 8, 8);

SELECT `matches`.`match_id`,
    `matches`.`match_date`,
    `matches`.`location`,
    `matches`.`team1_id`,
    `matches`.`team2_id`,
    `matches`.`winner_team_id`
FROM `cms`.`matches`;


-- Create scores table
CREATE TABLE `scores` (
  `score_id` int NOT NULL,
  `match_id` varchar(45) NOT NULL,
  `player_id` varchar(45) NOT NULL,
  `runs_scored` int DEFAULT NULL,
  `wickets_taken` int DEFAULT NULL,
  `overs_bowled` float DEFAULT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for scores table
INSERT INTO `cms`.`scores`
(`score_id`,
`match_id`,
`player_id`,
`runs_scored`,
`wickets_taken`,
`overs_bowled`)
VALUES
(1, 1, 1, 125, NULL, NULL),
(2, 1, 2, 56, 2, 8),
(3, 1, 3, 34, NULL, NULL),
(4, 2, 4, 78, NULL, NULL),
(5, 2, 5, 62, 1, 6),
(6, 2, 6, 14, NULL, NULL),
(7, 3, 7, 92, NULL, NULL),
(8, 3, 8, 4, 2, 10),
(9, 3, 9, 53, 1, 8),
(10, 4, 10, 85, NULL, NULL);
  
  SELECT `scores`.`score_id`,
    `scores`.`match_id`,
    `scores`.`player_id`,
    `scores`.`runs_scored`,
    `scores`.`wickets_taken`,
    `scores`.`overs_bowled`
FROM `cms`.`scores`;
 