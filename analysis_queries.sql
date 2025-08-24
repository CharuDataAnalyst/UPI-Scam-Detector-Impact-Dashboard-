-- Fraud vs Non-fraud summary
SELECT fraud_flag, COUNT(*) AS total_txns, SUM(amount_inr) AS total_amount
FROM upi_transactions
GROUP BY fraud_flag;

-- High-risk states by fraud %
SELECT sender_state, 
       COUNT(*) FILTER (WHERE fraud_flag=1) * 100.0 / COUNT(*) AS fraud_rate
FROM upi_transactions
GROUP BY sender_state
ORDER BY fraud_rate DESC
LIMIT 10;

-- Fraud distribution by merchant category
SELECT merchant_category, COUNT(*) FILTER (WHERE fraud_flag=1) AS fraud_txns
FROM upi_transactions
GROUP BY merchant_category
ORDER BY fraud_txns DESC;

-- Time-based fraud patterns
SELECT hour_of_day, COUNT(*) FILTER (WHERE fraud_flag=1) AS fraud_txns
FROM upi_transactions
GROUP BY hour_of_day
ORDER BY hour_of_day;
