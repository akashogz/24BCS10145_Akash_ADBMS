SELECT *
FROM (
    SELECT
        customer_id,
        total_purchase_value,
        DENSE_RANK() OVER (
            ORDER BY total_purchase_value DESC
        ) AS customer_rank
    FROM customer_purchase
) t
WHERE customer_rank <= 5;