select department.name as Department, employee.name as Employee, salary as Salary
from Employee join department on employee.departmentId = department.id
where (employee.departmentId, salary) in
    (select departmentId, max(salary)
    from employee
    group by departmentId )