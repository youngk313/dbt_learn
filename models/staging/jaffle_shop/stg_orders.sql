with orders as (

    select
        id as order_id,
        user_id as customer_id,
        {{ dbt_utils.surrogate_key(['customer_id', 'order_id', 'order_date']) }} as id,
        order_date,
        status

    from {{ source('jaffle_shop', 'orders') }}

)

select * from orders