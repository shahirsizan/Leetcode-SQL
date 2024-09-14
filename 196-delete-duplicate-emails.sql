with duplicatesTableCTE as (
    select id
    from (
        select 
            id,
            email,
            ROW_NUMBER() over (partition by email order by id) as row_number
        from Person
    ) as subquery
    where row_number > 1
)

delete from 
    Person
where 
    id in (select id from duplicatesTableCTE);
