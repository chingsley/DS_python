
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
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adword') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01';



