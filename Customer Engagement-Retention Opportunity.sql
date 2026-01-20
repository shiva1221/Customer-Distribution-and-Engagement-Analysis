-- Assess the quality of customer engagement by identifying how
--  many users interact only once versus those who return.
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time Customers'
        ELSE 'Returning Customers'
    END AS customer_type,
    COUNT(customer_id) AS number_of_customers
FROM customer_orders
GROUP BY customer_type;
