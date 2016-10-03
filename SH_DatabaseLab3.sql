/*Scott Heinrch
Database Management Lab 3 */

-- Question 1 --
SELECT ordnum, totalusd
FROM orders;

-- Question 2 --
SELECT name, city
FROM agents
WHERE name IN ('Smith')

-- Question 3 --
SELECT pid, name, priceusd
FROM products
WHERE quantity >201000;

-- Question 4 --
SELECT name, city
FROM customers
WHERE city = 'Duluth';

-- Question 5 --
SELECT name
FROM agents
WHERE city != 'Duluth'
AND city != 'New York';

-- Question 6 --
SELECT products
FROM products
WHERE city != 'Dallas'
AND city != 'Duluth'
AND priceusd > 1 ;

-- Question 7 --
SELECT orders
FROM orders
WHERE mon = 'feb'
OR mon = 'mar';

-- Question 8 --
SELECT orders
FROM orders
WHERE mon = 'feb'
AND totalusd >= 600;

-- Question 9 --
SELECT orders
FROM orders
WHERE cid = 'c005';

