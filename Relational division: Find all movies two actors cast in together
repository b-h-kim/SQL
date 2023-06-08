WITH sidney_salma AS 
  (
  SELECT film_id FROM film_actor WHERE actor_id = (SELECT actor_id FROM actor WHERE first_name ILIKE 'Sidney')
  INTERSECT
  SELECT film_id FROM film_actor WHERE actor_id = (SELECT actor_id FROM actor WHERE first_name ILIKE 'Salma')
  )
  
SELECT  title
FROM    film
INNER   JOIN sidney_salma USING(film_id)

/*
 *	Codewars (https://www.codewars.com/kata/5817b124e7f4576fd00020a2/train/sql)
 *
 *	Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.
 *	
 *	film schema
 *	 Column     | Type                        | Modifiers
 *	------------+-----------------------------+----------
 *	title       | character varying(255)      | not null
 *	film_id     | smallint                    | not null
 *	film_actor schema
 *	 Column     | Type                        | Modifiers
 *	------------+-----------------------------+----------
 *	actor_id    | smallint                    | not null
 *	film_id     | smallint                    | not null
 *	last_update | timestamp without time zone | not null 
 *	actor schema
 *	 Column     | Type                        | Modifiers
 *	------------+-----------------------------+----------
 *	actor_id    | integer                     | not null 
 *	first_name  | character varying(45)       | not null
 *	last_name   | character varying(45)       | not null
 *	last_update | timestamp without time zone | not null 
 *	The desired output:
 *	
 *	title
 *	-------------
 *	Film Title 1
 *	Film Title 2
 *	...
 */




