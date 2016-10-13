#Scott Heinrich
#Database Managemnet Lab 5
# 10/5/16

-- Question 1 --
#Show	the	cities	of	agents	booking	an	order	for	a	customer	
#whose	id	is	'c006'.	Use	joins	this	time	no	subqueries.

SELECT agents.city
FROM agents
INNER JOIN orders
ON agents.aid = orders.aid;

-- Question 2 --
#Show	the	ids	of	products	ordered	through	any	agent	who	makes	
#at	least	one	order	for	a	customer	in	Kyoto,	sorted	by	
#pid	from	highest	to	lowest.	Use	joins;	no	subqueries.

SELECT x.pid
FROM customers INNER JOIN orders o ON o.cid = customers.cid AND customers.city = 'Kyoto'
		LEFT OUTER JOIN orders x ON x.aid=o.aid
ORDER BY x.pid DESC

-- Question 3 --
#Show	the	names	of	customers	who	have	never	placed	an	order.	
#Use	a	subquery

SELECT name
FROM customers
WHERE cid NOT IN (SELECT cid
					FROM orders)

-- Question 4 --
#Show	the	names	of	customers	who	have	never	placed	an	order.	
#Use	an	outer	join.	
SELECT customers.name
FROM orders RIGHT OUTER JOIN customers ON customers.cid = orders.cid
WHERE orders.ordnum IS NULL;

-- Question 5 --
#Show	the	names	of	customers	who	placed	at	least	one	order	through
#an	agent	in	their	own	city,	along	with	those	agent(s')	names.	

SELECT customers.name, agents.name
FROM orders INNER JOIN customers ON orders.cid = customers.cid
INNER JOIN agents ON orders.aid = agents.aid
WHERE customers.city = agents.city
ORDER by customers.name DESC;


-- Question 6 --
#Show	the	names	of	customers	and	agents	living	in	the	same	city,	
#along	with	the	name of	the	shared	city,	regardless	of	whether	or	not	
#the	customer	has	ever	placed	an	order	with	that	agent.	

SELECT customers.name, agents.name, agents.city
FROM agents INNER JOIN customers ON agents.city = customers.city
WHERE customers.city= agents.city
ORDER BY agents.city ASC;


-- Question 7 --
#Show	the	name	and	city	of	customers	who	live	in	the	city	
#that	makes	the	fewest different	kinds	of	products.

select name, c.city
  from customers c inner join (select city, count(city)
                                 from products 
                             group by city) p on c.city = p.city
                               
                                                       
                                                      

