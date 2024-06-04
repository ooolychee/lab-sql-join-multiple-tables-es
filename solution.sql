SELECT store.store_id, address.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

SELECT store.store_id, SUM(payment.amount) AS total_business
FROM store
JOIN staff ON store.manager_staff_id = staff.staff_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;


SELECT category.name, AVG(film.length) AS avg_runtime
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC;

SELECT category.name, SUM(payment.amount) AS total_revenue
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT film.title, inventory.store_id
FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Academy Dinosaur' AND inventory.store_id = 1;