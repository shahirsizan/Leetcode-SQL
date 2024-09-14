with cte as(
    select num
    from MyNumbers 
    group by num
    having count(num) = 1
)

select case when count(*) > 0 then max(num) else NULL end as num
from cte