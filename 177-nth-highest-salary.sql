CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (

    with cte as(
        select e.*, dense_rank() over(order by e.salary desc) as rankk
        from Employee e
    )

    select distinct COALESCE(a.salary, NULL) 
    from cte a
    where a.rankk = N

  );
END;
$$ LANGUAGE plpgsql;

-- when using CTE, it's a good practice to denote each table with an alias. 
-- so that no ambiguity arises.