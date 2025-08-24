1. Create Table Schema
CREATE TABLE upi_transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL,
    transaction_type VARCHAR(20),
    merchant_category VARCHAR(50),
    amount_inr NUMERIC(12,2),
    transaction_status VARCHAR(20),
    sender_age_group VARCHAR(20),
    receiver_age_group VARCHAR(20),
    sender_state VARCHAR(50),
    sender_bank VARCHAR(50),
    receiver_bank VARCHAR(50),
    device_type VARCHAR(20),
    network_type VARCHAR(20),
    fraud_flag INT,
    hour_of_day INT,
    day_of_week VARCHAR(20),
    is_weekend BOOLEAN
);

2. Load CSV into PostgreSQL
\copy upi_transactions(
    transaction_id,
    timestamp,
    transaction_type,
    merchant_category,
    amount_inr,
    transaction_status,
    sender_age_group,
    receiver_age_group,
    sender_state,
    sender_bank,
    receiver_bank,
    device_type,
    network_type,
    fraud_flag,
    hour_of_day,
    day_of_week,
    is_weekend
)
FROM 'C:/path_to/upi_transactions_2024.csv'
DELIMITER ',' CSV HEADER;

