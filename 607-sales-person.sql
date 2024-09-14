select name 
from SalesPerson
where sales_id NOT IN (
    select sales_id 
    from Orders join company ON Orders.com_id = company.com_id 
    where company.name = 'RED'
)