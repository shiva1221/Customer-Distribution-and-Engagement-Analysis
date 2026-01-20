-- Comparing categories based on customer activity and revenue contribution to 
-- understand which categories truly drive the business. 
SELECT
    c.category_name,
    COUNT(DISTINCT o.customer_id) AS active_customers,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;
