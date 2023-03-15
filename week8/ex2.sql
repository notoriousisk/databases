--1--
SELECT f.title, f.rating, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE (f.rating = 'R' OR f.rating = 'PG-13')
AND (c.name = 'Horror' OR c.name = 'Sci-Fi')
AND f.film_id NOT IN (SELECT r.inventory_id FROM rental r)
ORDER BY f.title;

--2--
SELECT c.city, s.store_id, SUM(p.amount) AS total_sales
FROM city c
JOIN address a ON c.city_id = a.city_id
JOIN store s ON a.address_id = s.address_id
JOIN staff st ON s.manager_staff_id = st.staff_id
JOIN payment p ON p.staff_id = st.staff_id

GROUP BY c.city, s.store_id, s.manager_staff_id
HAVING SUM(p.amount) = (
    SELECT MAX(total_sales)
    FROM (
        SELECT c.city, s.store_id, s.manager_staff_id, SUM(p.amount) AS total_sales
        FROM city c
        JOIN address a ON c.city_id = a.city_id
        JOIN store s ON a.address_id = s.address_id
        JOIN staff st ON s.manager_staff_id = st.staff_id
        JOIN payment p ON p.staff_id = st.staff_id
        WHERE p.payment_date >= (CURRENT_DATE - INTERVAL '1 month')
        GROUP BY c.city, s.store_id, s.manager_staff_id
    ) AS sales_by_store_and_city
    WHERE sales_by_store_and_city.city = c.city
)
ORDER BY c.city;
