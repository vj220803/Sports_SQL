# create database assg3;
use assg3;
CREATE TABLE Team (
  tid INT PRIMARY KEY,
  tname VARCHAR(50) NOT NULL
);

CREATE TABLE Coach (
  cno INT PRIMARY KEY,
  cname VARCHAR(50) NOT NULL,
  age INT NOT NULL CHECK (age BETWEEN 18 AND 35),
  experience INT NOT NULL
);

CREATE TABLE Team_Coach (
  tid INT,
  cno INT,
  PRIMARY KEY (tid, cno),
  FOREIGN KEY (tid) REFERENCES Team(tid),
  FOREIGN KEY (cno) REFERENCES Coach(cno)
);

CREATE TABLE Player (
  pno INT PRIMARY KEY,
  pname VARCHAR(50) NOT NULL,
  page INT NOT NULL CHECK (page BETWEEN 18 AND 35),
  specialization VARCHAR(50) NOT NULL
);

CREATE TABLE Team_Player (
  tid INT,
  pno INT,
  PRIMARY KEY (tid, pno),
  FOREIGN KEY (tid) REFERENCES Team(tid),
  FOREIGN KEY (pno) REFERENCES Player(pno)
);


CREATE TABLE Matches (
  matchid INT PRIMARY KEY,
  matchground VARCHAR(50) NOT NULL,
  matchdate DATE NOT NULL
);

CREATE TABLE Team_Match (
  tid INT,
  matchid INT,
  score INT,
  PRIMARY KEY (tid, matchid),
  FOREIGN KEY (tid) REFERENCES Team(tid),
  FOREIGN KEY (matchid) REFERENCES Matches(matchid)
);


INSERT INTO Team (tid, tname) VALUES
  (1, 'Team A'),
  (2, 'Team B'),
  (3, 'Team C'),
  (4, 'Team D'),
  (5, 'Team E'),
  (6, 'Team F'),
  (7, 'Team G'),
  (8, 'Team H'),
  (9, 'Team I'),
  (10, 'Team J');

INSERT INTO Coach (cno, cname, age, experience) VALUES
  (1, 'Coach A', 30, 5),
  (2, 'Coach B', 28, 3),
  (3, 'Coach C', 32, 7),
  (4, 'Coach D', 25, 2),
  (5, 'Coach E', 29, 4),
  (6, 'Coach F', 31, 6),
  (7, 'Coach G', 27, 1),
  (8, 'Coach H', 33, 8),
  (9, 'Coach I', 26, 3),
  (10, 'Coach J', 34, 9);

INSERT INTO Team_Coach (tid, cno) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO Player (pno, pname, page, specialization) VALUES
  (1, 'Player A', 22, 'Forward'),
  (2, 'Player B', 25, 'Defender'),
  (3, 'Player C', 20, 'Midfielder'),
  (4, 'Player D', 28, 'Goalkeeper'),
  (5, 'Player E', 24, 'Forward'),
  (6, 'Player F', 27, 'Defender'),
  (7, ' Player G', 21, 'Midfielder'),
  (8, 'Player H', 29, 'Goalkeeper'),
  (9, 'Player I', 23, 'Forward'),
  (10, 'Player J', 26, 'Defender');

INSERT INTO Team_Player (tid, pno) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (2, 6),
  (3, 7),
  (3, 8),
  (3, 9),
  (4, 10);

INSERT INTO Matches (matchid, matchground, matchdate) VALUES
  (1, 'GROUND A', '2022-01-01'),
  (2, 'Ground B', '2022-01-02'),
  (3, 'Ground C', '2022-01-03'),
  (4, 'Ground D', '2022-01-04'),
  (5, 'Ground E', '2022-01-05'),
  (6, 'Ground F', '2022-01-06'),
  (7, 'Ground G', '2022-01-07'),
  (8, 'Ground H', '2022-01-08'),
  (9, 'Ground I', '2022-01-09'),
  (10, 'Ground J', '2022-01-10');

INSERT INTO Team_Match (tid, matchid, score) VALUES
  (1, 1, 2),
  (1, 2, 1),
  (1, 3, 3),
  (2, 4, 4),
  (2, 5, 2),
  (2, 6, 1),
  (3, 7, 3),
  (3, 8, 2),
  (3, 9, 1),
  (4, 10, 4);
  select*from coach;
  
#Q1 Displays teams for whom coach is _____
select distinct tname from team 
join coach 
on tid = cno
where cname = 'coach A';

#Q2 details of player belonging to __ team 
select*from player
join team
on pno = tid
where tname = 'team a';

#Q3 highest score of the match
select max(score) from team_match;

#Q4 Display details of team and coach who have played matches on __ ground 

# Q4 Display details of team and coach who have played matches on 'GROUND A'
SELECT Team.tname AS team_name, Team.tid AS team_no 
FROM Team
JOIN Team_Match ON Team.tid = Team_Match.tid
JOIN Matches ON Team_Match.matchid = Matches.matchid
WHERE Matches.matchground = 'GROUND A'

UNION

SELECT Coach.cname AS coach_name, Coach.cno AS coach_no
FROM Coach
JOIN Team_Coach ON Coach.cno = Team_Coach.cno
JOIN Team_Match ON Team_Coach.tid = Team_Match.tid
JOIN Matches ON Team_Match.matchid = Matches.matchid
WHERE Matches.matchground = 'GROUND A';


#5 Find team wise scores of matches
SELECT Team.tid, Team.tname, Matches.matchid, Matches.matchground, Team_Match.score
FROM Team
JOIN Team_Match ON Team.tid = Team_Match.tid
JOIN Matches ON Team_Match.matchid = Matches.matchid;

#6 Find match details played maximum matches on the ground____
SELECT Matches.matchid, Matches.matchground, Matches.matchdate
FROM Matches
WHERE Matches.matchground = (
    SELECT Matches.matchground
    FROM Matches
    GROUP BY Matches.matchground
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

#7 Display player details based on specialization
SELECT pno, pname, page, specialization
FROM Player
WHERE specialization = 'Forward';  # you can replace forward 


#8 Find teams who have played on _ ground
SELECT DISTINCT Team.tid, Team.tname
FROM Team
JOIN Team_Match ON Team.tid = Team_Match.tid
JOIN Matches ON Team_Match.matchid = Matches.matchid
WHERE Matches.matchground = 'GROUND A';  #GROUND A can be changed 

#9 Display team and match details for __ coach
SELECT Team.tid, Team.tname, Matches.matchid, Matches.matchground, Matches.matchdate
FROM Team
JOIN Team_Coach ON Team.tid = Team_Coach.tid
JOIN Team_Match ON Team.tid = Team_Match.tid
JOIN Matches ON Team_Match.matchid = Matches.matchid
JOIN Coach ON Team_Coach.cno = Coach.cno
WHERE Coach.cname = 'Coach A';  

#10 Which player has played maximum matches
SELECT Player.pno, Player.pname, COUNT(Team_Match.matchid) AS match_count
FROM Player
JOIN Team_Player ON Player.pno = Team_Player.pno
JOIN Team_Match ON Team_Player.tid = Team_Match.tid
GROUP BY Player.pno, Player.pname
ORDER BY match_count DESC
LIMIT 1;

# 11. Select all teams with their coaches
SELECT t.tname, c.cname
FROM Team t
JOIN Team_Coach tc ON t.tid = tc.tid
JOIN Coach c ON tc.cno = c.cno;
# 12. Average age of players in each team
SELECT t.tname, AVG(p.page) AS avg_age
FROM Team t
JOIN Team_Player tp ON t.tid = tp.tid
JOIN Player p ON tp.pno = p.pno
GROUP BY t.tname;

# 13.Find the team that scored the highest total across all matches.
SELECT t.tname, SUM(tm.score) AS total_score
FROM Team t
JOIN Team_Match tm ON t.tid = tm.tid
GROUP BY t.tname
ORDER BY total_score DESC
LIMIT 1;

# 14. Team that never played a match
SELECT t.tname
FROM Team t
LEFT JOIN Team_Match tm ON t.tid = tm.tid
WHERE tm.matchid IS NULL;

# 15. List coaches who have more than 5 years of experience 
SELECT cname, age, experience
FROM Coach
WHERE experience > 5;

# 16. Find the number of matches played on each ground 
SELECT matchground, COUNT(*) AS match_count
FROM Matches
GROUP BY matchground
ORDER BY match_count DESC;

# 17. Display match details where Team A participated
SELECT m.matchid, m.matchground, m.matchdate, tm.score
FROM Matches m
JOIN Team_Match tm ON m.matchid = tm.matchid
JOIN Team t ON tm.tid = t.tid
WHERE t.tname = 'Team A';

# 18.List players who belong to multiple teams
SELECT p.pname, COUNT(tp.tid) AS teams_count
FROM Player p
JOIN Team_Player tp ON p.pno = tp.pno
GROUP BY p.pname
HAVING COUNT(tp.tid) > 1;


# 19.Get the most common player specialization
SELECT specialization, COUNT(*) AS count
FROM Player
GROUP BY specialization
ORDER BY count DESC
LIMIT 1;

# 20.For each team, show the match where they scored the highest.
SELECT t.tname, m.matchid, m.matchground, tm.score
FROM Team t
JOIN Team_Match tm ON t.tid = tm.tid
JOIN Matches m ON tm.matchid = m.matchid
WHERE (t.tid, tm.score) IN (
  SELECT tid, MAX(score)
  FROM Team_Match
  GROUP BY tid
);


