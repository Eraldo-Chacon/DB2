create database cinema;
use cinema;

CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL
);

INSERT INTO directors(name, age) VALUES
('John Smith',20),
('Jane Doe',30),
('Xavier Wills',30),
('Bev Scott',15),
('Bree Jensen',90);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  director_id INTEGER REFERENCES directors 
);

INSERT INTO movies(name, director_id) VALUES
('Movie 1', 1),
('Movie 2', 1),
('Movie 3', 2),
('Movie 4', NULL),
('Movie 5', NULL);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies
);
INSERT INTO tickets(movie_id) VALUES (1), (1), (3);
CREATE VIEW `directors_movies` AS (
	select a.id as id_director, a.name as name_director,
		   b.id as id_movie, b.name as name_movie,
           b.director_id
	from directors as a
		LEFT JOIN movies as b on
		a.id = b.director_id
	union    
	select a.id as id_director, a.name as name_director,
		   b.id as id_movie, b.name as name_movie,
           b.director_id
	from directors as a
		RIGHT JOIN movies as b on
		a.id = b.director_id
)


-- junção natural
SELECT *
FROM movie as m, directors as d
WHERE d.id = m.director_id AND m.director_id = 1;
    
    
-- Liste todos os diretores e os filmes que eles dirigiram 
SELECT m.name AS movie_name, d.name AS director_name
FROM movies m
LEFT JOIN directors d ON m.director_id = d.id;

SELECT *
FROM directors

SELECT *
FROM movies

SELECT *
FROM tickets

-- Liste todos os filmes e seus diretores 
SELECT m.name AS movie_name, d.name AS director_name
FROM movies m
LEFT JOIN directors d ON m.director_id = d.id;
-- Liste todos os filmes e seus diretores (somente os que estão relacionados)
SELECT m.name AS movie_name, d.name AS director_name
FROM movies m
INNER JOIN directors d ON m.director_id = d.id;

SELECT *
FROM movies AS m
JOIN directors AS d ON d.id = m.director_id
WHERE m.director_id = 1;

-- Liste todos os filmes e seus tickets vendidos
SELECT *
FROM movies AS m
JOIN tickets AS t ON m.id = t.movie_id;

-- Liste todos os filmes, seus diretores e os tickets vendidos
-- usar JOIN mais de uma vez para solicitar mais de uma informação existente nas tabelas
SELECT *
FROM movies AS m
	JOIN directors AS d ON d.id = m.director_id 
	JOIN tickets AS t ON m.id = t.movie_id;
    
