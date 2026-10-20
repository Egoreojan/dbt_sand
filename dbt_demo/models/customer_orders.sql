with customer_orders as (
    select c.customerid, concat(c.firstname,' ',c.lastname) as customername, count(o.orderid) as no_of_order
    from l1_landing.customers c
    join l1_landing.orders o on (o.CustomerID = C.CustomerId)
    group by c.customerid, customerName
    order by no_of_order desc
)

select customerid, customername, no_of_order
from customer_orders