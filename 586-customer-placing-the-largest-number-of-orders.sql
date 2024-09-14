with cte as(
    select customer_number, count(order_number) as number_of_orders
    from Orders
    group by customer_number
)

select customer_number
from cte
where number_of_orders = (select max(number_of_orders) from cte)