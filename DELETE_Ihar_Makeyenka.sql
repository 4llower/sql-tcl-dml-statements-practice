-- #1

DELETE FROM rental
WHERE inventory_id IN (
    SELECT inventory_id
    FROM inventory
    WHERE film_id IN (SELECT film_id FROM film WHERE title = 'Pulp Fiction')
);

DELETE FROM inventory
WHERE film_id IN (SELECT film_id FROM film WHERE title = 'Pulp Fiction');

-- #2

WITH updated_customer AS (
    SELECT customer_id
    FROM customer
    WHERE first_name = 'Ihar'
      AND last_name = 'Makeyenka'
      AND email = 'i.4llower@gmail.com'
)
DELETE FROM payment
WHERE customer_id IN (SELECT customer_id FROM updated_customer);

WITH updated_customer AS (
    SELECT customer_id
    FROM customer
    WHERE first_name = 'Ihar'
      AND last_name = 'Makeyenka'
      AND email = 'i.4llower@gmail.com'
)
DELETE FROM rental
WHERE customer_id IN (SELECT customer_id FROM updated_customer);
