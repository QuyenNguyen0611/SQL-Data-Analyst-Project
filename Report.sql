/*
================================================================================================
Customer Report
================================================================================================
Purpose:
- This report consolidates key customer metrics and behaviors

Highlights:
1. Gather essential fields such as names, ages, and transaction details.
2. Segments cuatomers into categories (VIP, Regular, New) and age groups.
3. Aggregates customer-level metrics:  
- total orders
- total sales
- total quantity purchased
- lifespan (in months)
4. Calculates valuable KPIs:  
- recency (months since last order)
- average order value
- average monthly spend 
================================================================================================
*/
USE gold;

WITH base_query AS(
/* ---------------------------------------------------------------------------------------------
1) Base query: Retrieves core columns from tables
--------------------------------------------------------------------------------------------- */

SELECT
f.order_number,
f.order_date,
f.product_key,
f.sales_amount, 
f.quantity,
c.customer_key,
c.customer_number,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
TIMESTAMPDIFF(YEAR, c.birthdate, CURDATE()) AS age
FROM fact_sales f 
LEFT JOIN dim_customers c 
ON f.customer_key = c.customer_key
WHERE order_date AND birthdate IS NOT NULL
)
, customer_aggregation AS (
/* ---------------------------------------------------------------------------------------------
2) Customer Aggregations: Summarizes key metrics at the customer level
--------------------------------------------------------------------------------------------- */
SELECT 
customer_key,
customer_number,
customer_name, 
age,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT product_key) AS total_products,
MAX(order_date) AS last_order_date,
TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan 
FROM base_query
GROUP BY customer_key, customer_number, customer_name, age
)

SELECT
customer_key,
customer_number,
customer_name, 
age,
CASE WHEN age < 20 THEN "Under 20"
    WHEN age BETWEEN 20 AND 29 THEN "20 - 29"
    WHEN age BETWEEN 30 AND 39 THEN "30 - 39"
    WHEN age BETWEEN 40 AND 49 THEN "40 - 49"
    ELSE "50 and above"
END AS age_group,
CASE WHEN lifespan < 12 THEN "New"
    WHEN total_sales > 5000 THEN "VIP"
    ELSE "Regular"
END customer_segment,
last_order_date,
TIMESTAMPDIFF(MONTH, last_order_date, CURDATE()) AS recency,
total_orders,
total_sales,
total_quantity,
total_products,
lifespan,
-- Compuate average order value (AVO)
ROUND(CASE WHEN total_orders = 0 THEN 0
    ELSE total_sales/ total_orders 
END) AS avg_order_value,
-- Compuate average monthly spend
ROUND(CASE WHEN lifespan = 0 THEN 0
    ELSE total_sales/ lifespan
END) AS avg_monthly_spend
FROM customer_aggregation
