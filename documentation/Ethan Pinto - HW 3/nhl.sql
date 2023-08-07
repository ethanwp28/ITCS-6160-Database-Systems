DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Injury_Record;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Player;

CREATE TABLE Player (
  player_id INT PRIMARY KEY AUTO_INCREMENT,
  player_name VARCHAR(255) NOT NULL,
  skill_level INT NOT NULL,
  position VARCHAR(255) NOT NULL,
  UNIQUE INDEX idx_player_name (player_name)
);

CREATE TABLE Team (
  team_id INT PRIMARY KEY AUTO_INCREMENT,
  team_name VARCHAR(255) NOT NULL,
  coach VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  captain VARCHAR(255),
  FOREIGN KEY (captain) REFERENCES Player(player_name)
);

CREATE TABLE Injury_Record (
  record_id INT PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(255) NOT NULL
);

CREATE TABLE Game (
  game_id INT PRIMARY KEY AUTO_INCREMENT,
  host_team INT NOT NULL,
  guest_team INT NOT NULL,
  date DATE NOT NULL,
  score VARCHAR(10) NOT NULL,
  FOREIGN KEY (host_team) REFERENCES Team(team_id),
  FOREIGN KEY (guest_team) REFERENCES Team(team_id)
);

INSERT INTO Player (player_name, skill_level, position)
VALUES
  ('Chris Kreider', 0, 'Position details'),
  ('Tony DeAngelo', 0, 'Position details'),
  ('Oliver Ekman-Larsson', 0, 'Position details'),
  ('Lawson Crouse', 0, 'Position details');
  
INSERT INTO Team (team_name, coach, city, captain)
VALUES
  ('New York Rangers', 'David Quinn', 'New York', 'Chris Kreider'),
  ('Arizona Coyotes', 'Rick Tocchet', 'Arizona', 'Oliver Ekman-Larsson');

INSERT INTO Injury_Record (description)
VALUES ('Pulled hamstring on 10/22/2020. Cannot play for two weeks.');

INSERT INTO Game (host_team, guest_team, date, score)
VALUES
  (1, 2, '2019-03-04', '4-2'),
  (2, 1, '2020-10-22', '3-4');

-- select * from team

SELECT
  p1.player_name AS Host,
  p2.player_name AS Guest,
  g.date AS Date,
  g.score AS Score
FROM
  Game g
  INNER JOIN Team tH ON g.host_team = tH.team_id
  INNER JOIN Team tG ON g.guest_team = tG.team_id
  INNER JOIN Player p1 ON tH.captain = p1.player_name
  INNER JOIN Player p2 ON tG.captain = p2.player_name
WHERE
  g.date = '2019-03-04';