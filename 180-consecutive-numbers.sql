with cte as
    (select *, lead(num,1) over() as lead1, lead(num,2) over() as lead2
    from Logs)

select distinct a.num as ConsecutiveNums 
from cte a
where a.num = a.lead1 and a.num = a.lead2