{{ config(materialized='incremental', unique_key='order_id') }}
select
*
from {{source('bronze', 'superstore')}}
{% if is_incremental() %}
where date_added >=  (select max(date_added) from {{this}})
{% endif %}