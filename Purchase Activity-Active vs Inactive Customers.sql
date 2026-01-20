-- Review customers acquired in earlier periods (such as 2022) and check whether they 
-- have shown any purchasing activity, helping evaluate basic retention health.

SELECT
    CASE
        WHEN o.customer_id IS NULL THEN 'Inactive Customers'
        ELSE 'Active Customers'
    END AS customer_status,
    COUNT(DISTINCT c.customer_id) AS customer_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE YEAR(c.join_date) = 2022
GROUP BY customer_status;

