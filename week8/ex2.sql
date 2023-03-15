SELECT f.title, f.rating, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE (f.rating = 'R' OR f.rating = 'PG-13')
AND (c.name = 'Horror' OR c.name = 'Sci-Fi')
AND f.film_id NOT IN (SELECT r.inventory_id FROM rental r)
ORDER BY f.title;

