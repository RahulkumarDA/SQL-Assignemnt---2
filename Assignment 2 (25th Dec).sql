/*
(1) Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
*/

Select category_id, count(*) from
film_category inner join film on
Film_category.film_id = film.film_id group by category_id;


/*
(2) Find the average rental rate of movies in each language.
*/
Select name, avg(rental_rate) from
Film inner join language on
Film.language_id=language.Language_id group by name;


/*
(3) Retrieve the customer names along with the total amount they've spent on rentals.
*/

Select first_name, sum(Amount) from 
Customer inner join payment on 
Customer.customer_id = payment.customer_id
inner join rental on
payment.customer_id = rental.customer_id group by First_name;

/*
(4) List the titles of movies rented by each customer in a particular city (e.g., 'London').
*/

Select City, Title from 
City inner join address on 
City.city_id = Address.city_id
inner join customer on 
Address.address_id = customer.address_id
inner join rental on 
Customer.customer_id = Rental.customer_id
inner join inventory on
Rental.inventory_id = inventory.inventory_id
inner join film on 
Inventory.film_id = Film.film_id;

/*
(5) Display the top 5 rented movies along with the number of times they've been rented.
*/

Select title, count(rental_id) from 
film inner join inventory on 
Film.film_id = Inventory.film_id
inner join rental on 
Inventory.Inventory_id = Rental.Inventory_id group by Title limit 5;

/*
(6) Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
*/

Select concat(first_name, " ", last_name) as full_name from 
Rental inner join inventory on 
Rental.inventory_id = inventory.inventory_id
inner join Customer on 
inventory.store_id = customer.store_id group by full_name;