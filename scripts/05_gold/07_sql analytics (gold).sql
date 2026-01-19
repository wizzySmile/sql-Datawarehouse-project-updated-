-- Advance Data Analytics

-- Change over-time Analysis
SELECT 
YEAR(order_date) AS year_orderdate,
MONTH(order_date) AS month_orderdate,
SUM(sales_amount)AS current_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT customer_key) AS total_customer
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
YEAR(order_date),
MONTH(order_date)
ORDER BY
YEAR(order_date),
MONTH(order_date)


-- Cumulative Analysis

-- Calculate the total sales per month and 
-- the running total of sales over time
SELECT 
year_order,
month_order,
current_sales,
SUM(current_sales) OVER(PARTITION BY year_order ORDER BY month_order) AS running_total
FROM
(
SELECT 
YEAR(order_date) AS year_order,
MONTH(order_date) AS month_order,
SUM(sales_amount) AS current_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
)t

-- Analyze the yearly performance of products by comparing their sales
-- to both the average sales performance of the product and the previous year's sales
-- and find the difference between current sales and previous sales
WITH yearly_product_sales AS
(
SELECT 
YEAR(s.order_date) AS order_date,
p.product_name,
SUM(s.sales_amount) AS current_sales,
AVG(s.sales_amount) AS avg_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
	ON s.product_key = p.product_key
WHERE s.order_date IS NOT NULL
GROUP BY 
YEAR(s.order_date),
p.product_name
)
SELECT 
order_date,
product_name,
current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) AS avg_sales,
current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
CASE 
	WHEN (current_sales - AVG(current_sales) OVER(PARTITION BY product_name)) > 0 THEN 'Above average'
	WHEN (current_sales - AVG(current_sales) OVER(PARTITION BY product_name)) < 0 THEN 'Below average'
	WHEN (current_sales - AVG(current_sales) OVER(PARTITION BY product_name)) = 0 THEN 'Average'
	ELSE  'No previous year sales'
END AS avg_change,
lAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_date ) AS py_sales,
(current_sales - lAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_date)) AS diff_py,
-- Year-over-year Analysis
CASE 
	WHEN (current_sales - lAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_date)) > 0 THEN 'Increasing'
	WHEN (current_sales - lAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_date)) < 0 THEN 'Decreasing'
	WHEN (current_sales - lAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_date)) = 0 THEN 'Equal'
	ELSE  'No py sales'
END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_date

-- Part-to-whole Analysis

-- Which categories contribute the most to overall sales?
WITH cat_sales AS 
(SELECT 
category,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
	LEFT JOIN gold.dim_products p
		ON s.product_key = p.product_key
GROUP BY category
)
SELECT 
category,
total_sales,
SUM(total_sales) OVER() AS overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT)/SUM(total_sales) OVER()) *100, 2),'%') AS percentage_total
FROM cat_sales
GROUP BY
category,
total_sales
ORDER BY total_sales DESC

-- Data segmentation Analysis

-- Segment products into cost ranges and
-- count how many products fall into each segment
-- WITH SUBQUERY
SELECT 
cost_range,
COUNT(*) AS range_count
FROM
(
SELECT 
product_key,
product_name,
cost,
CASE
	WHEN cost < 100 THEN 'Below 100'
	WHEN cost >= 100 AND cost < 500 THEN '100-499'
	WHEN cost >= 500 AND cost < 1000 THEN '500-999'
	ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products
)t
GROUP BY cost_range
ORDER BY range_count DESC

-- WITH CTE
WITH product_segment AS
(
SELECT 
product_key,
product_name,
cost,
CASE
	WHEN cost < 100 THEN 'Below 100'
	WHEN cost >= 100 AND cost < 500 THEN '100-499'
	WHEN cost >= 500 AND cost < 1000 THEN '500-999'
	ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products
)
SELECT 
cost_range,
COUNT (*) AS range_count
FROM product_segment
GROUP BY cost_range
ORDER BY range_count DESC

/* Group customers into three segments based on their spending behaviour:
	- VIP: Customers with at least 12 months of history and spending more than $5,000.
	- Regular: Customers with at least 12 months of history but spending $5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/

WITH customer_spending  AS
(
SELECT 
c.customer_key,
c.first_name,
c.last_name,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
SUM(sales_amount) AS total_sales,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
FROM gold.fact_sales s	
	LEFT JOIN gold.dim_customers c
		ON	s.customer_key = c.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
),
count_segment AS
(
SELECT 
DISTINCT customer_key,
first_name,
last_name,
lifespan,
total_sales,
CASE 
	WHEN lifespan >= 12  AND total_sales >= 5000
		THEN 'VIP'
	WHEN lifespan >= 12  AND total_sales < 5000
		THEN 'Regular'
	ELSE 'New'
END AS 	customer_segment
FROM customer_spending
)
SELECT 
customer_segment,
COUNT(customer_key) AS total_customer
FROM count_segment
GROUP BY customer_segment
ORDER BY total_customer DESC






