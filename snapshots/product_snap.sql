{% snapshot product_snap %}
{{ config(
    target_schema='dim_history',
    unique_key='Product_ID',
    strategy='check',
    check_cols=[
        'Category',
        'Sub_Category',
        'Product_Name'
    ]
) }}


WITH last_snapshot_date AS (
    SELECT COALESCE(MAX(dbt_valid_from), '1900-01-01') AS max_date
    FROM {{ this }}
),


new_data AS (
    SELECT s.*
    FROM {{ ref('superstore') }} AS s, last_snapshot_date
    WHERE s.date_added > last_snapshot_date.max_date
),


latest AS (
    SELECT
        Product_ID,
        MAX(row_id) AS max_row_id
    FROM new_data
    GROUP BY Product_ID
)


SELECT
    s.Product_ID,
    s.Category,
    s.`Sub-Category` AS Sub_Category,
    s.Product_Name
FROM new_data AS s
JOIN latest AS l
  ON s.Product_ID = l.Product_ID
 AND s.row_id = l.max_row_id

{% endsnapshot %}
