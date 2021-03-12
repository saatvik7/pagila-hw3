/*
 * Count the number of movies that contain each type of special feature.
 */

SELECT special_features, COUNT(*)
FROM (
	SELECT unnest(special_features) AS special_features, title
	FROM film
) AS t
GROUP BY special_features
ORDER BY special_features;
