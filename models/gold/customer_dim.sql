{{ config(
    materialized='incremental',
    unique_key='Customer_ID',
    schema='gold'
) }}

select 
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region
from {{ ref('customer_snap') }}
where dbt_valid_to is null