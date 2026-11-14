SELECT payemtn_method, COUNT(*) AS orders
FROM orders
GROUP BY payment_method
ORDER BY orders DESC;

    -- This code groups by orders per payment method in descending order.

SELECT product_id, SUM(quantity) AS items_sold
FROM orders
GROUP BY product_id
ORDER BY items_sold DESC;

    -- This code groups by items sold per product (quantity only) in descending order.
    -- The 'DESC' in line 11 specifies Descending Order.

SELECT product_id, SUM(quantity) AS items_sold
FROM orders 
GROUP BY product_id 
HAVING SUM(quantity) >= 4
ORDER BY items_sold DESC;

    -- This groups items by product id and filters products that sold 4+ items in Descending Order.

SELECT city,
       COUNT(*)            AS customers,
       SUM(loyalty_member) AS loyalty_members
FROM customers
GROUP BY city 
ORDER BY customers DESC;

    -- This code selects customer by city, with average and highest price of the menu (grouping a different table)

SELECT strftime('%w', order_date) AS weekday_number,
       COUNT(*)                   AS orders
FROM orders
GROUP BY 1
ORDER BY 1; 

    -- This code groups orders by date function; orders per day-of-week (0 = Sunday).