{{ config(
    materialized = 'incremental',
    unique_key   = 'row_id',
    schema       = 'gold'
) }}

-- 1️⃣  Base sales data from Silver
WITH src AS (
    SELECT
        row_id,
        Order_ID,
        Order_Date,
        Customer_ID,
        Product_ID,
        Sales,
        Quantity,
        Discount,
        Profit
    FROM {{ ref('superstore') }}
)

-- 2️⃣  Final fact table output (no SCD2 join)
SELECT
    row_id,
    Order_ID,
    Order_Date,
    Customer_ID,
    Product_ID,
    Sales,
    Quantity,
    Discount,
    Profit
FROM src
{% if is_incremental() %}
WHERE Order_Date > (SELECT COALESCE(MAX(Order_Date), '1900-01-01') FROM {{ this }})
{% endif %}
