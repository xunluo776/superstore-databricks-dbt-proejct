{% snapshot customer_snap %}
{{ config(
    target_schema='dim_history',
    unique_key='Customer_ID',
    strategy='check',
    check_cols=[
        'Customer_Name',
        'Segment',
        'Country',
        'City',
        'State',
        'Postal_Code',
        'Region'
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
        Customer_ID,
        MAX(row_id) AS max_row_id
    FROM new_data
    GROUP BY Customer_ID
)


SELECT
    s.Customer_ID,
    s.Customer_Name,
    s.Segment,
    s.Country,
    s.City,
    s.State,
    s.Postal_Code,
    s.Region
FROM new_data s
JOIN latest l
  ON s.Customer_ID = l.Customer_ID
 AND s.row_id = l.max_row_id

{% endsnapshot %}
