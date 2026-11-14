WITH order_totals AS (
    SELECT o.order_id,
           o.customer_id,
           o.order_date,
           o.payment_method,
           p.category,
           o.quantity * p.price AS line_total
    FROM orders AS o 
    JOIN products AS p ON o.prduct_id = p.product_id 
)
SELECT category,
        COUNT(*)                  AS orders_lines,
        ROUND(SUM(line_total), 2) AS revenue,
        ROUND(AVG(line_total), 2) AS avg_line_value
FROM order_totals
GROUP BY category
ORDER BY revenue DESC;

    -- This WITH (a temporary table) clause helps build "order line totals" once, reuse it.