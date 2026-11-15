WITH line_totals AS (
    SELECT p.category,
           o.quantity * p.price AS line_total
    FROM orders AS o 
    JOIN products AS p ON o.product _id = p.product_id 
),
overall AS (
    SELECT SUM(line_total) AS grand_total FROM line_totals
)
SELECT 1.category,
        ROUND(SUM(l.line_total), 2)                         AS revenue,
        ROUND(100.0 * SUM(l.line_total) / o.grand_total, 1) AS pct_of_revenue 
FROM line_totals AS l
CROSS JOIN overall AS o 
GROUP BY l.category 
ORDER BY revenue DESC;

    -- Helps understand which category earns the most, and what share of the total revenue is it?

SELECT CASE WHEN c.loyalty_member = 1 THEN 'loyalty member'
            ELSE 'Non-member' END
        COUNT(*)
        order_lines,
        ROUND(AVG(o.quantity * p.price), 2)
        avg_order)value,
        ROUND(SUM(o.quantity * p.price), 2)
        total_revenue
FROM orders AS o 
JOIN customers AS c ON o.customer_id = c.customer_id 
JOIN products AS p ON o.product_id = p.product_id 
GROUP BY 1
ORDER BY avg_order_value DESC;

    -- Defines whether loyalty members spend more per order than non-members?

SELECT c.city,
       COUNT(DISTINCT c.customer_id)       AS active_customers,
       ROUND(SUM(o.quantity * p.price), 2) AS revenue
FROM orders AS o 
JOIN customers AS c ON o.customer_id = c.customer_id 
JOIN products AS p ON o.product_id = p.product_id 
GROUP BY c.city 
ORDER BY revenue DESC;

    -- Defines which city brings in the most revenue to the company?

SELECT COALESCE(payment_method, 'unknown')                        AS payment_method
       COUNT(*)                                                   AS orders,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM ORDERS), 1) AS pct_of_orders
FROM orders
GROUP BY 1 
ORDER BY orders DESC;

    -- Represents shares of orders by payment method used (NULL shown as 'unkown')

SELECT strftime('%W', o.order_date)             AS week_number,
       MIN(o.order_date)                        AS week-starts_from, 
       ROUND(SUM(o.quantity * p.price), 2)      AS revenue
FROM orders AS o 
JOIN products AS p ON o.product_id = p.product_id 
GROUP BY 1
ORDER BY 1;

    -- Represents weekly trends: revenue per week of that Month.

WITH sales AS (
    SELECT p.category,
           o.product_name,
           SUM(o.quantity) AS items_sold
    FROM orders AS o 
    JOIN products AS p ON o.product_id = p.product_id 
    GROUP BY p.product_id 
)
SELECT s.category, s.product_name, s.items_sold 
FROM sales AS  s 
WHERE s.items_sold = (SELECT MAX(items_sold)
                     FROM sales 
                     WHERE category = s.category)
ORDER BY s.items_sold DESC;

    -- Defines Best-Selling item in each category (uses GROUP BY and a JOIN back code)

SELECT c.name,
       COUNT(DISTINCT o.order_date) AS days_visited,
       COUNT(*)                     AS order_lines 
FROM orders AS o 
JOIN customers AS  c ON o.customer_id = c.customer_id 
GROUP BY c.customer_id 
HAVING COUNT(DISTINCT o.order_date) > 1
ORDER BY days_visited DESC, c.name;

    -- Informs Repeat Customers: who has ordered on nore than one day?