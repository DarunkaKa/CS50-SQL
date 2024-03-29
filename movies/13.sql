SELECT DISTINCT(name) FROM people JOIN stars ON stars.person_id = people.id JOIN movies ON movies.id = stars.movie_id
WHERE NOT name = "Kevin Bacon" AND title IN
(SELECT title FROM movies JOIN stars ON stars.movie_id = movies.id JOIN people ON people.id = stars.person_id WHERE name = "Kevin Bacon" AND birth = 1958);