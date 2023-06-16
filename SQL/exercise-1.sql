-- - Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes.

SELECT movie.title, category.name  FROM film as movie
INNER JOIN film_category as qtd ON movie.film_id = qtd.film_id
INNER JOIN category as category ON category.category_id = qtd.category_id;

-- - Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram.

SELECT CONCAT(actor.first_name,' ', actor.last_name)as actor_name, count(qtd.film_id) as movies_quantity FROM actor as actor
LEFT JOIN film_actor as qtd ON actor.actor_id = qtd.actor_id
GROUP BY actor.actor_id
ORDER BY movies_quantity DESC;

-- - Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). Ordene a lista pelo numero de filmes que cada ator participou.

SELECT CONCAT(actor.first_name,' ', actor.last_name)as actor_name, count(qtd.film_id) as movies_quantity FROM actor as actor
LEFT JOIN film_actor as fa ON actor.actor_id = fa.actor_id
LEFT JOIN film as qtd ON fa.film_id = qtd.film_id
WHERE qtd.length > 120
GROUP BY actor.actor_id
ORDER BY movies_quantity DESC;