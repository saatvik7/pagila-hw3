/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT title
FROM (
	SELECT title, unnest(special_features) AS "unnest"
	FROM film
	WHERE rating = 'G'
	GROUP BY (title, special_features)
) AS t
WHERE unnest = 'Trailers'
ORDER BY title DESC;


