-- Understand which cities contribute the largest share of the customer base and 
-- whether customer distribution is concentrated or diversified.
WITH city_customers AS (
    SELECT
        city,
        COUNT(customer_id) AS customer_count
    FROM customers
    GROUP BY city
),
total_customers AS (
    SELECT SUM(customer_count) AS total_count
    FROM city_customers
)
SELECT
    cc.city,
    cc.customer_count,
    ROUND(cc.customer_count * 100.0 / tc.total_count, 2) AS customer_percentage
FROM city_customers cc
CROSS JOIN total_customers tc
ORDER BY customer_percentage DESC;
