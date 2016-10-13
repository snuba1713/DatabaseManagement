# Scott Heinrich
# Database Management Lab 6
# 10/12/16

-- Question 1
-- Display the name and city of customers who live in ANY city that makes the MOST 
-- different kind of products.( Return the name and city of customers from either)


select name, city
  from customers c
 where c.city in (select distinct o.city
		    from products o inner join (select city, count(city)
                                                  from products 
                                              group by city) p on o.city = p.city
                                                 where p.count = (select MAX(p.count) as maximum
                                                                    from (select city, count(city)
                                                                            from products 
                                                                        group by city) p));
-- There are currently no customers in Newark, even though it has one of the MOST
-- different kinds of priducts. However in the futre, this query should work

-- Question 2
-- Display the names of products whose priceUSD is strictly below the average priceUSD
-- in reverse-alphabetical order.


	SELECT p.name
	FROM products p
	WHERE priceUSD < (SELECT AVG(priceUSD) AS average
			FROM products)
	ORDER by name DESC;


-- Question 3
-- Display the customer name, pid ordered, and the total for all orders, sorted by
-- total from high to low
	SELECT customers.name, orders.pid, totalUSD
	FROM customers INNER JOIN orders ON customers.cid=orders.cid
	ORDER by totalUSD DESC;

-- Question 4
-- Display all customer names (in alphabetical order) and their total ordered, and 
-- nothing more. Use coalesce to avoid showing NULLs.

	SELECT customers.name, coalesce(sum(totalUSD), 0) as totalOrdered
	from customers LEFT OUTER JOIN orders on customers.cid=orders.cid
	GROUP BY customers.cid
	ORDER BY customers.name ASC;
	-- was interesting using coalesce, going to make sure to add coalesce to my study sheet 

-- Question 5
-- Display the names of all customers who bought products from agents based in New York 
-- along with the names of the products they ordered, and the names of the agents who
-- sold it to them.

	SELECT customers.name, products.name, agents.name
	FROM orders INNER JOIN customers ON customers.cid = orders.cid
		    	INNER JOIN products ON products.pid = orders.pid
	    		INNER JOIN agents ON agents.aid = orders.aid
	WHERE agents.city = 'New York';
	-- originally i started with a ton of inner joins connecting each table, to something else
	-- Forgot that you can inner join a bunch of tables to the same table.

-- Question 6
-- Write a query to check the accuracy of the dollars column in the Orders table. This 
-- means calculating Orders.totalUSD from data in other tables and comparing those values
-- to the values in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is 
-- incorrect, if any

CREATE VIEW calculatedTotalUSD AS
SELECT ((1.0 - (customers.discount / 100.0)) * (qty * priceUSD)) as totalUSD, ordnum
FROM orders INNER JOIN customers ON customers.cid = orders.cid
    	    INNER JOIN products ON products.pid = orders.pid

SELECT *
FROM orders INNER JOIN calculatedTotalUSD ON orders.ordnum = calculatedTotalUSD.ordnum
WHERE orders.totalUSD != calculatedTotalUSD.totalUSD
	-- this one threw me for a loop, but me and a friend worked on it together and 
	-- figured that a view would work for this situation, with a little finesse.


--Question 7
-- What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example 
-- queries in SQL to demonstrate. (Feel free to use the CAP databaase to make your points)

-- When it comes down to it, LEFT OUTER JOIN AND RIGHT OUTER JOIN are basically the same
-- The only difference is when joined, which table is considered the "tree" and which
-- is considered the branch. In a LEFT OUTER JOIN the LEFT table is the "tree", and 
-- In a RIGHT OUTER JOIN the right table is the "tree" respectively.
-- An easy example of this is below


-- as you can see, we are looking for the names of customers who have never placed an order
-- to do so we need to connect the orders table, and customers. At the end of the day
-- we are looking for customer names so the customer table should be the tree, hence
-- the right outer join

SELECT customers.name
FROM orders RIGHT OUTER JOIN customers ON customers.cid = orders.cid
WHERE orders.ordnum IS NULL;

-- If you were to take the same query, change the RIGHT OUTER JOIN TO LEFT, and change
-- the order of the tables from orders then customers, to customers then orders
-- you will get the same response.

SELECT customers.name
FROM customers LEFT OUTER JOIN orders ON customers.cid = orders.cid
WHERE orders.ordnum IS NULL;

































