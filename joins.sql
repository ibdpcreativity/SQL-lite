SELECT o.order_id,
       c.name,
       p.product_name,
       o.quantity,
       o.order_date
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id 
JOIN products  AS p ON O.PRODUCT_id  = p.product_id 
ORDER BY  o.order_id
LIMIT 10;

    -- This code orders 10 orders by order id and lists the customer's name and the products included in the order.

SELECT p.product_name,
       SUM(o.quantity)                     AS items_sold,
       ROUND(SUM(o.quantity * p.price), 2) AS revenue
FROM orders AS o 
JOIN products AS p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

    -- This code intergrates the above Join code and aggregate code to find revenue per product (quantity * price)

SELECT c.name,
       c.city,
       ROUND(SUM(o.quantity * p.price), 2) AS total_spent
FROM orders AS o 
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN products AS p ON o.products_id  = p.product_id 
GROUP BY c.customer_id 
ORDER BY total_spent DESC 
LIMIT 5;