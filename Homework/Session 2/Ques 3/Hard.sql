WITH ordered_txns AS (
    SELECT
        transaction_id,
        merchant_id,
        credit_card_id,
        amount,
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id, credit_card_id, amount
            ORDER BY transaction_timestamp
        ) AS prev_timestamp
    FROM transactions
)

SELECT COUNT(*) AS payment_count
FROM ordered_txns
WHERE prev_timestamp IS NOT NULL
  AND transaction_timestamp - prev_timestamp <= INTERVAL '10 minutes';