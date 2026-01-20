-- Examine which product categories perform best within each city 
-- to understand local preferences and strengths.
WITH city_category_revenue AS (
    SELECT
        c.city,
        cat.category_name,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    JOIN categories cat
        ON p.category_id = cat.category_id
    GROUP BY c.city, cat.category_name
)
SELECT
    city,
    category_name,
    ROUND(total_revenue, 2) AS total_revenue
FROM (
    SELECT
        city,
        category_name,
        total_revenue,
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_revenue DESC) AS rn
    FROM city_category_revenue
) t
WHERE rn = 1
ORDER BY city;
