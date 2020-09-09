
-- * Write a query to return the 10 earliest orders in the orders table. Include the id , occurred_at, and total_amt_usd .
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- SELECT "id", "occurred_at", "total_amt_usd"
-- FROM "orders"
-- ORDER BY "occurred_at"
-- LIMIT 15;


-- Write a query to return the top 5 orders in terms of largest total_amt_usd . Include the id , account_id , and total_amt_usd.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "id", "account_id", "total_amt_usd"
--FROM "orders"
--ORDER BY "total_amt_usd" DESC
--LIMIT 5;


--  Write a query to return the lowest 20 orders in terms of smallest total_amt_usd . Include the id, account_id, and total_amt_usd
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "id", "account_id", "total_amt_usd"
--FROM "orders"
--ORDER BY "total_amt_usd"
--LIMIT 20;


--  Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order). 
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "id", "account_id", "total_amt_usd"
--FROM "orders"
--ORDER BY "account_id", "total_amt_usd" DESC;



--   Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).  
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "id", "account_id", "total_amt_usd"
--FROM "orders"
--ORDER BY "total_amt_usd" DESC, "account_id";


-- Grouping by column total_amnt_usd 
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "total_amt_usd", COUNT(*) AS cnt
--FROM "orders"
--GROUP BY "total_amt_usd";



-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT *
--FROM "orders"
--WHERE "gloss_amt_usd" >= 1000
--LIMIT 5;



-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500. Order the result by total_amt_usd descending
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT *
--FROM "orders"
--WHERE "total_amt_usd" < 500
--ORDER BY "total_amt_usd" DESC
--LIMIT 10;


-- Filter the accounts table to include the company name , website , and the primary point of contact ( primary_poc ) just for the Exxon Mobil company in the accounts table. (NOTE: SQL requires single-quotes, not double-quotes, around text values like 'Exxon Mobil.'
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT "name", "website", "primary_poc"
--FROM "accounts"
--WHERE "name" = 'Exxon Mobil';



-- divide the standard paper dollar amount by the total order amount to find the standard paper percent for the order, and use the AS keyword to name this new column "std_percent." 
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT id, (standard_amt_usd/total_amt_usd) AS std_percent, total_amt_usd
--FROM orders
--LIMIT 10;


--  Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the rst 10 orders, and include the id and account_id elds.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT id, account_id, (standard_amt_usd/standard_qty) AS 				unit_price
--FROM orders
--LIMIT 10;


--  Write a query that nds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd . (Try to do this without using the total column.) Display the id and account_id elds also.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT id, account_id,
--	poster_amt_usd, total_amt_usd, (poster_amt_usd/(standard_amt_usd + 	gloss_amt_usd + poster_amt_usd)) AS percentage_poster_revenue
--FROM orders
--LIMIT 10;


-- Use the accounts table to find
-- 1. All the companies whose names start with 'C'.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT *
--FROM accounts
--WHERE name
--LIKE 'C%';


-- 2. All companies whose names contain the string 'one' somewhere in the name.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT *
--FROM accounts
--WHERE name
--LIKE '%one%';


--3. All companies whose names end with 's' ('%s' not working in postgres, but works in mySQLWorkBench and in w3c)
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT name
--FROM accounts
--WHERE "name" LIKE '%s';



-- 4. All the companies whose names do not start with 'C'.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT *
--FROM accounts
--WHERE name
--NOT LIKE 'C%';



-- Use the accounts table to find the account name , primary_poc , and sales_rep_id for Walmart, Target, and Nordstrom.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT name, primary_poc, sales_rep_id
--FROM accounts
--WHERE name IN ('Walmart', 'Target', 'Nordstrom')


--  Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT name, primary_poc, sales_rep_id
--FROM accounts
--WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')




--  Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM web_events
--WHERE channel IN ('organic', 'adwords')


--   Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM web_events
--WHERE channel NOT IN ('organic', 'adwords');


--   Write a query that returns all the orders where the standard_qty 	 is over 1000, the poster_qty is 0, and the gloss_qty is 0.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM orders
--WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;


--   Using the accounts table, find all the companies whose names do not start with 'C' but ends with 's'.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM accounts
--WHERE name NOT LIKE 'C%' AND name LIKE '%s';


--    When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not. (ANSWER: yes it does)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT occurred_at, gloss_qty
--FROM orders
--WHERE gloss_qty BETWEEN 24 AND 29;



--    Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.

-- NOTICE: using BETWEEN is tricky for dates! While BETWEEN is generally inclusive of endpoints, it assumes the time is at 00:00:00 (i.e. midnight) for dates. This is the reason why we set the right-side endpoint of the period at '2017-01-01' instead of '2016-12-31'
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM web_events
--WHERE channel IN ('organic', 'adword') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01';



--  Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT id
--FROM orders
--WHERE gloss_qty > 4000 OR poster_qty > 4000;


--  Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000..
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM orders
--WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);


--   Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT *
--FROM accounts
--WHERE (name LIKE 'C%' OR name LIKE 'W%')
--			AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
--			AND primary_poc NOT LIKE '%eana%');


-------------------------------------------------------------------------
-- JOINS --
-------------------------------------------------------------------------

--   select all from orders and accounts in one table
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT orders.*,
--	   accounts.*
--	FROM orders
--	JOIN accounts
--		ON orders.account_id = accounts.id;
		

--   select all from orders and accounts in one table (use alias)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.*,
--	   a.*
--	FROM orders o
--	JOIN accounts a
--		ON o.account_id = a.id;


--  using COMBINING JOIN, WHERE, ORDER BY
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.total, o.total_amt_usd,
--	   a.sales_rep_id, a.id
--	FROM accounts a
--	JOIN orders o
--		ON o.account_id = a.id
--	WHERE a.id IN ('1001', '1011', '1021', '1031', '1731')
--	ORDER BY a.id DESC
	
	
--  combining LEFT JOIN, WHERE, ORDER BY
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.total, o.total_amt_usd,
--	   a.sales_rep_id, a.id
--	FROM orders o
--	LEFT JOIN accounts a
--		ON o.account_id = a.id
--	WHERE a.id IN ('1001', '1011', '1021', '1031', '1731')
--	ORDER BY a.id DESC
--	

-- Instead of using RIGHT JOIN, we interchange the tables in the FROM and WHERE part of the LEFT JOIN query to achieve the same result. RIGHT JOIN is hardly used. It's the convention to use LEFT JOIN but interchange the tables to achieve the same effect as RIGHT JOIN.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.total, o.total_amt_usd,
--	   a.sales_rep_id, a.id
--	FROM accounts a
--	LEFT JOIN orders o
--		ON o.account_id = a.id
--	WHERE a.id IN ('1001', '1011', '1021', '1031', '1731')
--	ORDER BY a.id DESC


-- Demonstrating the use of AND vs WHERE in a JOIN query
-- PART 1: using WHERE
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT a.sales_rep_id,
--	   o.id AS order_id, o.*
--	FROM accounts a
--	LEFT JOIN orders o
--		ON o.account_id = a.id
--	WHERE a.sales_rep_id = '321500'
	
	
-- Demonstrating the use of AND vs WHERE in a JOIN query
-- PART 2: using AND - note the inclusion of the the rest of the sales_rep_id with the LEFT JOIN, unlike the LEFT JOIN with WHERE
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT a.sales_rep_id,
--	   o.id AS order_id, o.*
--	FROM accounts a
--	LEFT JOIN orders o
--		ON o.account_id = a.id
--		AND a.sales_rep_id = '321500'



-- . Provide a table for all web_events associated with account name of Walmart . There should be three columns. Be sure to include the primary_poc , time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT a.primary_poc, w.occurred_at, w.channel, a.name
--	FROM web_events w
--	JOIN accounts a
--		ON w.account_id = a.id
--		AND a.name = 'Walmart'



--  Provide a table that provides the region for each sales_rep along with their associated accounts. Your finnal table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name region, s.name rep, a.name account
--FROM sales_reps s
--JOIN region r
--	ON s.region_id = r.id
--JOIN accounts a
--	ON a.sales_rep_id = s.id
--ORDER BY a.name;
	
	
	
--  Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero. __^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

--SELECT r.name region, a.name account,
--	(o.total_amt_usd/(o.total+0.01)) unit_price
--FROM orders o
--JOIN accounts a
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON s.id = a.sales_rep_id
--JOIN region r
--	ON s.region_id = r.id;


--1. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your nal table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name __^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name AS region_name, s.name AS sales_person, a.name AS acct_name
--FROM sales_reps s
--JOIN region r
--	ON s.region_id = r.id
--JOIN accounts a
--	ON a.sales_rep_id = s.id
-- WHERE r.name = 'Midwest'
--ORDER BY a.name;


--2. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name. __^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name AS region_name, s.name AS sales_person, a.name AS acct_name
--FROM sales_reps s
--JOIN region r
--	ON s.region_id = r.id
--JOIN accounts a
--	ON a.sales_rep_id = s.id
--WHERE s.name LIKE 'S%' AND r.name = 'Midwest'
--ORDER BY a.name;


-- 3. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name AS region_name, s.name AS sales_person, a.name AS acct_name
--FROM sales_reps s
--JOIN region r
--	ON s.region_id = r.id
--JOIN accounts a
--	ON a.sales_rep_id = s.id
--WHERE s.name LIKE '% K%' AND r.name = 'Midwest'
--ORDER BY a.name;



-- 4. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 . Your final table should have 3 columns: region name, account name, and unit price.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name region, a.name as account, (total_amt_usd/(total+0.01)) AS unit_price
--FROM orders o
--JOIN accounts a
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON a.sales_rep_id = s.id
--JOIN region r
--	ON s.region_id = r.id
--WHERE o.standard_qty > 100;



--5. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50 . Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name region, a.name as account, (total_amt_usd/(total+0.01)) AS unit_price
--FROM orders o
--JOIN accounts a
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON a.sales_rep_id = s.id
--JOIN region r
--	ON s.region_id = r.id
--WHERE o.standard_qty > 100 AND o.poster_qty > 50
--ORDER BY unit_price;




--6. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50 . Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT r.name region, a.name as account, (total_amt_usd/(total+0.01)) AS unit_price
--FROM orders o
--JOIN accounts a
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON a.sales_rep_id = s.id
--JOIN region r
--	ON s.region_id = r.id
--WHERE o.standard_qty > 100 AND o.poster_qty > 50
--ORDER BY unit_price DESC;




--7.  What are the different channels used by account id 1001 ? Your final table should have only 2 columns: account name and the dierent channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT DISTINCT a.name, w.channel
--FROM web_events w
--JOIN accounts a
--ON w.account_id = a.id
--WHERE a.id = '1001';



--8. Find all the orders that occurred in 2015 . Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
--FROM orders o
--JOIN accounts a
--ON o.account_id = a.id
--WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01'
--ORDER BY o.occurred_at;



--WHERE <VALUE> IS NULL
-- E.g: Retrieve all accounts that has not made any orders. Include the account name and it's sales rep
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT a.name AS account_name, s.name AS sales_rep, o.id AS order_id, o.total, o.total_amt_usd
--FROM accounts a
--LEFT JOIN orders o
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON a.sales_rep_id = s.id
--WHERE o.id IS NULL;


--WHERE <VALUE> IS NOT NULL
-- E.g: Retrieve all accounts that has made any orders. Include the account name and it's sales rep
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT a.name AS account_name, s.name AS sales_rep, o.id AS order_id, o.total, o.total_amt_usd
--FROM accounts a
--LEFT JOIN orders o
--	ON o.account_id = a.id
--JOIN sales_reps s
--	ON a.sales_rep_id = s.id
--WHERE o.id IS NOT NULL;
--
	
	
--count the total number of orders made in December 2016
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT COUNT(*) AS order_count
--FROM orders
--WHERE occurred_at
--	BETWEEN '2016-12-01' AND '2017-01-01';
	
	
-- total up all sales of each paper type for comparison
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT SUM(standard_qty) AS standard,
--		SUM(gloss_qty) AS gloss,
--		SUM(poster_qty) AS poster
--FROM orders;



-- min and max
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT MIN(standard_qty) AS standard_min,
--		MIN(gloss_qty) AS gloass_min,
--		MIN(poster_qty) AS poster_min,
--		MAX(standard_qty) AS standard_max,
--		MAX(gloss_qty) AS gloss_max,
--		MAX(poster_qty) AS poster_max,
--		SUM(standard_qty) AS standard,
--		SUM(gloss_qty) AS gloss,
--		SUM(poster_qty) AS poster
--FROM orders;



-- AVG - note AVG does not treat NULL values as zero in the calculation. If you want to include null value in the count as denominator when calculatin average, you will have use total/count
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT AVG(standard_qty) AS standard_avg,
--		AVG(gloss_qty) AS gloass_avg,
--		AVG(poster_qty) AS poster_avg
--FROM orders;



-- GROUP BY
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		SUM(standard_qty) AS standard_sum,
--		SUM(gloss_qty) AS gloass_sum,
--		SUM(poster_qty) AS poster_sum
--FROM orders
--GROUP BY account_id
--ORDER BY account_id;




-- grouping by, count distinct
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 	account_id,
		count(DISTINCT channel) AS no_of_channels,
		count(id) AS events
FROM web_events
GROUP BY account_id
ORDER BY account_id;


-- grouping by multiple columns
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 	account_id,
		channel,
		count(id) AS events
FROM web_events
GROUP BY account_id, channel
ORDER BY account_id, events DESC;
	



-- with 'DISTINCT' we can use the 'GROUP BY' clause without necessarily including any aggregations
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	DISTINCT account_id,
--		channel
--FROM web_events
--ORDER BY account_id;



-- the sum of sales for each account, ordered in descending order
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		SUM(total_amt_usd) AS sum_total_amt_usd
--FROM orders
--GROUP BY account_id
--ORDER BY sum_total_amt_usd DESC;



-- the sum of sales for each account, ordered in descending order; filter where the sum is at least $250,000 (The query below will throw an error because the 'WHERE' clause does not allow aggregate functions in filtering. Solution is to use 'HAVING' instead)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		SUM(total_amt_usd) AS sum_total_amt_usd
--FROM orders
--WHERE SUM(total_amt_usd) >= 250000
--GROUP BY account_id
--ORDER BY sum_total_amt_usd DESC;




-- the sum of sales for each account, ordered in descending order; filter where the sum is at least $250,000 (Note that 'HAVING' must come after 'GROUP BY' not before)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 	account_id,
		SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY account_id
HAVING SUM(total_amt_usd) >= 250000
ORDER BY sum_total_amt_usd DESC;


-- to identify the total sales in US dollars for accounts with over $250,000 in sales to better understand the proportion of revenues that come from these acccounts
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	DISTINCT account_id,
--		channel
--FROM web_events
--ORDER BY account_id;
	

