/*Scott Heinrch
Database Management Lab 4 */

-- Question 1 --
SELECT city
FROM agents
WHERE aid in (SELECT aid
				FROM orders
				WHERE cid in (SELECT cid
								FROM customers
								WHERE cid = 'c006'
							 )
			);

-- Question 2 --
SELECT pid
FROM orders
WHERE aid in (SELECT aid
				FROM agents
				WHERE cid in (SELECT cid
								FROM customers
								WHERE city = 'Kyoto'

  							 )
			);

-- Question 3 --
SELECT cid, name
FROM customers
WHERE cid in (SELECT cid
				from orders
				WHERE aid in (SELECT aid
								FROM agents
								WHERE aid != 'a03'
							 )
			 );

-- Question 4 --
SELECT cid
FROM customers
WHERE cid in (SELECT
				FROM orders
				WHERE pid in (SELECT pid
								FROM products
								WHERE pid = 'p01'
								INTERSECT
								SELECT pid
								FROM products
								WHERE pid = 'p07'
							 )
			);

-- Question 5 --
SELECT pid
FROM products
WHERE pid in (SELECT pid
				FROM orders
				WHERE cid in (SELECT cid
								FROM orders
								WHERE aid in (SELECT aid
												FROM agents
												WHERE aid != 'a08'
									)
							 )
			)
PRDER BY pid DESC;

-- Question 6 --
SELECT name, city, discount
FROM customers
WHERE cid in (SELECT cid
				FROM orders
				WHERE aid in (SELECT aid
								FROM agents
								WHERE city = 'Dallas'
								OR city = 'New York'
								)
			);

-- Question 7 --
SELECT *
FROM customers
WHERE discount in (SELECT discount
					FROM customers
					WHERE city = 'Dallas'
					OR city = 'London'
					);


/* Question 8 

Check constraints can be really useful when creating a database because it allows 
you to set limits. A check restraint is used to limit value ranges that can be used.
 If placed in a column, only certain values can be used in the column. If used on the 
 able, only certain values can be used on the table. Etc. A simple use of check 
 constraint is a limit on age. Let's say you own a liquor store and want to give
  people rewards points for buying liquor and wine. When creating your database, 
  you could set a constraint on the age column in a customer table in your database.
   Obviously if you are selling alcohol you would want to ensure no one under the
    age of 21 is on there. */



