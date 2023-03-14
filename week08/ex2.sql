SELECT film.title, film.rating, category.name
FROM film
         JOIN film_category ON film.film_id = film_category.film_id
         JOIN category ON film_category.category_id = category.category_id
WHERE (film.rating = 'R' OR film.rating = 'PG-13')
  AND (category.name = 'Horror' OR category.name = 'Sci-Fi')
  AND film.film_id NOT IN (SELECT i.film_id
                           FROM inventory i
                                    JOIN rental r ON i.inventory_id = r.inventory_id);

SELECT c.city, s.store_id, s.address_id, sum(p.amount) as total_sales
FROM store s
         JOIN staff st ON s.store_id = st.store_id
         JOIN address a ON s.address_id = a.address_id
         JOIN city c ON a.city_id = c.city_id
         JOIN payment p ON st.staff_id = p.staff_id
GROUP BY c.city, s.store_id, s.address_id
ORDER BY total_sales DESC;

