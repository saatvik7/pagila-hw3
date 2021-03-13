/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT first_name || ' ' || last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN(
	SELECT film_id
	FROM film_actor
	WHERE actor_id IN (
		SELECT DISTINCT actor_id from (
			SELECT actor_id
			FROM actor
			INNER JOIN film_actor USING (actor_id)
			INNER JOIN (
				SELECT film_id
				FROM film_actor
				WHERE actor_id = 112
			) AS c USING (film_id)
			WHERE actor_id != 112
	) AS e	)
) AS d USING (film_id)

WHERE actor_id NOT IN (
		SELECT DISTINCT actor_id from (
			SELECT actor_id
			FROM actor
			INNER JOIN film_actor USING (actor_id)
			INNER JOIN (
				SELECT film_id
				FROM film_actor
				WHERE actor_id = 112
			) AS c USING (film_id)
			WHERE actor_id != 112
	) AS f	) AND actor_id !=112
GROUP BY "Actor Name"
ORDER BY "Actor Name";
