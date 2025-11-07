{{ config(
    materialized = 'incremental',
    unique_key = 'row_id'
) }}

SELECT
    CAST(Row_ID AS INT) AS Row_ID,
    CAST(Order_ID AS STRING) AS Order_ID,
    CAST(Order_Date AS DATE) AS Order_Date,
    CAST(Ship_Date AS DATE) AS Ship_Date,
    CAST(Ship_Mode AS STRING) AS Ship_Mode,
    CAST(Customer_ID AS STRING) AS Customer_ID,
    CAST(Customer_Name AS STRING) AS Customer_Name,
    CAST(Segment AS STRING) AS Segment,
    CAST(Country AS STRING) AS Country,
    CAST(City AS STRING) AS City,
    CAST(State AS STRING) AS State,
    CAST(Postal_Code AS INT) AS Postal_Code,
    CAST(Region AS STRING) AS Region,
    CAST(Product_ID AS STRING) AS Product_ID,
    CAST(Category AS STRING) AS Category,
    CAST(`Sub-Category` AS STRING) AS Sub_Category,
    CAST(Product_Name AS STRING) AS Product_Name,
    CAST(Sales AS DOUBLE) AS Sales,
    CAST(Quantity AS INT) AS Quantity,
    CAST(Discount AS DOUBLE) AS Discount,
    CAST(Profit AS DOUBLE) AS Profit,
    date_added,
    date_updated
FROM {{ source('bronze', 'superstore') }}

{% if is_incremental() %}
WHERE date_added > (SELECT MAX(date_added) FROM {{ this }})
{% endif %}
