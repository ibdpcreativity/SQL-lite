SELECT c.name, cat.category
FROM (SELECT name FROM customers WHERE city = 'Leeds') AS c
CROSS JOIN (SELECT DISTINCT category FROM products) AS cat 
ORDER BY c.name, cat.category;

    -- This code 'Cross Join' helps keep every customer paired with every category in the database (eg. for a "have they tried it?" campaign)

SELECT name, 'loyalty member' AS reason
FROM customers
WHERE loyalty_member = 1
UNION 
SELECT c.name, 'ordered 3+ items at once' AS reason
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id 
WHERE o.quantity >= 3;

    -- This code helps to keep one Union (one combined contact list of loyalty members and big spenders)