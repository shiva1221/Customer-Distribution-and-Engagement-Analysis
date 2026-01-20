-- Identify cities that have a large customer base but relatively low monetization, 
-- signaling potential operational or engagement issues.
SELECT
    c.city,
    COUNT(DISTINCT o.customer_id) AS active_customers,
    ROUND(
        SUM(o.quantity * p.price) / COUNT(DISTINCT o.customer_id),
        2
    ) AS avg_revenue_per_customer
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY active_customers DESC;
