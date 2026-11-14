SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;

    -- This code lists the 3 most expensive items from highest to lowest.

SELECT product_name,
    price,
    CASE 
        WHEN price < 3.00 THEN 'Budget'
        WHEN price < 5.00 THEN 'Standard'
        ELSE 'Prermium'
    END AS price_band
FROM products
ORDER BY price;

    -- This code labels each product based on their price in three different band (Budget, Standard, Premium).
