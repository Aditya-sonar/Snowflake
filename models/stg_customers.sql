-- This is a 'staging' model to clean up raw customer data
WITH raw_customers AS (
    SELECT 
        id AS customer_id,
        first_name,
        last_name
    FROM {{ source('raw', 'customers') }}
)

SELECT 
    customer_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM raw_customers
