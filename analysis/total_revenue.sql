with payments as (
    select * from {{ref('stg_payments')}}
),

revenue as (
    select 
        sum(amount) as total
    from payments
    where status = 'success'
    and amount >= 0
)

select * from revenue;