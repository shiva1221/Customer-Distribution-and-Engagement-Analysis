-- Compare revenue contribution across cities to understand which 
-- locations are driving business performance. 
SELECT
    c.city,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;
