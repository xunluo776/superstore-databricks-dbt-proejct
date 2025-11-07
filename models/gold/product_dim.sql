{{ 
    config(
        materialized = 'incremental',
        unique_key = 'Product_ID',
        schema = 'gold'      
    )
 }}

select
Product_ID,
Category,
Sub_Category,
Product_Name
from {{ref('product_snap')}}
where dbt_valid_to is null