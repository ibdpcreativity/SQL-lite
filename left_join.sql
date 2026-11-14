SELECT c.name,
        COUNT(o.order_id) AS orders_placed
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY orders_placed ASC, c.name;

    -- This code helps keep and select the customers who have joined by hasn't ordered an products yet.

SELECT c.name, c.email
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL;

    -- This code keeps 'LEFT JOIN' and adds 'IS NULL', customers who have never ordered.