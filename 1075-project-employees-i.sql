select Project.project_id, round(avg(Employee.experience_years), 2) as average_years 
from Project left join Employee using(employee_id)
group by Project.project_id