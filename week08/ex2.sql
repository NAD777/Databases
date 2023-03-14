SELECT film.title, film.rating, category.name
FROM film
         JOIN film_category ON film.film_id = film_category.film_id
         JOIN category ON film_category.category_id = category.category_id
WHERE (film.rating = 'R' OR film.rating = 'PG-13')
  AND (category.name = 'Horror' OR category.name = 'Sci-Fi')
  AND film.film_id NOT IN (SELECT inventory.film_id
                           FROM inventory
                                    JOIN rental ON inventory.inventory_id = rental.inventory_id);


SELECT city.city, store.store_id, store.address_id, sum(payment.amount) as total_sales
FROM store
         JOIN staff ON store.store_id = staff.store_id
         JOIN address ON store.address_id = address.address_id
         JOIN city ON address.city_id = city.city_id
         JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY city.city, store.store_id, store.address_id
ORDER BY total_sales DESC;

