-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE timetable
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  schedule INTEGER REFERENCES timetable NOT NULL,
  airline INTEGER REFERENCES airlines NOT NULL,
  from_city INTEGER REFERENCES cities NOT NULL,
  to_city INTEGER REFERENCES cities NOT NULL,
  from_country INTEGER REFERENCES countries NOT NULL,
  to_country INTEGER REFERENCES countries NOT NULL
);


INSERT INTO airlines (name)
VALUES ('Air China'), ('American Airlines'), ('Avianca Brasil'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('United');

INSERT INTO countries (name)
VALUES ('Brazil'), ('Chile'), ('China'), ('France'), ('Japan'), ('Mexico'), ('Morocco'), ('United Kingdom'), ('UAE'), ('United States');

INSERT INTO cities (name)
VALUES ('Beijing'), ('Casablanca'), ('Cedar Rapids'), ('Charlotte'), ('Chicago'), ('Dubai'), ('Las Vegas'), ('Los Angeles'), ('London'), ('Mexico City'), ('New Orleans'), ('New York'), ('Paris'), ('Santiago'), ('Sao Paolo'), ('Seattle'), ('Tokyo'), ('Washington DC');

INSERT INTO timetable (departure, arrival)
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00'), 
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00');


INSERT INTO tickets
  (first_name, last_name, seat, schedule, airline, from_city, from_country, to_city, to_country)
VALUES
('Jennifer', 'Finch', '33B', 1, 7, 18, 10, 16, 10),

('Thadeus', 'Gathercoal', '8A', 2, 4, 17, 5, 9, 8),

('Sonja', 'Pauley', '12F', 3, 5, 8, 10, 7, 10),

('Jennifer', 'Finch', '20A', 4, 5, 16, 10, 10, 6),

('Waneta', 'Skeleton', '23D', 5, 6, 13, 4, 2, 7),

('Thadeus', 'Gathercoal', '18C', 6, 1, 6, 9, 1, 3),

('Berkie', 'Wycliff', '9E', 7, 7, 12, 10, 4, 10),

('Alvin', 'Leathes', '1A', 8, 2, 3, 10, 5, 10),

('Berkie', 'Wycliff', '32B', 9, 2, 4, 10, 11, 10),

('Cory', 'Squibbes', '10D', 10, 3, 15, 1, 14, 2);