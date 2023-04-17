-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.category_id as cat, count(*) from film as f
join film_category as c
on f.film_id = c.film_id
group by cat
order by cat;
-- 2.Display the total amount rung up by each staff member in August of 2005.
select distinct(staff_id), sum(amount) as total_amount
from payment
where month(payment_date) = 8
group by staff_id;
-- 3.Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(film_id) AS num_films
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id, a.first_name, a.last_name
ORDER BY COUNT(film_id) DESC
LIMIT 1;
-- 4.Most active customer (the customer that has rented the most number of films)
select count(*) as number_of_rentals, customer_id from rental
group by customer_id
order by number_of_rentals desc
limit 1;
-- 5.Display the first and last names, as well as the address, of each staff member.
select distinct staff_id, first_name, last_name, address_id from staff
where staff_id is not null;
-- 6.List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(actor_id) AS num_actors
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
GROUP BY f.title
ORDER BY COUNT(actor_id) DESC;
-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name, c.last_name, sum(amount) as amt
from payment p
join customer c
on c.customer_id = p.customer_id
group by c.last_name, c.first_name
order by c.last_name;
-- 8.List number of films per category.
select c.name, count(film_id) as "count" 
from film_category f
left join category c
on f.category_id = c.category_id
group by c.name
order by count(film_id) desc;