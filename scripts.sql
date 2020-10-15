
-- * Write a query to return the 10 earliest orders in the orders table. Include the id , occurred_at, and total_amt_usd .
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- SELECT "id", "occurred_at", "total_amt_usd"
-- FROM "orders"
-- ORDER BY "occurred_at"
-- LIMIT 10;


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















--===========================================================================
--						            JOINS
--===========================================================================

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




--7.  What are the different channels used by account id 1001 ? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT DISTINCT a.name, w.channel
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.id = '1001';











-- ==============================================================
--							BETWEEN
--===============================================================

--8. Find all the orders that occurred in 2015 . Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
--FROM orders o
--JOIN accounts a
--ON o.account_id = a.id
--WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01'
--ORDER BY o.occurred_at;


--count the total number of orders made in December 2016
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT COUNT(*) AS order_count
--FROM orders
--WHERE occurred_at
--	BETWEEN '2016-12-01' AND '2017-01-01';












-- ==============================================================
--							NULL
--===============================================================
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
	
	

	
	







-- ==============================================================
--							SUM
--===============================================================

-- total up all sales of each paper type for comparison
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT SUM(standard_qty) AS standard,
--		SUM(gloss_qty) AS gloss,
--		SUM(poster_qty) AS poster
--FROM orders;



-- Find the total dollar amount of sales using the total_amt_usd in the orders table.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT SUM(total_amt_usd) AS total_dollar_sales
--FROM orders;


--  Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table. (ie. Find the total amount for each individual order that was spent on standard and gloss paper in the orders table.)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	id,
--		standard_amt_usd + gloss_amt_usd AS total_standard_gloss
--FROM orders;


--   Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator. (Though the price/standard_qty paper varies from one order to the next, for this exercise, compute the ratio across all of the sales made in the orders table
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	SUM(standard_qty) AS total_std_qty,
--		SUM(standard_amt_usd) AS total_std_amt,
--		SUM(standard_amt_usd) / SUM(standard_qty) AS std_price_per_unit_qty
--FROM orders;












-- ==============================================================
--							MIN MAX
--===============================================================
-- example Usage
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


-- When was the earliest order ever placed? You only need to return the date:
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- METHOD 1 - using aggregation function (MIN)
----------------------------------------------------
--SELECT MIN(occurred_at) AS occurred_at
--FROM orders;

-- METHOD 2 - without using aggregation function
----------------------------------------------------
--SELECT 	occurred_at
--FROM orders
--ORDER BY occurred_at
--LIMIT 1;


-- When did the most recent (latest) web_event occur?:
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

---- -- METHOD 1 - using aggregation function (MAX)
----^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT MAX(occurred_at) AS occurred_at
--FROM web_events;
--
---- -- METHOD 2 - without using aggregation function
----^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--SELECT 	occurred_at
--FROM web_events
--ORDER BY occurred_at DESC
--LIMIT 1;













-- ==============================================================
--							GROUP BY / DISTINCT
--===============================================================

-- Example Usage
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
--SELECT 	account_id,
--		count(DISTINCT channel) AS no_of_channels,
--		count(id) AS events
--FROM web_events
--GROUP BY account_id
--ORDER BY account_id;


-- grouping by multiple columns
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		channel,
--		count(id) AS events
--FROM web_events
--GROUP BY account_id, channel
--ORDER BY account_id, events DESC;
	



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
--SELECT 	account_id,
--		SUM(total_amt_usd) AS sum_total_amt_usd
--FROM orders
--GROUP BY account_id
--HAVING SUM(total_amt_usd) >= 250000
--ORDER BY sum_total_amt_usd DESC;


-- to identify the total sales in US dollars for accounts with over $250,000 in sales to better understand the proportion of revenues that come from these acccounts.    
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		SUM(total_amt_usd) AS sum_total_amt_usd
--FROM orders
--GROUP BY account_id
--HAVING SUM(total_amt_usd) >= 250000
--ORDER BY sum_total_amt_usd DESC;










--===========================================================================
--						            CASE
--===========================================================================
-- generating derived columns. This can be achieved using 'arithmetic' or the 'CASE' statement

-- EXAMPLE 1 (no 'ELSE' returns null where the condition if false)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT	id,
--		account_id,
--		occurred_at,
--		channel,
--		CASE WHEN channel = 'facebook' THEN 'yes' END AS is_facebook
--FROM web_events
--ORDER BY occurred_at;	



-- EXAMPLE 2 (use 'ELSE' to return something else other than null when the condition if false)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT	id,
--		account_id,
--		occurred_at,
--		channel,
--		CASE WHEN channel = 'facebook' THEN 'yes' ELSE 'no' END AS is_facebook
--FROM web_events
--ORDER BY occurred_at;


-- EXAMPLE 3 (using 'CASE' with multiple conditions, use OPERATORS such as OR, AND, LIKE, IN, etc)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT	id,
--		account_id,
--		occurred_at,
--		channel,
--		CASE WHEN channel = 'facebook' OR channel = 'direct' THEN 'yes' ELSE 'no' END AS is_facebook
--FROM web_events
--ORDER BY occurred_at;


-- grouping by channels
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^----
--SELECT	channel,
--		COUNT(id)
--FROM web_events
--GROUP BY channel;


-- grouping by channel for special comparison. E.G To compare facebook as a marketing channel against all other channels. You know facebook is a great channel for your businees, but is better than all the rest combined?. Write a query to determine that.
-- Inorder to answer this question, you'll need to create a derived column.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT	CASE WHEN channel = 'facebook' THEN 'facebook' ELSE 'others' END AS channel_type,
--		COUNT(id)
--FROM web_events
--GROUP BY channel_type;



-- to classify orders into general groups based on order size for inventory planning
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	account_id,
--		occurred_at,
--		total,
--		CASE WHEN total > 500 THEN 'Over 500'
--			 WHEN total > 300 AND total <= 500 THEN '301 - 500'
--			 WHEN total > 100 AND total <= 300 THEN '101 - 300'
--			 ELSE '100 or under' END AS total_group
--FROM orders;



-- to classify orders into general groups based on order size and count up all the orders in each group for inventory planning
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--SELECT 	CASE WHEN total > 500 THEN 'Over 500'
--			 WHEN total > 300 AND total <= 500 THEN '301 - 500'
--			 WHEN total > 100 AND total <= 300 THEN '101 - 300'
--			 ELSE '100 or under' END AS total_group,
--		count(*) AS order_count_in_grp	
--FROM orders
--GROUP BY total_group;






--===========================================================================
--						       AVERAGE / MEDIAN
--===========================================================================
-- AVG - note AVG does not treat NULL values as zero in the calculation. If you want to include null value in the count as denominator when calculatin average, you will have use total/count
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT AVG(standard_qty) AS standard_avg,
		AVG(gloss_qty) AS gloass_avg,
		AVG(poster_qty) AS poster_avg
FROM orders;



--  Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, AVG(poster_qty) mean_poster,
		AVG(standard_amt_usd) mean_standard_amt, AVG(gloss_amt_usd) mean_gloss_amt,
		AVG(poster_amt_usd) mean_poster_amt 
FROM orders;



--  what is the MEDIAN total_usd spent on all orders?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT *
FROM   (SELECT total_amt_usd 
		FROM orders
		ORDER BY total_amt_usd
		LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

---- EXPLANATION FOR THE MEDIAN SOLUTION ABOVE
----Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when
----ordered. This is the average of 2483.16 and 2482.55. This gives the median of 2482.855. This
----obviously isn't an ideal way to compute. If we obtain new orders, we would have to change the
----limit. SQL didn't even calculate the median for us. The above used a SUBQUERY, but you could
----use any method to nd the two necessary values, and then you just need the average of them.









-- ==============================================================
--							QUIZ ( GROUP BY )
--===============================================================

--  1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.name, o.occurred_at
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
ORDER BY o.occurred_at
LIMIT 1;


-- OR --
SELECT a.name, MIN(o.occurred_at) earliest_occurred_at
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY a.name
ORDER BY earliest_occurred_at
LIMIT 1;


--  2. Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.name account_name, SUM(o.total_amt_usd) total_sales_in_usd
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY a.name
ORDER BY a.name;



--  3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
	ON w.account_id = a.id
ORDER BY w.occurred_at DESC
LIMIT 1;

-- OR --
SELECT MAX(w.occurred_at) occurred_at, w.channel, COUNT(w.channel) channel_count, a.name account_name
FROM web_events w
JOIN accounts a
	ON w.account_id = a.id
GROUP BY a.name, w.channel
ORDER BY occurred_at DESC
LIMIT 1;


--  4. Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT channel, COUNT(channel) no_of_times
FROM web_events
GROUP BY channel;

-- OR --
SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;


--  5.  Who was the primary contact associated with the earliest web_event?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT w.occurred_at, w.channel, a.name account_name, a.primary_poc
FROM web_events w
JOIN accounts a
	ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;


--  6.  What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.name account_name, MIN(o.total_amt_usd) total_amnt_usd
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY a.name
ORDER BY total_amnt_usd;



--  7.  Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT r.name region, COUNT(s.name) number_of_sales_rep
FROM sales_reps s
JOIN region r
	ON s.region_id = r.id
GROUP BY region
ORDER BY number_of_sales_rep;

-- OR --
SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;













-- ============================================================================
-- 			   GROUP BY (PART II) => GROUPING BY MULTIPLE COLUMNS
-- ============================================================================


--  1.  For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account. 
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 
	a.name account_name,
	AVG(o.standard_qty) avg_std_qty,
	AVG(o.gloss_qty) avg_gloss_qty,
	AVG(o.poster_qty) avg_poster_qty
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY account_name;



--  2.  For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type. 
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 
	a.name account_name,
	AVG(o.standard_amt_usd) avg_std_amt,
	AVG(o.gloss_amt_usd) avg_gloss_amt,
	AVG(o.poster_amt_usd) avg_poster_amt
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
GROUP BY account_name;



--  3.   Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 
	s.name sales_rep_name,
	w.channel channel,
	COUNT(*)
FROM web_events w
JOIN accounts a
	ON w.account_id = a.id
JOIN sales_reps s
	ON a.sales_rep_id = s.id
GROUP BY sales_rep_name, channel
ORDER BY count DESC;




--  4.   Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first..
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 
	r.name region,
	w.channel channel,
	COUNT(*)
FROM web_events w
JOIN accounts a
	ON w.account_id = a.id
JOIN sales_reps s
	ON a.sales_rep_id = s.id
JOIN region r
	ON s.region_id = r.id
GROUP BY region, channel
ORDER BY count DESC;











-- ============================================================================
-- 			                         DISTICT
-- ============================================================================
-- NOTE: DISTINCT is an Aggregation method
-- (It’s worth noting that using DISTINCT, particularly in aggregations, can slow your queries down quite abit.)
----------------------------------------------------------------------------



--  1. Use DISTINCT to test if there are any accounts associated with more than one region..
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
---------------------------------------------------------------------
-- The below two queries have the same number of resulting rows (351), so we know that every account is associated with only one region. If each account was associated with more than one region, the rst query should have returned more rows than the second query.
---------------------------------------------------------------------
SELECT a.name account, r.name region
FROM accounts a
JOIN sales_reps s
	ON a.sales_rep_id = s.id
JOIN region r
	ON s.region_id = r.id;
	
	
SELECT DISTINCT id, name
FROM accounts;
	


--  2. Have any sales reps worked on more than one account?.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
---------------------------------------------------------------------
-- Actually all of the sales reps have worked on more than one account. The fewest number of accounts any sales rep works on is 3. There are 50 sales reps, and they all have more than one account. Using DISTINCT in the second query assures that all of the sales reps are accounted for in the rst query.
---------------------------------------------------------------------
SELECT s.id, s.name sales_rep, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
	ON a.sales_rep_id = s.id
GROUP BY s.id, s.name
ORDER BY num_accounts;


SELECT DISTINCT id, name
FROM sales_reps;













-- ============================================================================
-- 			                         HAVING
-- ============================================================================
--  Essentially, any time you want to perform a WHERE on an element of your query that was created by an aggregate, you need to use HAVING instead.
------------------------------------------------------------------------------


--  1. How many of the sales reps have more than 5 accounts that they manage?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT s.id, s.name sales_rep_name, count(*) no_of_accounts
FROM sales_reps s
JOIN accounts a
	ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING count(*) >= 5
ORDER BY no_of_accounts;
-- answer: 37 sales reps [ because 37 rows were returned ]


-- OR -- to return just the count
SELECT count(*)
FROM	(
			SELECT s.id, s.name sales_rep_name, count(*) no_of_accounts
			FROM sales_reps s
			JOIN accounts a
				ON s.id = a.sales_rep_id
			GROUP BY s.id, s.name
			HAVING count(*) >= 5
			ORDER BY no_of_accounts
		) AS table1;
		
		
--  2. How many accounts have more than 20 orders?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name account_name, count(*) no_of_orders
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING count(*) > 20
ORDER BY no_of_orders;
-- answer: 120 accounts [ because 120 rows were returned ]



--  3. Which account has the most orders?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name account_name, count(*) no_of_orders
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY no_of_orders DESC
LIMIT 1;



--  4. Which accounts spent more than 30,000 usd total across all orders?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;


--  5. Which accounts spent less than 1,000 usd total across all orders?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;



--  6. Which account has spent the most with us?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;



--  7.  Which account has spent the least with us?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;


--  8.   Which accounts used facebook as a channel to contact customers more than 6 times?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, count(w.channel) count_facebook_usage
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name
HAVING count(w.channel) > 6
ORDER BY count_facebook_usage;

-- OR --
SELECT a.id, a.name, w.channel, count(w.channel) count_facebook_usage
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING count(w.channel) > 6 AND w.channel = 'facebook'
ORDER BY count_facebook_usage;



--  9.  Which account used facebook most as a channel?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, w.channel, count(w.channel) count_facebook_usage
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING w.channel = 'facebook'
ORDER BY count_facebook_usage DESC
LIMIT 1;

-- OR --
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;
--------------------------------------------------------------------
--Note: This query above only works if there are no ties for the account that used facebook the most. It is a best practice to use a larger limit number rst such as 3 or 5 to see if there are ties before using LIMIT 1.
--------------------------------------------------------------------



--  10.  Which channel was most frequently used by most accounts?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;

-- because all of the top 10 are most frequently used are 'direct' channels
-- Also, note that 5298 accounts use the 'direct' channle' shown by query below: --

SELECT w.channel, count(*) usage_frequency
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY w.channel
ORDER BY usage_frequency DESC
LIMIT 1;









--===========================================================================
--						        DATE Functions
--===========================================================================

-- aggregating by date field. E.g Sum the quanities of standard paper by day   
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT 	DATE_TRUNC('day', occurred_at) AS day,
		SUM(standard_qty) AS sum_standard_qty_per_day
FROM orders
GROUP BY DATE_TRUNC('day', occurred_at)
ORDER BY DATE_TRUNC('day', occurred_at);



-- to pull out a given part of the date; for e.g to know what day of the week partch_and_posey's website sees the most traffic you'll have to use DATE_PART - which allows you pull the part of the date you're interested in. But notice that regardless of year, a DATE_PART will provide the same month for events that happened in say April 2016 and April 2017, while a DATE_TRUNC will differentiate such dates;

-- To answer the question, on what day of the week are the most sales made?
-- Note: 'dow' stands for 'day of week' it returns a value from 0 to 6, where 0 is sunday and 6 is saturday.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT DATE_PART('dow', occurred_at) AS day_of_week,
		SUM(total) total_qty
FROM orders
GROUP BY day_of_week
ORDER BY total_qty DESC;


-- Find the sales in terms of total dollars for all orders in each year , ordered from greatest to least. Do you notice any trends in the yearly sales totals?
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
SELECT DATE_TRUNC('year', occurred_at) "year", SUM(total_amt_usd) total_dollar_amt
FROM orders
GROUP BY DATE_TRUNC('year', occurred_at)
ORDER BY total_dollar_amt DESC;











