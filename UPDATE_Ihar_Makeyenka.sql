-- #1
UPDATE film
SET rental_duration = 21, rental_rate = 9.99
WHERE title = 'Pulp Fiction'

-- #2
WITH eligible_customers AS (
    SELECT c.customer_id
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(p.customer_id) >= 10
       AND COUNT(r.customer_id) >= 10
    LIMIT 1
),
selected_address AS (
    SELECT address_id
    FROM address
    LIMIT 1
)
UPDATE customer
SET first_name = 'Ihar',
    last_name = 'Makeyenka',
    email = 'i.4llower@gmail.com',
    address_id = (SELECT address_id FROM selected_address)
WHERE customer_id IN (SELECT customer_id FROM eligible_customers);

-- #3
-- I will belive that record is unique ;)
UPDATE customer
SET create_date = CURRENT_DATE
WHERE first_name = 'Ihar'
  AND last_name = 'Makeyenka'
  AND email = 'i.4llower@gmail.com';