/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT DISTINCT title
FROM (
	SELECT DISTINCT title
	FROM (
		SELECT title, unnest(special_features) AS sf
		FROM film
		GROUP BY (title, special_features)
	) AS a
	WHERE sf IN ('Behind the Scenes')
) AS b
INNER JOIN (
	SELECT DISTINCT title
	FROM (
		SELECT title, unnest(special_features) AS sf
		FROM film
		GROUP BY (title, special_features)
	) AS c
	WHERE sf IN ('Trailers')
) AS d USING (title)
ORDER BY title
;
