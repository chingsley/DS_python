
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