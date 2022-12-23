CREATE schema IF NOT EXISTS sport_data;

CREATE TABLE IF NOT EXISTS sport_data.sport (
	id SERIAL PRIMARY KEY,
	Name VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS sport_data.country (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS sport_data.league (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	country_id INT REFERENCES sport_data.country(id),
	sport_id INT REFERENCES sport_data.sport(id)
);

CREATE TABLE IF NOT EXISTS sport_data.city (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	country_id INT REFERENCES sport_data.country(id)
);

CREATE TABLE IF NOT EXISTS sport_data.season (
	id SERIAL PRIMARY KEY,
	name VARCHAR(7),
	league_id INT REFERENCES sport_data.league(id)
);

CREATE TABLE IF NOT EXISTS sport_data.team (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	city_id INT REFERENCES sport_data.city(id)
);


CREATE TABLE IF NOT EXISTS sport_data.football_game (
	id SERIAL PRIMARY KEY,
	game_date date,
	home_team_id INT,
	away_team_id INT,
	home_team_score INT,
	away_team_score INT,
	result CHAR(1),
	home_team_shots INT,
	away_team_shots INT,
	home_team_shots_on_goal INT,
	away_team_shots_on_goal INT,
	home_team_corners INT,
	away_team_corners INT,
	home_team_yellow_cards INT,
	away_team_yellow_cards INT,
	home_team_red_cards INT,
	away_team_red_cards INT,
	home_team_fouls INT,
	away_team_ouls INT,
	season_id INT REFERENCES sport_data.season(id)
);

CREATE TABLE IF NOT EXISTS sport_data.hockey_game (
	id SERIAL PRIMARY KEY,
	game_date date,
	home_team_id INT,
	away_team_id INT,
	home_team_goals INT,
	away_team_goals INT,
	result CHAR(1),
	home_team_shots INT,
	away_team_shots INT,
	home_team_shots_on_goal INT,
	away_team_shots_on_goal INT,
	home_team_pim NUMERIC(4,2),
	away_team_pim NUMERIC(4,2),
	season_id INT REFERENCES sport_data.season(id)
);

CREATE TABLE IF NOT EXISTS sport_data.basketball_game (
	id SERIAL PRIMARY KEY,
	game_date date,
	home_team_id INT,
	away_team_id INT,
	home_team_score INT,
	away_team_score INT,
	result CHAR(1),
	home_team_field_goals INT,
	away_team_field_goals INT,
	home_team_fg_made NUMERIC(5, 3),
	away_team_fg_made NUMERIC(5, 3),
	home_team_3_point_attempts INT,
	away_team_3_point_attempts INT,
	home_team_3_point_made NUMERIC(5, 3),
	away_team_3_point_made NUMERIC(5, 3),
	home_team_of_reb INT,
	away_team_of_reb INT,
	home_team_def_reb INT,
	away_team_def_reb INT,
	home_team_assists NUMERIC(2, 1),
	away_team_assists NUMERIC(2, 1),
	season_id INT REFERENCES sport_data.season(id)
);

CREATE TABLE IF NOT EXISTS sport_data.football_home_team_game (
	game_id INT REFERENCES sport_data.football_game(id),
	home_team_id INT REFERENCES sport_data.team(id),
	PRIMARY KEY (game_id, home_team_id)
);

CREATE TABLE IF NOT EXISTS sport_data.football_away_team_game (
	game_id INT REFERENCES sport_data.football_game(id),
	away_team_id INT REFERENCES sport_data.team(id),
	PRIMARY KEY (game_id, away_team_id)
);

CREATE TABLE IF NOT EXISTS sport_data.hockey_home_team_game (
	game_id INT REFERENCES sport_data.hockey_game(id),
	home_team_id INT REFERENCES sport_data.team(id),
	PRIMARY KEY (game_id, home_team_id)
);

CREATE TABLE IF NOT EXISTS sport_data.hockey_away_team_game (
	game_id INT REFERENCES sport_data.hockey_game(id),
	away_team_id INT REFERENCES sport_data.team(id),
	PRIMARY KEY (game_id, away_team_id)
);

CREATE TABLE IF NOT EXISTS sport_data.basketball_home_team_game (
	game_id INT REFERENCES sport_data.basketball_game(id),
	home_team_id INT REFERENCES sport_data.team(id),	
	PRIMARY KEY (game_id, home_team_id)
);

CREATE TABLE IF NOT EXISTS sport_data.basketball_away_team_game (
	game_id INT REFERENCES sport_data.basketball_game(id),
	away_team_id INT REFERENCES sport_data.team(id),	
	PRIMARY KEY (game_id, away_team_id)
);

INSERT INTO sport_data.sport(Name)
VALUES
('football'),
('hockey'),
('basketball');

INSERT INTO sport_data.country(Name)
VALUES
('England'),
('USA'),
('Russia');

INSERT INTO sport_data.league(Name, CountryId, SportId)
VALUES
('English Premier League', 1, 1);

INSERT INTO sport_data.city(Name, CountryId)
VALUES
('London', 1),
('Bournemouth', 1),
('Leeds', 1),
('Liverpool', 1),
('Newcastle', 1),
('Leicester', 1),
('Manchester', 1),
('Wolverhampton', 1),
('Brentford', 1),
('Brighton', 1),
('Birmingham', 1),
('Southampton', 1),
('Nottingham', 1);

INSERT INTO sport_data.season(Name, LeagueId)
VALUES
('2022/23', 1);

INSERT INTO sport_data.team(Name, CityId)
VALUES
('Crystal Palace', 1),
('AFC Bournemouth', 2),
('Leeds United', 3),
('Tottenham Hotspur', 1),
('Everton', 4),
('Newcastle United', 5),
('Fulham', 1),
('Leicester City', 6),
('Manchester United', 7),
('West Ham United', 1),
('Arsenal', 1),
('Wolverhampton Wanderers', 8),
('Brentford', 9),
('Manchester City', 7),
('Brighton & Hove Albion', 10),
('Aston Villa', 11),
('Southampton', 12),
('Chelsea', 1),
('Nottingham Forest', 13),
('Liverpool', 4);