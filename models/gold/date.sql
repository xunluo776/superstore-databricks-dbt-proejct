{{ config(materialized='table') }}
with calendar as (
    select explode(
        sequence(to_date('2014-01-01'), to_date('2017-12-31'), interval 1 day)
    ) as date_value
)

select
    date_value                                   as full_date,
    date_format(date_value, 'yyyyMMdd')::int     as date_key,
    year(date_value)                             as year,
    month(date_value)                            as month,
    day(date_value)                              as day,
    quarter(date_value)                          as quarter,
    dayofweek(date_value)                        as day_of_week,
    date_format(date_value, 'EEEE')              as day_name,
    weekofyear(date_value)                       as week_of_year,
    case 
        when dayofweek(date_value) in (1,7) then true 
        else false 
    end                                          as is_weekend
from calendar
order by date_value
