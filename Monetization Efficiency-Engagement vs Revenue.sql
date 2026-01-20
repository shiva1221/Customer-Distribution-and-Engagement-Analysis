-- Identifying categories that receive significant customer interaction but fail to generate 
-- proportional revenue, indicating pricing or product strategy issues.
SELECT
    c.category_name,
    COUNT(DISTINCT o.customer_id) AS active_customers,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue,
    ROUND(
        SUM(o.quantity * p.price) / COUNT(DISTINCT o.customer_id),
        2
    ) AS revenue_per_customer
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY active_customers DESC;