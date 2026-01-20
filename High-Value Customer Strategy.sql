-- Segment customers based on the total revenue they generate and identify the 
-- highest-value customers who contribute most to the business. 
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_revenue, 2) AS total_revenue,
    CASE
        WHEN total_revenue >= 30000 THEN 'High-Value Customer'
        WHEN total_revenue >= 15000 THEN 'Medium-Value Customer'
        ELSE 'Low-Value Customer'
    END AS customer_segment
FROM customer_revenue
ORDER BY total_revenue DESC;
