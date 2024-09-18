select 
    (select 
        distinct salary
    from 
        Employee
    order by 
        salary desc 
        LIMIT 1 OFFSET 1) as SecondHighestSalary

-- the outer select query is just for returning `null` if the inner query does not return anything.