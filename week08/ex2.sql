explain SELECT film.title, film.rating, category.name
FROM film
         JOIN film_category ON film.film_id = film_category.film_id
         JOIN category ON film_category.category_id = category.category_id
WHERE (film.rating = 'R' OR film.rating = 'PG-13')
  AND (category.name = 'Horror' OR category.name = 'Sci-Fi')
  AND film.film_id NOT IN (SELECT inventory.film_id
                           FROM inventory
                                    JOIN rental ON inventory.inventory_id = rental.inventory_id);
-- The operation that consumes the most time is
--   ->  Seq Scan on film  (cost=520.78..592.28 rows=187 width=23)
--         Filter: ((NOT (hashed SubPlan 1)) AND ((rating = 'R'::mpaa_rating) OR (rating = 'PG-13'::mpaa_rating)))
-- We can devide information to different tables to improve performance


explain SELECT city.city, store.store_id, store.address_id, sum(payment.amount) as total_sales
FROM store
         JOIN staff ON store.store_id = staff.store_id
         JOIN address ON store.address_id = address.address_id
         JOIN city ON address.city_id = city.city_id
         JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY city.city, store.store_id, store.address_id
ORDER BY total_sales DESC;
-- The operation that consumes the most time is
--  ->  HashAggregate  (cost=583.30..598.27 rows=1198 width=47)
--         Group Key: city.city, store.store_id
-- We can use subqueue to perform this task and do not useGroup By
