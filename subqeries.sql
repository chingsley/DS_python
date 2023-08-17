
-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SELECT sub2.region, sub2.total_amt, sub3.sales_rep
FROM (
	(SELECT region, MAX(total_usd)  total_amt
		FROM
			(SELECT r.name region, s.name sales_rep, SUM(o.total_amt_usd) total_usd -- o.id order_id, o.account_id, a.sales_rep_id
			FROM "orders" o
			JOIN "accounts" a
				ON a.id = o.account_id
			JOIN "sales_reps" s
				ON a.sales_rep_id = s.id
			JOIN "region" r
				ON s.region_id = r.id
			GROUP BY r.name, s.name, s.id) sub1
		GROUP BY region) sub2
	
	JOIN
	
	(SELECT r.name region, s.name sales_rep, SUM(o.total_amt_usd) total_usd -- o.id order_id, o.account_id, a.sales_rep_id
		FROM "orders" o
		JOIN "accounts" a
			ON a.id = o.account_id
		JOIN "sales_reps" s
			ON a.sales_rep_id = s.id
		JOIN "region" r
			ON s.region_id = r.id
		GROUP BY r.name, s.name) sub3
	
	ON sub2.region = sub3.region AND sub2.total_amt = sub3.total_usd
)



--  For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SELECT COUNT(sub1.id) total_count_orders, SUM(sub1.total_amt_usd) total_amt_usd, sub1.region_id
FROM
(
	SELECT o.id, o.total_amt_usd, o.account_id,
		   a.sales_rep_id, s.region_id
	FROM orders o
	JOIN accounts a
		ON a.id = o.account_id
	JOIN sales_reps s
		ON a.sales_rep_id = s.id
) sub1
GROUP BY sub1.region_id
ORDER BY total_amt_usd DESC
LIMIT 1
--=================================
-- ANSWER: 2357
--=================================


-- OR -- 


SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
	 SELECT MAX(total_amt)
	 FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
	 FROM sales_reps s
	 JOIN accounts a
	 ON a.sales_rep_id = s.id
	 JOIN orders o
	 ON o.account_id = a.id
	 JOIN region r
	 ON r.id = s.region_id
	 GROUP BY r.name) sub);
--=================================
-- ANSWER: 2357
--=================================
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
