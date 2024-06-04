-- #1

-- language_id was mandatory, so I filled with 1 :)
INSERT INTO film (title, rental_rate, rental_duration, language_id)
VALUES ('Pulp Fiction', 4.99, 14, 1);

-- #2
INSERT INTO actor (first_name, last_name)
VALUES
    ('John', 'Travolta'),
    ('Bruce', 'Willis'),
    ('Samuel L.', 'Jackson');

WITH film_cte AS (
    SELECT film_id FROM film WHERE title = 'Pulp Fiction'
),
actor_cte AS (
    SELECT actor_id FROM actor WHERE (first_name, last_name) IN (('John', 'Travolta'), ('Bruce', 'Willis'), ('Samuel L.', 'Jackson'))
)
INSERT INTO film_actor (film_id, actor_id)
SELECT film_cte.film_id, actor_cte.actor_id
FROM film_cte, actor_cte;

-- #3
INSERT INTO inventory (film_id, store_id)
SELECT film.film_id, 1
FROM film
WHERE film.title = 'Pulp Fiction';
