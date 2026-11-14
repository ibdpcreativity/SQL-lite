SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_customers FROM customers;

    -- This code counts how many orders has been received and how many customers have approached in total.

SELECT COUNT(payment_method) AS payment_recorded,
       COUNT(*)              AS all_orders
FROM orders;

    --This code counts columns and tell how many orders have a payment recorded and ingnores the order which doesn't have payment recorded.

SELECT SUM(quantity)           AS items_sold,
       ROUND(AVG(quantity), 2) AS avg_items_per_order,
       MIN(quantity)           AS smallest_order,
       MAX(quantity)           AS largest_order
FROM orders;

    -- This code helps you to estimate your total items sold, avg item sold per order and Min,Max item sold in a single order.