select 
    current_day.id
from 
    Weather AS current_day
where exists (
    select 1
    from Weather AS yesterday
    where current_day.temperature > yesterday.temperature
    and current_day.recordDate = yesterday.recordDate + 1
);