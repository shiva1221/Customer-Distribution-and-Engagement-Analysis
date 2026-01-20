-- Highlighting the categories that contribute the most to overall 
-- revenue and deserve continued focus. 
SELECT
    c.category_name,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;
