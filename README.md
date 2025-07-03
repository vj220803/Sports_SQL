# 🏏 Sports SQL Project

This SQL project is designed to manage and analyze data related to sports teams, players, coaches, and matches. It simulates real-world sports tournament management using a **normalized relational database schema**.

---

## 🗃️ Database Schema Overview

The database consists of **7 tables**:

| Table Name     | Description |
|----------------|-------------|
| `team`         | Stores team details (`tid`, `tname`) |
| `coach`        | Stores coach details (`cno`, `cname`, `age`, `experience`) |
| `team_coach`   | Many-to-many relationship between teams and coaches |
| `player`       | Stores player details (`pno`, `pname`, `page`, `specialization`) |
| `team_player`  | Many-to-many relationship between teams and players |
| `matches`      | Stores match info (`matchid`, `matchground`, `matchdate`) |
| `team_match`   | Many-to-many relationship of teams in matches with their `score` |

---

## 🧠 ER Diagram

<img src="er of sports.PNG" alt="ER Diagram" width="600"/>

- ✔️ `team` to `coach` → Many-to-Many via `team_coach`
- ✔️ `team` to `player` → Many-to-Many via `team_player`
- ✔️ `team` to `matches` → Many-to-Many via `team_match`
- ✔️ `team_match` stores scores per team per match

---

## ✅ Sample Queries Implemented

### 🔹 Basic Queries:
1. Display teams coached by a specific coach.
2. Find players from a specific team.
3. Highest match score.
4. Teams and coaches who played on a specific ground.
5. Team-wise scores for each match.
6. Ground on which maximum matches were played.
7. Players filtered by specialization.
8. Teams who played on a given ground.
9. Match details for a specific coach.
10. Player who played the most matches.

### 🔹 Advanced Queries:
11. List all teams and their assigned coaches.
12. Average age of players in each team.
13. Team with the highest total score.
14. Teams that never played a match.
15. Coaches with more than 5 years of experience.
16. Number of matches played on each ground.
17. Match details where 'Team A' participated.
18. Players who belong to more than one team.
19. Most common player specialization.
20. Each team’s highest scoring match.

---

## 🚀 Features & Highlights

- Fully normalized schema
- Realistic entity relationships
- Foreign key constraints and data validation
- Covers aggregation, joins, subqueries, grouping, filtering
- Easily extendable for tournaments, leagues, player stats, etc.

---

## 🛠️ Future Improvements (Optional)

- Add match results (Win/Loss)
- Add match type (Friendly, Tournament)
- Player performance stats (goals, assists, etc.)
- Dashboard using Tableau or Power BI
- Add stored procedures or views

---

## 👩‍💻 Author

**Vijayan Naidu**  
M.Sc. Data Science Student  
Fergusson College, Pune  
