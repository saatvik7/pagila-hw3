/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name ||' ' ||last_name as "Actor Name"
FROM (
	SELECT first_name, last_name, unnest(special_features) AS sf
	FROM actor
	INNER JOIN film_actor USING (actor_id)
	INNER JOIN film USING (film_id)
) AS t
WHERE sf = 'Behind the Scenes';

