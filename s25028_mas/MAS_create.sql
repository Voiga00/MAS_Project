-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-06-14 15:50:34.978

-- tables
-- Table: Boots
CREATE TABLE Boots
(
    ID_Boots         int NOT NULL
        CONSTRAINT Boots_pk PRIMARY KEY,
    size             int NOT NULL,
    Player_ID_Player int NOT NULL,
    CONSTRAINT Boots_Player FOREIGN KEY (Player_ID_Player)
        REFERENCES Player (ID_Player)
);

-- Table: Coach
CREATE TABLE Coach
(
    ID_Coach         int  NOT NULL
        CONSTRAINT Coach_pk PRIMARY KEY,
    UEFA_Certificate text NOT NULL,
    Team_ID_team     int  NOT NULL,
    Person_ID_Person int  NOT NULL,
    CONSTRAINT Coach_Team FOREIGN KEY (Team_ID_team)
        REFERENCES Team (ID_team),
    CONSTRAINT Coach_Person FOREIGN KEY (Person_ID_Person)
        REFERENCES Person (ID_Person)
);

-- Table: Comment
CREATE TABLE Comment
(
    ID_Comment     int  NOT NULL
        CONSTRAINT Comment_pk PRIMARY KEY,
    Content        text NOT NULL,
    Likes          int  NOT NULL,
    Match_Match_ID int  NOT NULL,
    CONSTRAINT Comment_Match FOREIGN KEY (Match_Match_ID)
        REFERENCES "Match" (Match_ID)
);

-- Table: Defender
CREATE TABLE Defender
(
    ID_Defender                int NOT NULL
        CONSTRAINT Defender_pk PRIMARY KEY,
    Tackles                    int NOT NULL,
    FieldPlayer_ID_FieldPlayer int NOT NULL,
    CONSTRAINT Defender_FieldPlayer FOREIGN KEY (FieldPlayer_ID_FieldPlayer)
        REFERENCES FieldPlayer (ID_FieldPlayer)
);

-- Table: FieldPlayer
CREATE TABLE FieldPlayer
(
    ID_FieldPlayer   int NOT NULL
        CONSTRAINT FieldPlayer_pk PRIMARY KEY,
    Position         int NOT NULL,
    Player_ID_Player int NOT NULL,
    CONSTRAINT FieldPlayer_Player FOREIGN KEY (Player_ID_Player)
        REFERENCES Player (ID_Player)
);

-- Table: Goalkeeper
CREATE TABLE Goalkeeper
(
    ID_Goalkeeper    int NOT NULL
        CONSTRAINT Goalkeeper_pk PRIMARY KEY,
    gloves           int NOT NULL,
    saves            int NOT NULL,
    Player_ID_Player int NOT NULL,
    CONSTRAINT Goalkeeper_Player FOREIGN KEY (Player_ID_Player)
        REFERENCES Player (ID_Player)
);

-- Table: League
CREATE TABLE League
(
    ID_League int NOT NULL
        CONSTRAINT League_pk PRIMARY KEY,
    round     int NOT NULL
);

-- Table: Match
CREATE TABLE "Match"
(
    Match_ID                     int  NOT NULL
        CONSTRAINT Match_pk PRIMARY KEY,
    date                         date NOT NULL,
    score                        int  NOT NULL,
    League_ID_League             int  NOT NULL,
    Soccer_field_ID_Soccer_field int  NOT NULL,
    Referee_ID_Referee           int  NOT NULL,
    CONSTRAINT Match_League FOREIGN KEY (League_ID_League)
        REFERENCES League (ID_League),
    CONSTRAINT Match_Soccer_field FOREIGN KEY (Soccer_field_ID_Soccer_field)
        REFERENCES Soccer_field (ID_Soccer_field),
    CONSTRAINT Match_Referee FOREIGN KEY (Referee_ID_Referee)
        REFERENCES Referee (ID_Referee)
);

-- Table: Midfielder
CREATE TABLE Midfielder
(
    ID_Midfielder              int NOT NULL
        CONSTRAINT Midfielder_pk PRIMARY KEY,
    Pass_accuracy              int NOT NULL,
    FieldPlayer_ID_FieldPlayer int NOT NULL,
    CONSTRAINT Midfielder_FieldPlayer FOREIGN KEY (FieldPlayer_ID_FieldPlayer)
        REFERENCES FieldPlayer (ID_FieldPlayer)
);

-- Table: Person
CREATE TABLE Person
(
    ID_Person     int  NOT NULL
        CONSTRAINT Person_pk PRIMARY KEY,
    name          text NOT NULL,
    Surname       text NOT NULL,
    Date_of_birth date NOT NULL,
    age           int  NOT NULL
);

-- Table: Player
CREATE TABLE Player
(
    ID_Player        int  NOT NULL
        CONSTRAINT Player_pk PRIMARY KEY,
    Number           int  NOT NULL,
    Stronger_Foot    text NOT NULL,
    Goals            int  NOT NULL,
    Assists          int  NOT NULL,
    Red_C            int  NOT NULL,
    Yellow_Cards     int  NOT NULL,
    Minutes_played   int,
    Matches_played   int  NOT NULL,
    Team_ID_team     int  NOT NULL,
    Person_ID_Person int  NOT NULL,
    CONSTRAINT Player_Team FOREIGN KEY (Team_ID_team)
        REFERENCES Team (ID_team),
    CONSTRAINT Player_Person FOREIGN KEY (Person_ID_Person)
        REFERENCES Person (ID_Person)
);

-- Table: Referee
CREATE TABLE Referee
(
    ID_Referee       int  NOT NULL
        CONSTRAINT Referee_pk PRIMARY KEY,
    Ref_certificate  text NOT NULL,
    Person_ID_Person int  NOT NULL,
    CONSTRAINT Referee_Person FOREIGN KEY (Person_ID_Person)
        REFERENCES Person (ID_Person)
);

-- Table: Soccer_field
CREATE TABLE Soccer_field
(
    ID_Soccer_field int  NOT NULL
        CONSTRAINT Soccer_field_pk PRIMARY KEY,
    StandCapacity   int  NOT NULL,
    Address         text NOT NULL
);

-- Table: Striker
CREATE TABLE Striker
(
    ID_Striker                 int NOT NULL
        CONSTRAINT Striker_pk PRIMARY KEY,
    Taken_penalties            int NOT NULL,
    FieldPlayer_ID_FieldPlayer int NOT NULL,
    CONSTRAINT Striker_FieldPlayer FOREIGN KEY (FieldPlayer_ID_FieldPlayer)
        REFERENCES FieldPlayer (ID_FieldPlayer)
);

-- Table: Team
CREATE TABLE Team
(
    ID_team          int NOT NULL
        CONSTRAINT Team_pk PRIMARY KEY,
    points           int NOT NULL,
    League_ID_League int NOT NULL,
    CONSTRAINT Team_League FOREIGN KEY (League_ID_League)
        REFERENCES League (ID_League)
);

-- End of file.


-- Insert 20 persons into Person table
INSERT INTO Person (ID_Person, name, Surname, Date_of_birth, age)
VALUES (1, 'John', 'Doe', '1990-01-01', 34),
       (2, 'Jane', 'Smith', '1992-02-02', 32),
       (3, 'Jim', 'Beam', '1988-03-03', 36),
       (4, 'Jill', 'Valentine', '1995-04-04', 29),
       (5, 'Jake', 'Muller', '1993-05-05', 31),
       (6, 'Alice', 'Wong', '1991-06-06', 33),
       (7, 'Bob', 'Brown', '1989-07-07', 35),
       (8, 'Carol', 'Davis', '1994-08-08', 30),
       (9, 'David', 'Evans', '1990-09-09', 34),
       (10, 'Eve', 'Foster', '1992-10-10', 32),
       (11, 'Frank', 'Gibson', '1988-11-11', 36),
       (12, 'Grace', 'Hall', '1995-12-12', 29),
       (13, 'Hank', 'Iverson', '1993-01-13', 31),
       (14, 'Ivy', 'Johnson', '1991-02-14', 33),
       (15, 'Jack', 'King', '1989-03-15', 35),
       (16, 'Kara', 'Lewis', '1994-04-16', 30),
       (17, 'Leo', 'Morris', '1990-05-17', 34),
       (18, 'Mona', 'Nelson', '1992-06-18', 32),
       (19, 'Nina', 'Owens', '1988-07-19', 36),
       (20, 'Oscar', 'Parker', '1995-08-20', 29);

-- Insert 5 players into Player table
INSERT INTO Player (ID_Player, Number, Stronger_Foot, Goals, Assists, Red_C, Yellow_Cards, Minutes_played,
                    Matches_played, Team_ID_team, Person_ID_Person)
VALUES (1, 10, 'Right', 15, 5, 1, 3, 1200, 20, 1, 1),
       (2, 7, 'Left', 8, 10, 0, 2, 1150, 19, 1, 2),
       (3, 4, 'Right', 2, 3, 1, 4, 1100, 18, 2, 3),
       (4, 9, 'Right', 12, 7, 0, 1, 1300, 21, 2, 4),
       (5, 11, 'Left', 10, 9, 2, 3, 1250, 20, 3, 5);

-- Insert 3 field players into FieldPlayer table
INSERT INTO FieldPlayer (ID_FieldPlayer, Position, Player_ID_Player)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3);

-- Insert 1 midfielder into Midfielder table
INSERT INTO Midfielder (ID_Midfielder, Pass_accuracy, FieldPlayer_ID_FieldPlayer)
VALUES (1, 85, 1);

-- Insert 1 striker into Striker table
INSERT INTO Striker (ID_Striker, Taken_penalties, FieldPlayer_ID_FieldPlayer)
VALUES (1, 4, 2);

-- Insert 1 defender into Defender table
INSERT INTO Defender (ID_Defender, Tackles, FieldPlayer_ID_FieldPlayer)
VALUES (1, 30, 3);

-- Insert 1 coach into Coach table
INSERT INTO Coach (ID_Coach, UEFA_Certificate, Team_ID_team, Person_ID_Person)
VALUES (1, 'UEFA Pro', 1, 6);

-- Insert 1 referee into Referee table
INSERT INTO Referee (ID_Referee, Ref_certificate, Person_ID_Person)
VALUES (1, 'FIFA', 7);

-- Insert 1 goalkeeper into Goalkeeper table
INSERT INTO Goalkeeper (ID_Goalkeeper, gloves, saves, Player_ID_Player)
VALUES (1, 2, 50, 5);

-- Insert 2 leagues into League table
INSERT INTO League (ID_League, round)
VALUES (1, 1),
       (2, 1);

-- Insert 5 teams into Team table for League 1
INSERT INTO Team (ID_team, points, League_ID_League)
VALUES (1, 30, 1),
       (2, 28, 1),
       (3, 25, 1),
       (4, 20, 1),
       (5, 15, 1);

-- Insert 5 teams into Team table for League 2
INSERT INTO Team (ID_team, points, League_ID_League)
VALUES (6, 32, 2),
       (7, 29, 2),
       (8, 26, 2),
       (9, 22, 2),
       (10, 18, 2);


-- Insert boots for each player into Boots table
INSERT INTO Boots (ID_Boots, size, Player_ID_Player)
VALUES (1, 42, 1),
       (2, 44, 2),
       (3, 41, 3),
       (4, 43, 4),
       (5, 45, 5);


-- Insert 3 soccer fields into Soccer_field table
INSERT INTO Soccer_field (ID_Soccer_field, StandCapacity, Address)
VALUES (1, 50000, '123 Main St'),
       (2, 30000, '456 Oak St'),
       (3, 40000, '789 Pine St');

-- Insert 2 matches for each team into Match table
-- Matches for Team 1
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (1, '2024-06-01', 2, 1, 1, 1),
       (2, '2024-06-08', 1, 1, 2, 1);

-- Matches for Team 2
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (3, '2024-06-02', 3, 1, 1, 1),
       (4, '2024-06-09', 0, 1, 2, 1);

-- Matches for Team 3
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (5, '2024-06-03', 1, 1, 1, 1),
       (6, '2024-06-10', 4, 1, 2, 1);

-- Matches for Team 4
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (7, '2024-06-04', 2, 1, 1, 1),
       (8, '2024-06-11', 3, 1, 2, 1);

-- Matches for Team 5
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (9, '2024-06-05', 0, 1, 1, 1),
       (10, '2024-06-12', 1, 1, 2, 1);

-- Matches for Team 6
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (11, '2024-06-06', 3, 2, 3, 1),
       (12, '2024-06-13', 2, 2, 1, 1);

-- Matches for Team 7
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (13, '2024-06-07', 1, 2, 3, 1),
       (14, '2024-06-14', 4, 2, 1, 1);

-- Matches for Team 8
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (15, '2024-06-08', 2, 2, 3, 1),
       (16, '2024-06-15', 3, 2, 1, 1);

-- Matches for Team 9
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (17, '2024-06-09', 1, 2, 3, 1),
       (18, '2024-06-16', 0, 2, 1, 1);

-- Matches for Team 10
INSERT INTO "Match" (Match_ID, date, score, League_ID_League, Soccer_field_ID_Soccer_field, Referee_ID_Referee)
VALUES (19, '2024-06-10', 4, 2, 3, 1),
       (20, '2024-06-17', 2, 2, 1, 1);
SELECT *
FROM Player
WHERE ID_Player = 1;


DELETE
FROM Boots;
DELETE
FROM Comment;
DELETE
FROM Defender;
DELETE
FROM Midfielder;
DELETE
FROM Striker;
DELETE
FROM Goalkeeper;
DELETE
FROM FieldPlayer;
DELETE
FROM Player;
DELETE
FROM Coach;
DELETE
FROM Referee;
DELETE
FROM "Match";
DELETE
FROM Team;
DELETE
FROM Soccer_field;
DELETE
FROM League;
DELETE
FROM Person;


INSERT INTO Person (ID_Person, name, Surname, Date_of_birth, age)
VALUES (1, 'Lewis', 'Landry', '2000-01-01', 24),
       (2, 'Cherish', 'Nash', '2000-01-02', 24),
       (3, 'Wendy', 'Tate', '2000-01-03', 24),
       (4, 'Santino', 'Mullins', '2000-01-04', 24),
       (5, 'Nathalie', 'Hanna', '2000-01-05', 24),
       (6, 'Riley', 'Davies', '2000-01-06', 24),
       (7, 'Carlie', 'Roy', '2000-01-07', 24),
       (8, 'Kamora', 'Saunders', '2000-01-08', 24),
       (9, 'Taliyah', 'Tate', '2000-01-09', 24),
       (10, 'Margaret', 'Hernandez', '2000-01-10', 24),
       (11, 'Zain', 'Hinton', '2000-01-11', 24),
       (12, 'Mohammed', 'Bright', '2000-01-12', 24),
       (13, 'Jaxson', 'Dickson', '2000-01-13', 24),
       (14, 'Wesley', 'Lucero', '2000-01-14', 24),
       (15, 'Rishi', 'Pacheco', '2000-01-15', 24),
       (16, 'Jason', 'Shepard', '2000-01-16', 24),
       (17, 'Bryson', 'Escobar', '2000-01-17', 24),
       (18, 'Ximena', 'Quinn', '2000-01-18', 24),
       (19, 'Anika', 'Livingston', '2000-01-19', 24),
       (20, 'Alia', 'Beard', '2000-01-20', 24),
       (21, 'Cale', 'Evans', '2000-01-21', 24),
       (22, 'Jabari', 'Bridges', '2000-01-22', 24),
       (23, 'Jayden', 'Shah', '2000-01-23', 24),
       (24, 'Jorden', 'Richards', '2000-01-24', 24),
       (25, 'Jordan', 'Horne', '2000-01-25', 24),
       (26, 'Ashlyn', 'Vasquez', '2000-01-26', 24),
       (27, 'Cassie', 'Nielsen', '2000-01-27', 24),
       (28, 'Ariel', 'Hinton', '2000-01-28', 24),
       (29, 'Ernest', 'Morrow', '2000-01-29', 24),
       (30, 'Jaslene', 'Walsh', '2000-01-30', 24),
       (31, 'Nicholas', 'Jennings', '2000-01-31', 24),
       (32, 'Rocco', 'York', '2000-02-01', 24),
       (33, 'Kyan', 'Malone', '2000-02-02', 24),
       (34, 'Roy', 'Kelly', '2000-02-03', 24),
       (35, 'Aryana', 'Williamson', '2000-02-04', 24),
       (36, 'Nikolai', 'Vaughan', '2000-02-05', 24),
       (37, 'Hector', 'Gardner', '2000-02-06', 24),
       (38, 'Milo', 'Haas', '2000-02-07', 24),
       (39, 'Rayna', 'Mayo', '2000-02-08', 24),
       (40, 'Arielle', 'Bird', '2000-02-09', 24),
       (41, 'Alia', 'Everett', '2000-02-10', 24),
       (42, 'Enrique', 'Figueroa', '2000-02-11', 24),
       (43, 'Jaden', 'Bean', '2000-02-12', 24),
       (44, 'Melanie', 'Bond', '2000-02-13', 24),
       (45, 'Averie', 'Bender', '2000-02-14', 24),
       (46, 'Landon', 'Santos', '2000-02-15', 24),
       (47, 'Trevor', 'Holloway', '2000-02-16', 24),
       (48, 'Trent', 'Lambert', '2000-02-17', 24),
       (49, 'Jaslyn', 'Forbes', '2000-02-18', 24),
       (50, 'Elliot', 'Atkinson', '2000-02-19', 24),
       (51, 'Aaron', 'Marsh', '2000-02-20', 24),
       (52, 'Tiffany', 'Manning', '2000-02-21', 24),
       (53, 'Marie', 'Jensen', '2000-02-22', 24),
       (54, 'Peyton', 'West', '2000-02-23', 24),
       (55, 'Adison', 'Baxter', '2000-02-24', 24),
       (56, 'Emilio', 'Boyd', '2000-02-25', 24),
       (57, 'Leticia', 'Sanford', '2000-02-26', 24),
       (58, 'Addison', 'Stuart', '2000-02-27', 24),
       (59, 'Zaria', 'Campbell', '2000-02-28', 24),
       (60, 'Greyson', 'Gutierrez', '2000-03-01', 24),
       (61, 'Konner', 'Wallace', '2000-03-02', 24),
       (62, 'Juliana', 'Barr', '2000-03-03', 24),
       (63, 'Jaylin', 'Foley', '2000-03-04', 24),
       (64, 'Ashlyn', 'Morris', '2000-03-05', 24),
       (65, 'Amare', 'Meadows', '2000-03-06', 24),
       (66, 'Adalynn', 'Pace', '2000-03-07', 24),
       (67, 'Ashly', 'Owens', '2000-03-08', 24),
       (68, 'Cael', 'Schroeder', '2000-03-09', 24),
       (69, 'Chaim', 'Bray', '2000-03-10', 24),
       (70, 'Cesar', 'Pennington', '2000-03-11', 24),
       (71, 'Marques', 'Carpenter', '2000-03-12', 24),
       (72, 'Keith', 'Prince', '2000-03-13', 24),
       (73, 'Aubrie', 'Prince', '2000-03-14', 24),
       (74, 'Braelyn', 'Mccormick', '2000-03-15', 24),
       (75, 'Manuel', 'Gilbert', '2000-03-16', 24),
       (76, 'Bethany', 'Gardner', '2000-03-17', 24),
       (77, 'Maddox', 'Alvarez', '2000-03-18', 24),
       (78, 'Skyla', 'Garner', '2000-03-19', 24),
       (79, 'Madalynn', 'Roy', '2000-03-20', 24),
       (80, 'Maeve', 'Guerra', '2000-03-21', 24),
       (81, 'Alexandra', 'Carr', '2000-03-22', 24),
       (82, 'Morgan', 'Palmer', '2000-03-23', 24),
       (83, 'Mattie', 'Ward', '2000-03-24', 24),
       (84, 'Alec', 'Hamilton', '2000-03-25', 24),
       (85, 'Kash', 'Hodges', '2000-03-26', 24),
       (86, 'Ayanna', 'Hinton', '2000-03-27', 24),
       (87, 'Jillian', 'Green', '2000-03-28', 24),
       (88, 'Mireya', 'Riggs', '2000-03-29', 24),
       (89, 'Jalen', 'Holland', '2000-03-30', 24),
       (90, 'Leonard', 'Archer', '2000-03-31', 24),
       (91, 'Devan', 'Fleming', '2000-04-01', 24),
       (92, 'Finley', 'Davenport', '2000-04-02', 24),
       (93, 'Matteo', 'Randolph', '2000-04-03', 24),
       (94, 'Silas', 'Wall', '2000-04-04', 24),
       (95, 'Anabel', 'Escobar', '2000-04-05', 24),
       (96, 'Mireya', 'Thomas', '2000-04-06', 24),
       (97, 'Maximo', 'Cisneros', '2000-04-07', 24),
       (98, 'Alonso', 'Stone', '2000-04-08', 24),
       (99, 'Gerardo', 'Duncan', '2000-04-09', 24),
       (100, 'Nico', 'Willis', '2000-04-10', 24);


INSERT INTO Referee (ID_Referee, Ref_certificate, Person_ID_Person)
VALUES (1, 'Certificate_Referee', 1);

INSERT INTO League (ID_League, round)
VALUES (1, 1),
       (2, 1);


INSERT INTO Team (ID_team, points, League_ID_League)
VALUES (1, 0, 1),
       (2, 0, 1),
       (3, 0, 1),
       (4, 0, 1),
       (5, 0, 1),
       (6, 0, 2),
       (7, 0, 2),
       (8, 0, 2),
       (9, 0, 2),
       (10, 0, 2);

INSERT INTO Goalkeeper (ID_Goalkeeper, gloves, saves, Player_ID_Player)
VALUES (1, 1, 0, 1),
       (2, 1, 0, 2),
       (3, 1, 0, 3),
       (4, 1, 0, 4),
       (5, 1, 0, 5);

-- Add field players as Midfielders, Strikers, and Defenders
INSERT INTO FieldPlayer (ID_FieldPlayer, Position, Player_ID_Player)
VALUES (6, 1, 6),   -- Midfielder
       (7, 2, 7),   -- Striker
       (8, 3, 8),   -- Defender
       (9, 1, 9),   -- Midfielder
       (10, 2, 10), -- Striker
       (11, 3, 11), -- Defender
       (12, 1, 12), -- Midfielder
       (13, 2, 13), -- Striker
       (14, 3, 14), -- Defender
       (15, 1, 15), -- Midfielder
       (16, 2, 16), -- Striker
       (17, 3, 17), -- Defender
       (18, 1, 18), -- Midfielder
       (19, 2, 19), -- Striker
       (20, 3, 20), -- Defender
       (21, 1, 21), -- Midfielder
       (22, 2, 22), -- Striker
       (23, 3, 23), -- Defender
       (24, 1, 24), -- Midfielder
       (25, 2, 25), -- Striker
       (26, 3, 26), -- Defender
       (27, 1, 27), -- Midfielder
       (28, 2, 28), -- Striker
       (29, 3, 29), -- Defender
       (30, 1, 30), -- Midfielder
       (31, 2, 31), -- Striker
       (32, 3, 32), -- Defender
       (33, 1, 33), -- Midfielder
       (34, 2, 34), -- Striker
       (35, 3, 35), -- Defender
       (36, 1, 36), -- Midfielder
       (37, 2, 37), -- Striker
       (38, 3, 38), -- Defender
       (39, 1, 39), -- Midfielder
       (40, 2, 40), -- Striker
       (41, 3, 41), -- Defender
       (42, 1, 42), -- Midfielder
       (43, 2, 43), -- Striker
       (44, 3, 44), -- Defender
       (45, 1, 45), -- Midfielder
       (46, 2, 46), -- Striker
       (47, 3, 47), -- Defender
       (48, 1, 48), -- Midfielder
       (49, 2, 49), -- Striker
       (50, 3, 50), -- Defender
       (51, 1, 51), -- Midfielder
       (52, 2, 52), -- Striker
       (53, 3, 53), -- Defender
       (54, 1, 54), -- Midfielder
       (55, 2, 55), -- Striker
       (56, 3, 56), -- Defender
       (57, 1, 57), -- Midfielder
       (58, 2, 58), -- Striker
       (59, 3, 59), -- Defender
       (60, 1, 60), -- Midfielder
       (61, 2, 61), -- Striker
       (62, 3, 62), -- Defender
       (63, 1, 63), -- Midfielder
       (64, 2, 64), -- Striker
       (65, 3, 65), -- Defender
       (66, 1, 66), -- Midfielder
       (67, 2, 67), -- Striker
       (68, 3, 68), -- Defender
       (69, 1, 69), -- Midfielder
       (70, 2, 70), -- Striker
       (71, 3, 71), -- Defender
       (72, 1, 72), -- Midfielder
       (73, 2, 73), -- Striker
       (74, 3, 74), -- Defender
       (75, 1, 75), -- Midfielder
       (76, 2, 76), -- Striker
       (77, 3, 77), -- Defender
       (78, 1, 78), -- Midfielder
       (79, 2, 79), -- Striker
       (80, 3, 80), -- Defender
       (81, 1, 81), -- Midfielder
       (82, 2, 82), -- Striker
       (83, 3, 83), -- Defender
       (84, 1, 84), -- Midfielder
       (85, 2, 85), -- Striker
       (86, 3, 86), -- Defender
       (87, 1, 87), -- Midfielder
       (88, 2, 88), -- Striker
       (89, 3, 89), -- Defender
       (90, 1, 90), -- Midfielder
       (91, 2, 91), -- Striker
       (92, 3, 92), -- Defender
       (93, 1, 93), -- Midfielder
       (94, 2, 94), -- Striker
       (95, 3, 95), -- Defender
       (96, 1, 96), -- Midfielder
       (97, 2, 97), -- Striker
       (98, 3, 98), -- Defender
       (99, 1, 99), -- Midfielder
       (100, 2, 100); -- Striker


INSERT INTO Player (ID_Player, Number, Stronger_Foot, Goals, Assists, Red_C, Yellow_Cards, Minutes_played,
                    Matches_played, Team_ID_team, Person_ID_Person)
VALUES (1, 1, 'Right', 0, 0, 0, 0, 0, 0, 1, 2),     -- Goalkeeper
       (2, 2, 'Right', 0, 0, 0, 0, 0, 0, 2, 3),     -- Goalkeeper
       (3, 3, 'Right', 0, 0, 0, 0, 0, 0, 3, 4),     -- Goalkeeper
       (4, 4, 'Right', 0, 0, 0, 0, 0, 0, 4, 5),     -- Goalkeeper
       (5, 5, 'Right', 0, 0, 0, 0, 0, 0, 5, 6),     -- Goalkeeper
       (6, 6, 'Right', 0, 0, 0, 0, 0, 0, 6, 7),     -- Field Player
       (7, 7, 'Right', 0, 0, 0, 0, 0, 0, 7, 8),     -- Field Player
       (8, 8, 'Right', 0, 0, 0, 0, 0, 0, 8, 9),     -- Field Player
       (9, 9, 'Right', 0, 0, 0, 0, 0, 0, 9, 10),    -- Field Player
       (10, 10, 'Right', 0, 0, 0, 0, 0, 0, 10, 11), -- Field Player
       (11, 11, 'Right', 0, 0, 0, 0, 0, 0, 1, 12),  -- Field Player
       (12, 12, 'Right', 0, 0, 0, 0, 0, 0, 2, 13),  -- Field Player
       (13, 13, 'Right', 0, 0, 0, 0, 0, 0, 3, 14),  -- Field Player
       (14, 14, 'Right', 0, 0, 0, 0, 0, 0, 4, 15),  -- Field Player
       (15, 15, 'Right', 0, 0, 0, 0, 0, 0, 5, 16),  -- Field Player
       (16, 16, 'Right', 0, 0, 0, 0, 0, 0, 6, 17),  -- Field Player
       (17, 17, 'Right', 0, 0, 0, 0, 0, 0, 7, 18),  -- Field Player
       (18, 18, 'Right', 0, 0, 0, 0, 0, 0, 8, 19),  -- Field Player
       (19, 19, 'Right', 0, 0, 0, 0, 0, 0, 9, 20),  -- Field Player
       (20, 20, 'Right', 0, 0, 0, 0, 0, 0, 10, 21), -- Field Player
       (21, 21, 'Right', 0, 0, 0, 0, 0, 0, 1, 22),  -- Field Player
       (22, 22, 'Right', 0, 0, 0, 0, 0, 0, 2, 23),  -- Field Player
       (23, 23, 'Right', 0, 0, 0, 0, 0, 0, 3, 24),  -- Field Player
       (24, 24, 'Right', 0, 0, 0, 0, 0, 0, 4, 25),  -- Field Player
       (25, 25, 'Right', 0, 0, 0, 0, 0, 0, 5, 26),  -- Field Player
       (26, 26, 'Right', 0, 0, 0, 0, 0, 0, 6, 27),  -- Field Player
       (27, 27, 'Right', 0, 0, 0, 0, 0, 0, 7, 28),  -- Field Player
       (28, 28, 'Right', 0, 0, 0, 0, 0, 0, 8, 29),  -- Field Player
       (29, 29, 'Right', 0, 0, 0, 0, 0, 0, 9, 30),  -- Field Player
       (30, 30, 'Right', 0, 0, 0, 0, 0, 0, 10, 31), -- Field Player
       (31, 31, 'Right', 0, 0, 0, 0, 0, 0, 1, 32),  -- Field Player
       (32, 32, 'Right', 0, 0, 0, 0, 0, 0, 2, 33),  -- Field Player
       (33, 33, 'Right', 0, 0, 0, 0, 0, 0, 3, 34),  -- Field Player
       (34, 34, 'Right', 0, 0, 0, 0, 0, 0, 4, 35),  -- Field Player
       (35, 35, 'Right', 0, 0, 0, 0, 0, 0, 5, 36),  -- Field Player
       (36, 36, 'Right', 0, 0, 0, 0, 0, 0, 6, 37),  -- Field Player
       (37, 37, 'Right', 0, 0, 0, 0, 0, 0, 7, 38),  -- Field Player
       (38, 38, 'Right', 0, 0, 0, 0, 0, 0, 8, 39),  -- Field Player
       (39, 39, 'Right', 0, 0, 0, 0, 0, 0, 9, 40),  -- Field Player
       (40, 40, 'Right', 0, 0, 0, 0, 0, 0, 10, 41), -- Field Player
       (41, 41, 'Right', 0, 0, 0, 0, 0, 0, 1, 42),  -- Field Player
       (42, 42, 'Right', 0, 0, 0, 0, 0, 0, 2, 43),  -- Field Player
       (43, 43, 'Right', 0, 0, 0, 0, 0, 0, 3, 44),  -- Field Player
       (44, 44, 'Right', 0, 0, 0, 0, 0, 0, 4, 45),  -- Field Player
       (45, 45, 'Right', 0, 0, 0, 0, 0, 0, 5, 46),  -- Field Player
       (46, 46, 'Right', 0, 0, 0, 0, 0, 0, 6, 47),  -- Field Player
       (47, 47, 'Right', 0, 0, 0, 0, 0, 0, 7, 48),  -- Field Player
       (48, 48, 'Right', 0, 0, 0, 0, 0, 0, 8, 49),  -- Field Player
       (49, 49, 'Right', 0, 0, 0, 0, 0, 0, 9, 50),  -- Field Player
       (50, 50, 'Right', 0, 0, 0, 0, 0, 0, 10, 51), -- Field Player
       (51, 51, 'Right', 0, 0, 0, 0, 0, 0, 1, 52),  -- Field Player
       (52, 52, 'Right', 0, 0, 0, 0, 0, 0, 2, 53),  -- Field Player
       (53, 53, 'Right', 0, 0, 0, 0, 0, 0, 3, 54),  -- Field Player
       (54, 54, 'Right', 0, 0, 0, 0, 0, 0, 4, 55),  -- Field Player
       (55, 55, 'Right', 0, 0, 0, 0, 0, 0, 5, 56),  -- Field Player
       (56, 56, 'Right', 0, 0, 0, 0, 0, 0, 6, 57),  -- Field Player
       (57, 57, 'Right', 0, 0, 0, 0, 0, 0, 7, 58),  -- Field Player
       (58, 58, 'Right', 0, 0, 0, 0, 0, 0, 8, 59),  -- Field Player
       (59, 59, 'Right', 0, 0, 0, 0, 0, 0, 9, 60),  -- Field Player
       (60, 60, 'Right', 0, 0, 0, 0, 0, 0, 10, 61), -- Field Player
       (61, 61, 'Right', 0, 0, 0, 0, 0, 0, 1, 62),  -- Field Player
       (62, 62, 'Right', 0, 0, 0, 0, 0, 0, 2, 63),  -- Field Player
       (63, 63, 'Right', 0, 0, 0, 0, 0, 0, 3, 64),  -- Field Player
       (64, 64, 'Right', 0, 0, 0, 0, 0, 0, 4, 65),  -- Field Player
       (65, 65, 'Right', 0, 0, 0, 0, 0, 0, 5, 66),  -- Field Player
       (66, 66, 'Right', 0, 0, 0, 0, 0, 0, 6, 67),  -- Field Player
       (67, 67, 'Right', 0, 0, 0, 0, 0, 0, 7, 68),  -- Field Player
       (68, 68, 'Right', 0, 0, 0, 0, 0, 0, 8, 69),  -- Field Player
       (69, 69, 'Right', 0, 0, 0, 0, 0, 0, 9, 70),  -- Field Player
       (70, 70, 'Right', 0, 0, 0, 0, 0, 0, 10, 71), -- Field Player
       (71, 71, 'Right', 0, 0, 0, 0, 0, 0, 1, 72),  -- Field Player
       (72, 72, 'Right', 0, 0, 0, 0, 0, 0, 2, 73),  -- Field Player
       (73, 73, 'Right', 0, 0, 0, 0, 0, 0, 3, 74),  -- Field Player
       (74, 74, 'Right', 0, 0, 0, 0, 0, 0, 4, 75),  -- Field Player
       (75, 75, 'Right', 0, 0, 0, 0, 0, 0, 5, 76),  -- Field Player
       (76, 76, 'Right', 0, 0, 0, 0, 0, 0, 6, 77),  -- Field Player
       (77, 77, 'Right', 0, 0, 0, 0, 0, 0, 7, 78),  -- Field Player
       (78, 78, 'Right', 0, 0, 0, 0, 0, 0, 8, 79),  -- Field Player
       (79, 79, 'Right', 0, 0, 0, 0, 0, 0, 9, 80),  -- Field Player
       (80, 80, 'Right', 0, 0, 0, 0, 0, 0, 10, 81), -- Field Player
       (81, 81, 'Right', 0, 0, 0, 0, 0, 0, 1, 82),  -- Field Player
       (82, 82, 'Right', 0, 0, 0, 0, 0, 0, 2, 83),  -- Field Player
       (83, 83, 'Right', 0, 0, 0, 0, 0, 0, 3, 84),  -- Field Player
       (84, 84, 'Right', 0, 0, 0, 0, 0, 0, 4, 85),  -- Field Player
       (85, 85, 'Right', 0, 0, 0, 0, 0, 0, 5, 86),  -- Field Player
       (86, 86, 'Right', 0, 0, 0, 0, 0, 0, 6, 87),  -- Field Player
       (87, 87, 'Right', 0, 0, 0, 0, 0, 0, 7, 88),  -- Field Player
       (88, 88, 'Right', 0, 0, 0, 0, 0, 0, 8, 89),  -- Field Player
       (89, 89, 'Right', 0, 0, 0, 0, 0, 0, 9, 90),  -- Field Player
       (90, 90, 'Right', 0, 0, 0, 0, 0, 0, 10, 91), -- Field Player
       (91, 91, 'Right', 0, 0, 0, 0, 0, 0, 1, 92),  -- Field Player
       (92, 92, 'Right', 0, 0, 0, 0, 0, 0, 2, 93),  -- Field Player
       (93, 93, 'Right', 0, 0, 0, 0, 0, 0, 3, 94),  -- Field Player
       (94, 94, 'Right', 0, 0, 0, 0, 0, 0, 4, 95),  -- Field Player
       (95, 95, 'Right', 0, 0, 0, 0, 0, 0, 5, 96),  -- Field Player
       (96, 96, 'Right', 0, 0, 0, 0, 0, 0, 6, 97),  -- Field Player
       (97, 97, 'Right', 0, 0, 0, 0, 0, 0, 7, 98),  -- Field Player
       (98, 98, 'Right', 0, 0, 0, 0, 0, 0, 8, 99),  -- Field Player


       (99, 99, 'Right', 0, 0, 0, 0, 0, 0, 9, 100); -- Field Player

INSERT INTO Defender (ID_Defender, Tackles, FieldPlayer_ID_FieldPlayer) VALUES
                                                                            (8, 0, 8),
                                                                            (11, 0, 11),
                                                                            (14, 0, 14),
                                                                            (17, 0, 17),
                                                                            (20, 0, 20),
                                                                            (23, 0, 23),
                                                                            (26, 0, 26),
                                                                            (29, 0, 29),
                                                                            (32, 0, 32),
                                                                            (35, 0, 35),
                                                                            (38, 0, 38),
                                                                            (41, 0, 41),
                                                                            (44, 0, 44),
                                                                            (47, 0, 47),
                                                                            (50, 0, 50),
                                                                            (53, 0, 53),
                                                                            (56, 0, 56),
                                                                            (59, 0, 59),
                                                                            (62, 0, 62),
                                                                            (65, 0, 65),
                                                                            (68, 0, 68),
                                                                            (71, 0, 71),
                                                                            (74, 0, 74),
                                                                            (77, 0, 77),
                                                                            (80, 0, 80),
                                                                            (83, 0, 83),
                                                                            (86, 0, 86),
                                                                            (89, 0, 89),
                                                                            (92, 0, 92),
                                                                            (95, 0, 95),
                                                                            (98, 0, 98);   


