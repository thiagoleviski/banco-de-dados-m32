-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca

-- Exercício 1
DROP VIEW movies_categories;
CREATE VIEW movies_categories AS
SELECT movie.title, category.name  FROM film as movie
INNER JOIN film_category as qtd ON movie.film_id = qtd.film_id
INNER JOIN category as category ON category.category_id = qtd.category_id;

SELECT * FROM movies_categories;

-- Exercício 2
DROP VIEW actors_by_movies;
CREATE VIEW actors_by_movies AS
SELECT CONCAT(actor.first_name,' ', actor.last_name)as actor_name, count(qtd.film_id) as movies_quantity FROM actor as actor
LEFT JOIN film_actor as qtd ON actor.actor_id = qtd.actor_id
GROUP BY actor.actor_id
ORDER BY movies_quantity DESC;
SELECT * FROM actors_by_movies;

-- Exercício 3
DROP VIEW actors_by_movies_bigger_than_120_minutes;
CREATE VIEW actors_by_movies_bigger_than_120_minutes AS
SELECT CONCAT(actor.first_name,' ', actor.last_name)as actor_name, count(qtd.film_id) as movies_quantity FROM actor as actor
LEFT JOIN film_actor as fa ON actor.actor_id = fa.actor_id
LEFT JOIN film as qtd ON fa.film_id = qtd.film_id
WHERE qtd.length > 120
GROUP BY actor.actor_id
ORDER BY movies_quantity DESC;
SELECT * FROM actors_by_movies_bigger_than_120_minutes;